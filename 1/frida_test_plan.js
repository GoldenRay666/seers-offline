// Item acquisition test plan - systematic verification
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

// ============================================================
// Test 1: Find the actual m_itemBag and verify item count
// ============================================================
function test1_bagState() {
    send("\n=== Test 1: Backpack state ===");
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData9m_itemBagE") {
            const addr = exp.address;
            const begin = addr.readPointer();
            const endPtr = addr.add(4).readPointer();
            const capPtr = addr.add(8).readPointer();
            const count = endPtr.sub(begin).toInt32() / 16;
            send(`[T1] m_itemBag vector: begin=${begin} end=${endPtr} cap=${capPtr}`);
            send(`[T1] Item count (assuming 16-byte SaveItem): ${count}`);
            // Dump first few items
            if (count > 0) {
                for (let i = 0; i < Math.min(count, 5); i++) {
                    const si = begin.add(i * 16);
                    const bytes = si.readByteArray(16);
                    const arr = new Uint8Array(bytes);
                    send(`[T1] Item[${i}]: ${Array.from(arr).map(b=>b.toString(16).padStart(2,'0')).join('')}`);
                }
            }
        }
    }
}

// ============================================================
// Test 2: Find UserData item functions
// ============================================================
function test2_userDataFunctions() {
    send("\n=== Test 2: UserData item functions ===");
    for (const exp of mod.enumerateExports()) {
        const nm = exp.name;
        if (nm.includes("UserData") && (nm.includes("Item") || nm.includes("item") || nm.includes("Bag") || nm.includes("bag")) && nm.length < 100) {
            send(`[T2] ${nm} @ ${exp.address}`);
        }
    }
}

// ============================================================
// Test 3: Trace bag update push handling end-to-end
// ============================================================
function test3_traceBagUpdate() {
    send("\n=== Test 3: Bag update push trace ===");

    // Hook the bag updates merge
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("notify_item_bag_updates_out")) continue;

        if (exp.name.includes("MergePartialFromCodedStream") && !exp.name.includes("one_t")) {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    this.msg = args[0];
                    const stream = args[1];
                    try {
                        const ptr = stream.add(4).readPointer();
                        const end = stream.add(8).readPointer();
                        const remaining = end.sub(ptr).toInt32();
                        if (remaining > 0 && remaining < 100) {
                            const raw = ptr.readByteArray(remaining);
                            const arr = new Uint8Array(raw);
                            send(`[T3] Bag merge: ${remaining} bytes: ${Array.from(arr).map(b=>b.toString(16).padStart(2,'0')).join('')}`);
                        }
                    } catch(e) {}
                },
                onLeave(retval) {
                    const m = this.msg;
                    send(`[T3] Bag merge ret=${retval.toInt32()}`);
                    for (let i = 0; i < 0x80; i += 4) {
                        try {
                            const v = m.add(i).readU32();
                            if (v !== 0 && v < 0x10000) send(`[T3]   msg+${i}=${v}`);
                        } catch(e) {}
                    }
                }
            });
            send(`[T3] Hooked bag_updates merge`);
        }

        if (exp.name.includes("IsInitialized") && !exp.name.includes("one_t")) {
            Interceptor.attach(exp.address, {
                onLeave(retval) { send(`[T3] Bag IsInitialized=${retval.toInt32()}`); }
            });
            send(`[T3] Hooked bag IsInitialized`);
        }
    }

    // Also hook updateItemInBag to see if item is actually added
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData15updateItemInBagERK8SaveItemPKc") {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    const saveItem = args[1];
                    try {
                        const raw = saveItem.readByteArray(32);
                        const arr = new Uint8Array(raw);
                        send(`[T3] updateItemInBag called! bytes: ${Array.from(arr).map(b=>b.toString(16).padStart(2,'0')).join('')}`);
                    } catch(e) {}
                }
            });
            send(`[T3] Hooked updateItemInBag @ ${exp.address}`);
        }
    }
}

