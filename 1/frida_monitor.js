// Monitor + Fix: intercept updateItemInBag NULL→inject SaveItem
'use strict';
const MODULE = "libgame_logic.so";
const mod = Process.findModuleByName(MODULE);

// Capture last one_t merge values
let lastItemId = 0;
let lastItemCount = 0;
let updateNullCount = 0;

function hookExact(name, cb) {
    for (const exp of mod.enumerateExports()) {
        if (exp.name === name) {
            try { Interceptor.attach(exp.address, cb); send(`[+] ${name.split('::').pop()}`); return true; }
            catch(e) { send(`[!] ${name}: ${e.message}`); return false; }
        }
    }
    send(`[-] ${name} not found`); return false;
}

// === Capture one_t data ===
hookExact("_ZN14ISeer20CSProto37cli_notify_item_bag_updates_out_one_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE", {
    onEnter(a) { this.msg = a[0]; },
    onLeave(r) {
        const m = this.msg;
        const id = m.add(8).readU32();
        const cnt = m.add(12).readU32();
        if (id > 0) { lastItemId = id; lastItemCount = cnt; }
        send(`[ONE_T] ret=${r} id=${id} cnt=${cnt}`);
    }
});

// === FIX: replace NULL in updateItemInBag ===
let g_UserData = null;
hookExact("_ZN8UserData15updateItemInBagERK8SaveItemPKc", {
    onEnter(a) {
        g_UserData = a[0];
        const si = a[1]; // const SaveItem&

        if (si.isNull()) {
            updateNullCount++;
            // Allocate SaveItem and fill with captured data
            const newSi = Memory.alloc(32);
            for (let i = 0; i < 32; i += 4) newSi.add(i).writeU32(0);
            newSi.add(0).writeU32(1);   // grid_id? or flags
            newSi.add(4).writeU32(1);   // grid_id?
            newSi.add(8).writeU32(lastItemId || 20081);
            newSi.add(12).writeU32(lastItemCount || 1);
            // Change r1 to point to our buffer
            a[1] = newSi;
            // Verify the change took effect
            const r1 = this.context.r1;
            send(`[FIX] NULL→id=${lastItemId} cnt=${lastItemCount} r1=${r1} si=${a[1]} newSi=${newSi}`);
        } else {
            let v = '';
            for (let o = 0; o < 24; o += 4) { const x = si.add(o).readU32(); if (x) v += ` +${o.toString(16)}=${x}`; }
            send(`[UPDATE_ITEM] ${v}`);
        }
    },
    onLeave(r) { send(`[UPDATE_ITEM] done`); }
});

// === Monitor bag flow ===
hookExact("_ZN12ItemBagLayer14getItemBagDumpEv", {
    onLeave(r) {
        const b = r.readPointer(); const e = r.add(4).readPointer();
        send(`[GET_DUMP] begin=${b} end=${e} size=${e.sub(b).toInt32()}`);
    }
});
// Inject items at scroll page render time
let scrollInjected = false;
hookExact("_ZN12ItemBagLayer20createItemScrollPageERKSt6vectorI8SaveItemSaIS1_EEbb", {
    onEnter(a) {
        const v = a[1];
        if (v.isNull()) return;
        const b = v.readPointer(); const e = v.add(4).readPointer();
        const sz = e.sub(b).toInt32();
        send(`[SCROLL] begin=${b} end=${e} size=${sz}`);

        if (sz === 0 && !scrollInjected) {
            // Allocate items and inject
            const buf = Memory.alloc(60);
            for (let i = 0; i < 60; i += 4) buf.add(i).writeU32(0);
            // Item 0: grid=1, id=20081, cnt=10
            buf.add(0).writeU32(1);
            buf.add(8).writeU32(20081);
            buf.add(12).writeU32(10);
            // Item 1: grid=2, id=20082, cnt=5
            buf.add(20).writeU32(2);
            buf.add(28).writeU32(20082);
            buf.add(32).writeU32(5);
            // Item 2: if we have lastItemId from mining
            if (lastItemId && scrollInjected === false) {
                buf.add(40).writeU32(3);
                buf.add(48).writeU32(lastItemId);
                buf.add(52).writeU32(lastItemCount);
            }
            v.writePointer(buf);
            v.add(4).writePointer(buf.add(60));
            v.add(8).writePointer(buf.add(60));
            scrollInjected = true;
            send(`[SCROLL] INJECTED items into render vector!`);
        }
    }
});
hookExact("_ZN12ItemBagLayer20onUserItemBagChangedEv", {
    onEnter(a) { send(`[BAG_CHANGED]`); }
});

// === Mining merge ===
hookExact("_ZN14ISeer20CSProto24submit_map_mine_info_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE", {
    onEnter(a) { this.msg = a[0]; },
    onLeave(r) {
        const m = this.msg;
        const oreIndex = m.add(12).readU32();
        const itemId = {1:20081,2:20082,3:20083,4:20084,5:20085}[oreIndex] || 20081;
        m.add(8).writeU32(itemId);
        m.add(12).writeU32(1);
        r.replace(ptr(1));
        send(`[MINE] ore=${oreIndex}→id=${itemId}`);
    }
});

// === IsInitialized hooks ===
for (const exp of mod.enumerateExports()) {
    const n = exp.name;
    if (!n.includes("IsInitialized")) continue;
    if (n.includes("cli_get_item_out") || n.includes("notify_item_bag_updates_out")) {
        try {
            Interceptor.attach(exp.address, {
                onLeave(r) { if (r.toInt32() === 0) r.replace(ptr(1)); }
            });
        } catch(e) {}
    }
}

// === m_itemBag poll ===
let m_itemBag_addr = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData9m_itemBagE") m_itemBag_addr = exp.address;
}
setInterval(() => {
    if (!m_itemBag_addr) return;
    const begin = m_itemBag_addr.readPointer();
    const end = m_itemBag_addr.add(4).readPointer();
    const size = end.sub(begin).toInt32();
    if (size > 0 && size < 2000) {
        const raw = begin.readByteArray(Math.min(size, 100));
        const arr = new Uint8Array(raw);
        let found = false;
        for (let i = 0; i < size / 20; i++) {
            const off = i * 20;
            const v8 = arr[off+8] | (arr[off+9]<<8) | (arr[off+10]<<16) | (arr[off+11]<<24);
            const vc = arr[off+12] | (arr[off+13]<<8) | (arr[off+14]<<16) | (arr[off+15]<<24);
            if (v8 > 0 && vc > 0) {
                if (!found) send(`[BAG] items found!`);
                send(`[BAG]   [${i}] id=${v8} cnt=${vc}`);
                found = true;
            }
        }
        if (!found) send(`[BAG] ${size} bytes, all zero`);
    }
}, 5000);

send(`[READY] ${updateNullCount} NULL fixes so far. Go mine then open bag.`);
