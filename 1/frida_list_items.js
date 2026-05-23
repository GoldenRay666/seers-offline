// Probe GameItemDataManager to find valid item IDs
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

let itemMgrFn = null, getItemInfoFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN19GameItemDataManager13sharedManagerEv") itemMgrFn = exp.address;
    if (exp.name === "_ZN19GameItemDataManager19getItemInfoByItemIDEj") getItemInfoFn = exp.address;
}

if (itemMgrFn && getItemInfoFn) {
    const getMgr = new NativeFunction(itemMgrFn, 'pointer', [])();
    const mgr = getMgr();
    send(`GameItemDataManager = ${mgr}`);

    const getInfo = new NativeFunction(getItemInfoFn, 'pointer', ['pointer', 'uint32']);

    // Scan item IDs in ranges
    const ranges = [[1, 100], [1001, 1100], [10001, 10100], [20001, 20100], [20081, 20090]];
    for (const [start, end] of ranges) {
        let found = [];
        for (let id = start; id <= end; id++) {
            try {
                const ptr = getInfo(mgr, id);
                if (!ptr.isNull()) found.push(id);
            } catch(e) {}
        }
        if (found.length > 0) send(`[ITEMS] Range ${start}-${end}: ${found.join(', ')}`);
    }
} else {
    send(`[ITEMS] Functions not found: mgr=${!!itemMgrFn} getInfo=${!!getItemInfoFn}`);
}

send('[***] Done');