// ============================================================
// Test 4: Find how backpack UI reads capacity
// ============================================================
function test4_capacitySource() {
    send("\n=== Test 4: Capacity source ===");
    // Hook get_item_out merge to see capacity field
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("get_item_out")) continue;
        if (exp.name.includes("one_t")) continue;
        if (!exp.name.includes("MergePartialFromCodedStream")) continue;

        Interceptor.attach(exp.address, {
            onEnter(args) {
                this.msg = args[0];
                const stream = args[1];
                try {
                    const ptr = stream.add(4).readPointer();
                    const end = stream.add(8).readPointer();
                    const remaining = end.sub(ptr).toInt32();
                    if (remaining > 0 && remaining < 100) {
                        const raw = ptr.readByteArray(remaining);
                        const arr = new Uint8Array(raw);
                        send(`[T4] GetItem merge: ${remaining} bytes: ${Array.from(arr).map(b=>b.toString(16).padStart(2,'0')).join('')}`);
                    }
                } catch(e) {}
            },
            onLeave(retval) {
                const m = this.msg;
                const cap = m.add(0x28).readU32();
                const mask = m.add(0x30).readU32();
                send(`[T4] GetItem merge ret=${retval.toInt32()} cap@+28=${cap} mask@+30=${mask}`);
                // Also check other possible capacity offsets
                for (let off = 0; off < 0x60; off += 4) {
                    try {
                        const v = m.add(off).readU32();
                        if (v === 30 || v === 999) send(`[T4]   Found capacity-like at msg+${off}=${v}`);
                    } catch(e) {}
                }
            }
        });
        send(`[T4] Hooked get_item merge`);
        break;
    }

    // Hook ItemBagLayer init more aggressively
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("ItemBagLayer")) continue;
        if (exp.name.length > 80) continue;
        send(`[T4] ItemBagLayer func: ${exp.name} @ ${exp.address}`);

        if (exp.name.includes("init") && !exp.name.includes("CCB")) {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    send(`[T4] ItemBagLayer::init ENTER this=${args[0]}`);
                    // Dump the layer object
                    const layer = args[0];
                    for (let off = 0; off < 0x80; off += 4) {
                        try {
                            const v = layer.add(off).readU32();
                            if (v === 30 || v === 999) send(`[T4]   Found capacity at this+${off}=${v}`);
                        } catch(e) {}
                    }
                },
                onLeave() { send(`[T4] ItemBagLayer::init LEAVE`); }
            });
            send(`[T4] Hooked ItemBagLayer::init`);
        }
    }
}

// ============================================================
// Test 5: Directly call addNewItemData to verify it works
// ============================================================
function test5_directAdd() {
    send("\n=== Test 5: Direct addNewItemData ===");
    let addItemFn = null, itemMgrFn = null, getItemInfoFn = null;
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN19GameItemDataManager14addNewItemDataERKN11ISeer20Conf6item_tE") addItemFn = exp.address;
        if (exp.name === "_ZN19GameItemDataManager13sharedManagerEv") itemMgrFn = exp.address;
        if (exp.name === "_ZN19GameItemDataManager19getItemInfoByItemIDEj") getItemInfoFn = exp.address;
    }
    send(`[T5] addItemFn=${!!addItemFn} mgrFn=${!!itemMgrFn} getInfoFn=${!!getItemInfoFn}`);

    if (itemMgrFn && getItemInfoFn) {
        try {
            const getMgr = new NativeFunction(itemMgrFn, 'pointer', [])();
            const mgr = getMgr();
            send(`[T5] GameItemDataManager = ${mgr}`);

            // Try multiple item IDs
            for (const itemId of [20081, 1, 100, 1000]) {
                try {
                    const getInfo = new NativeFunction(getItemInfoFn, 'pointer', ['pointer', 'uint32']);
                    const itemPtr = getInfo(mgr, itemId);
                    send(`[T5] getItemInfoByItemID(${itemId}) = ${itemPtr}`);
                } catch(e) {
                    send(`[T5] getItemInfoByItemID(${itemId}) error: ${e.message}`);
                }
            }
        } catch(e) {
            send(`[T5] Error: ${e.message}`);
        }
    }
}

// Run all tests
setTimeout(test1_bagState, 3000);
setTimeout(test2_userDataFunctions, 3500);
test3_traceBagUpdate();
test4_capacitySource();
setTimeout(test5_directAdd, 4000);

send('[TESTPLAN] All hooks installed. Mine and open backpack to trigger tests.');
