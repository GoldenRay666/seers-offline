// Seers offline: bag item display + mining + tap fix
'use strict';
const ORE_MAP = {1: 20081, 2: 20082, 3: 20083, 4: 20084, 5: 20085};
const MODULE = "libgame_logic.so";
let installed = false;

function install() {
    if (installed) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

    // === 1. ITEM CONFIG (synth) ===
    let m_getItemInfo = null;
    for (const exp of mod.enumerateExports())
        if (exp.name === "_ZN19GameItemDataManager19getItemInfoByItemIDEj") m_getItemInfo = exp.address;
    const syn = {};
    for (const [id, name] of [[20081,'黄铁矿'],[20082,'赤晶矿']]) {
        const buf = Memory.alloc(256);
        for (let i=0;i<256;i+=4) buf.add(i).writeU32(0);
        buf.add(0).writeU32(0xFFFFFFFF);
        const np = Memory.allocUtf8String(name);
        buf.add(4).writePointer(np); buf.add(8).writeU32(np.readUtf8String().length);
        buf.add(12).writeU32(np.readUtf8String().length);
        buf.add(16).writeU32(id); buf.add(20).writeU32(1); buf.add(24).writeU32(2); buf.add(28).writeU32(1);
        syn[id] = buf;
    }
    if (m_getItemInfo) Interceptor.attach(m_getItemInfo, {
        onEnter(a) { this.id = a[1].toInt32(); },
        onLeave(r) { if (r.isNull() && syn[this.id]) r.replace(syn[this.id]); }
    });

    // === 2. BAG ITEMS: grid-ID-based SaveItem into iterator ===
    function makeSaveItem(id, cnt) {
        const buf = Memory.alloc(0x11);
        for (let i=0;i<0x11;i+=4) buf.add(i).writeU32(0);
        buf.add(0).writeU32(id);
        buf.add(4).writeU32(cnt);
        return buf;
    }
    const si1 = makeSaveItem(20081, 10);
    const si2 = makeSaveItem(20082, 5);
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData17getItemWithGridIDEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.gridId = a[0].toInt32(); },
                onLeave(r) {
                    if (r.isNull()) return;
                    if (this.gridId === 1) r.replace(si1);
                    else if (this.gridId === 2) r.replace(si2);
                }
            });
            break;
        }
    }

    // === 3. TAP FIX: loadItemInfo(id=0) → use grid from node ===
    let tappedGrid = 0;
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer14onItemSelectedEPN7cocos2d8CCObjectE") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    const node = a[1];
                    if (!node.isNull()) tappedGrid = node.add(0x0c).readU32();
                }
            });
        }
        if (exp.name === "_ZN12ItemBagLayer12loadItemInfoEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) {
                    if (a[1].toInt32() === 0 && tappedGrid > 0) a[1] = ptr(tappedGrid);
                }
            });
        }
    }

    // === 4. MINING ===
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartialFromCodedStream")) continue;
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                const oreIndex = this.msg.add(12).readU32();
                const itemId = ORE_MAP[oreIndex] || 20081;
                this.msg.add(8).writeU32(itemId);
                this.msg.add(12).writeU32(1);
                retval.replace(ptr(1));
            }
        });
        send("[seers-fix] Mining hooked");
        break;
    }

    // === 5. IsInitialized ===
    for (const exp of mod.enumerateExports())
        if (exp.name.includes("IsInitialized") && (exp.name.includes("cli_get_item_out")||exp.name.includes("notify_item_bag_updates_out")))
            try{Interceptor.attach(exp.address,{onLeave(r){if(r.toInt32()===0)r.replace(ptr(1));}})}catch(e){}

    installed = true;
}
setInterval(install, 1000);
install();
