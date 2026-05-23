// Scan item IDs in game database - find which ones exist
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

let itemMgrFn = null, getItemInfoFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN19GameItemDataManager13sharedManagerEv") itemMgrFn = exp.address;
    if (exp.name === "_ZN19GameItemDataManager19getItemInfoByItemIDEj") getItemInfoFn = exp.address;
}

if (!itemMgrFn || !getItemInfoFn) {
    send("Functions not found");
    return;
}

// Thumb mode: address | 1
const getMgr = new NativeFunction(itemMgrFn.or(1), 'pointer', [])();
const mgr = getMgr();
send(`Manager = ${mgr}`);

const getInfo = new NativeFunction(getItemInfoFn.or(1), 'pointer', ['pointer', 'uint32']);

// Scan ranges
let found = [];
const ranges = [[1, 50], [100, 150], [1000, 1050], [10000, 10050], [20001, 20100]];
for (const [start, end] of ranges) {
    for (let id = start; id <= end; id++) {
        try {
            const ptr = getInfo(mgr, id);
            if (!ptr.isNull()) found.push(id);
        } catch(e) {}
    }
}
send(`Found items: ${found.join(', ')}`);
send('[***] Done');
