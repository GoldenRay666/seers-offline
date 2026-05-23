// Check m_itemBag and call UserData functions directly
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find UserData singleton
let userDataFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("UserData") && exp.name.includes("sharedManager") && exp.name.length < 80) {
        userDataFn = exp.address;
        break;
    }
}
if (!userDataFn) { send("UserData::sharedManager not found"); return; }

const getUD = new NativeFunction(userDataFn.or(1), 'pointer', [])();
const ud = getUD();
send(`UserData = ${ud}`);

// Find m_itemBag
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData9m_itemBagE") {
        const addr = exp.address;
        const begin = addr.readPointer();
        const endPtr = addr.add(4).readPointer();
        const capPtr = addr.add(8).readPointer();
        const byteCount = endPtr.sub(begin).toInt32();
        send(`m_itemBag: begin=${begin} end=${endPtr} cap=${capPtr} bytes=${byteCount}`);

        // Dump raw vector data
        if (byteCount > 0 && byteCount < 1000) {
            const raw = begin.readByteArray(byteCount);
            const arr = new Uint8Array(raw);
            // Try different SaveItem sizes
            for (const size of [8, 12, 16, 20, 24, 28, 32]) {
                if (byteCount % size === 0) {
                    const count = byteCount / size;
                    send(`SaveItem size=${size}: ${count} items`);
                    for (let i = 0; i < Math.min(count, 5); i++) {
                        const off = i * size;
                        let hex = '';
                        for (let j = 0; j < size; j++) hex += arr[off+j].toString(16).padStart(2,'0');
                        send(`  [${i}] ${hex}`);
                    }
                }
            }
        }
        break;
    }
}

// Try calling getTotalItemCount
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData17getTotalItemCountEv") {
        try {
            const fn = new NativeFunction(exp.address.or(1), 'int', ['pointer']);
            const count = fn(ud);
            send(`getTotalItemCount() = ${count}`);
        } catch(e) { send(`getTotalItemCount error: ${e.message}`); }
        break;
    }
}

// Try calling getItemWithItemID
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData17getItemWithItemIDEj") {
        try {
            const fn = new NativeFunction(exp.address.or(1), 'pointer', ['pointer', 'uint32']);
            for (const id of [20081, 20082]) {
                const ptr = fn(ud, id);
                send(`getItemWithItemID(${id}) = ${ptr}`);
                if (!ptr.isNull()) {
                    // Dump SaveItem
                    const raw = ptr.readByteArray(32);
                    const arr = new Uint8Array(raw);
                    let hex = '';
                    for (let j = 0; j < 32; j++) hex += arr[j].toString(16).padStart(2,'0');
                    send(`  data: ${hex}`);
                }
            }
        } catch(e) { send(`getItemWithItemID error: ${e.message}`); }
        break;
    }
}

send('[***] Done');
