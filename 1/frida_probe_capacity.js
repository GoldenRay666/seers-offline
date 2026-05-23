// Probe: trace capacity read path when backpack opens
// Find UserData members related to item bag
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
send(`[PROBE] Module base: ${mod.base}`);

// 1. Search all UserData exports
let userDataExports = [];
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("UserData") && exp.name.length < 100) {
        userDataExports.push(exp.name);
    }
}
userDataExports.sort();
for (const name of userDataExports) {
    send(`[UserData] ${name}`);
}

// 2. Search for capacity/bag/size related symbols
send('\n=== Bag/capacity related symbols ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm.includes("item_bag") || nm.includes("ItemBag") || nm.includes("bagSize") || nm.includes("BagSize") || nm.includes("bag_size") || nm.includes("itemBag") || nm.includes("m_itemBag")) && nm.length < 100) {
        send(`[BAGSYM] ${nm} @ ${exp.address}`);
    }
}

// 3. Find m_itemBag vector and probe it
send('\n=== m_itemBag vector probe ===');
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData9m_itemBagE") {
        const addr = exp.address;
        send(`m_itemBag static @ ${addr}`);
        try {
            const begin = addr.readPointer();
            const endPtr = addr.add(4).readPointer();
            const capPtr = addr.add(8).readPointer();
            send(`  vector: begin=${begin} end=${endPtr} cap=${capPtr}`);
            const itemCount = endPtr.sub(begin).toInt32() / 16;
            send(`  item count = ${itemCount} (assuming 16-byte SaveItem)`);
        } catch(e) {
            send(`  Error reading vector: ${e.message}`);
        }
    }
}

// 4. Hook UserData functions to see what's called when backpack opens
send('\n=== Hooking UserData item functions ===');
const HOOKS = [
    "_ZN8UserData15updateItemInBagERK8SaveItemPKc",
    "_ZN8UserData17getItemWithItemIDEj",
    "_ZN8UserData14addNewItemDataERKN11ISeer20Conf6item_tE",
    "_ZN8UserData19getItemInfoByItemIDEj",
    "_ZN8UserData13sharedManagerEv",
    "_ZN8UserData8itemBagEv",
    "_ZN8UserData14getItemBagSizeEv",
    "_ZN8UserData14getItemBagCapEv",
];

for (const exp of mod.enumerateExports()) {
    for (const h of HOOKS) {
        if (exp.name === h || exp.name.includes(h)) {
            try {
                Interceptor.attach(exp.address, {
                    onEnter(args) {
                        send(`[CALL] ${h} called`);
                        if (args.length > 1) {
                            try { send(`  arg1=${args[1]}`); } catch(e) {}
                        }
                    },
                    onLeave(retval) {
                        send(`[CALL] ${h} returned ${retval}`);
                    }
                });
                send(`[HOOKED] ${h}`);
            } catch(e) {
                send(`[HOOKFAIL] ${h}: ${e.message}`);
            }
        }
    }
}

// 5. Hook ItemBagLayer init to read capacity display
send('\n=== ItemBagLayer hooks ===');
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("ItemBagLayer") && exp.name.includes("init") && !exp.name.includes("CCB")) {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    send(`[ITEMBAG] ItemBagLayer::init called, this=${args[0]}`);
                },
                onLeave(retval) {
                    send(`[ITEMBAG] ItemBagLayer::init returned ${retval}`);
                    // Schedule a delayed probe
                    setTimeout(() => {
                        // Read m_itemBag state
                        for (const e2 of mod.enumerateExports()) {
                            if (e2.name === "_ZN8UserData9m_itemBagE") {
                                const addr = e2.address;
                                const begin = addr.readPointer();
                                const endPtr = addr.add(4).readPointer();
                                send(`[ITEMBAG] After init - m_itemBag begin=${begin} end=${endPtr}`);
                                const itemCount = endPtr.sub(begin).toInt32();
                                send(`[ITEMBAG] item bytes = ${itemCount}`);
                            }
                        }
                    }, 500);
                }
            });
            send(`[HOOKED] ItemBagLayer::init @ ${exp.address}`);
            break;
        } catch(e) {}
    }
}

// 6. Hook cli_notify_item_bag_updates_out Merge to trace capacity field
send('\n=== Bag update merge hooks ===');
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("notify_item_bag_updates_out") &&
        exp.name.includes("MergePartialFromCodedStream")) {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) { this.msg = args[0]; },
                onLeave(retval) {
                    send(`[BAG_MERGE] notify_item_bag_updates_out merge returned ${retval}`);
                    // Dump first 32 bytes of the message after merge
                    try {
                        const bytes = this.msg.readByteArray(32);
                        const arr = new Uint8Array(bytes);
                        let hex = '';
                        for (let i = 0; i < arr.length; i += 4) {
                            const v = (arr[i+3]<<24)|(arr[i+2]<<16)|(arr[i+1]<<8)|arr[i];
                            hex += `[+${i}]=${(v>>>0)} `;
                        }
                        send(`[BAG_MERGE] msg dump: ${hex}`);
                    } catch(e) {}
                }
            });
            send(`[HOOKED] bag_updates_out merge @ ${exp.address}`);
            break;
        } catch(e) {}
    }
}

// 7. Also hook the handler for bag updates
send('\n=== Looking for bag update handler ===');
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("notify_item_bag_updates")) {
        send(`[BAG_FUNC] ${exp.name} @ ${exp.address}`);
    }
}

send('[***] Probe setup complete. Open the backpack to trigger traces.');
