// Auto-fix: inject mine_item_id and mine_item_count into mining response
// Mock sends ore index (1-5) in field 2 → stored at msg+12
// This script reads it and maps to real item ID

'use strict';

const ORE_MAP = {1: 20081, 2: 20082, 3: 20083, 4: 20084, 5: 20085};

const MODULE = "libgame_logic.so";
let installed = false;

function install() {
    if (installed) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartialFromCodedStream")) continue;

        // Hook mining merge
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                const oreIndex = this.msg.add(12).readU32();
                const itemId = ORE_MAP[oreIndex] || 20081;
                this.msg.add(8).writeU32(itemId);
                this.msg.add(12).writeU32(1);
                retval.replace(ptr(1));

                // Actually add item to game data
                if (itemMgrFn && getItemInfoFn && addItemFn) {
                    try {
                        const getMgr = new NativeFunction(itemMgrFn, 'pointer', []);
                        const mgr = getMgr();
                        const getInfo = new NativeFunction(getItemInfoFn, 'pointer', ['pointer', 'uint32']);
                        const itemPtr = getInfo(mgr, itemId);
                        if (!itemPtr.isNull()) {
                            new NativeFunction(addItemFn, 'void', ['pointer', 'pointer'])(mgr, itemPtr);
                        }
                    } catch(e) {}
                }

                // Update task progress (QuestManager::setProgress for task 10002 step 1)
                if (questSetProgress && questShared) {
                    try {
                        const getQMgr = new NativeFunction(questShared, 'pointer', []);
                        const qmgr = getQMgr();
                        send(`[seers-fix] QuestManager=${qmgr}`);
                        const stepPtr = Memory.alloc(2);
                        stepPtr.writeU16(1);
                        const setProg = new NativeFunction(questSetProgress, 'void', ['pointer', 'uint16', 'pointer', 'int']);
                        setProg(qmgr, 10002, stepPtr, 1);
                        send(`[seers-fix] setProgress(10002, step=1) called OK`);
                    } catch(e) {
                        send(`[seers-fix] setProgress error: ${e.message} ${e.stack}`);
                    }
                } else {
                    send(`[seers-fix] setProgress SKIPPED: questSetProgress=${!!questSetProgress} questShared=${!!questShared}`);
                }
            }
        });
        send("[seers-fix] Mining merge hooked");

        // Also hook cli_get_item_out merge to fix backpack query
        for (const exp2 of mod.enumerateExports()) {
            if (exp2.name.includes("cli_get_item_out") &&
                exp2.name.includes("MergePartialFromCodedStream")) {
                Interceptor.attach(exp2.address, {
                    onEnter(args) { this.msg = args[0]; },
                    onLeave(retval) {
                        // Force return true so backpack shows items
                        retval.replace(ptr(1));
                    }
                });
                send("[seers-fix] get_item_out merge hooked");
                break;
            }
        }

        // Find addNewItemData to call after mining
        let addItemFn = null, itemMgrFn = null, getItemInfoFn = null;
        let questSetProgress = null, questShared = null;
        for (const exp3 of mod.enumerateExports()) {
            if (exp3.name === "_ZN19GameItemDataManager14addNewItemDataERKN11ISeer20Conf6item_tE")
                addItemFn = exp3.address;
            if (exp3.name === "_ZN19GameItemDataManager13sharedManagerEv")
                itemMgrFn = exp3.address;
            if (exp3.name === "_ZN19GameItemDataManager19getItemInfoByItemIDEj")
                getItemInfoFn = exp3.address;
            if (exp3.name === "_ZN12QuestManager11setProgressEtPtb")
                questSetProgress = exp3.address;
            if (exp3.name === "_ZN12QuestManager13sharedManagerEv")
                questShared = exp3.address;
        }
        send(`[seers-fix] addItemFn=${!!addItemFn} mgrFn=${!!itemMgrFn} getInfoFn=${!!getItemInfoFn} questSetProgress=${!!questSetProgress} questShared=${!!questShared}`);

        // Bag fix: auto-remove EventSwallowLayer when backpack opens
        let gmGetScene = null, removeESL = null, gmShared = null;
        for (const exp4 of mod.enumerateExports()) {
            if (exp4.name.includes("GameManager") && exp4.name.includes("getSceneLayer"))
                gmGetScene = exp4.address;
            if (exp4.name.includes("SceneLayer") && exp4.name.includes("removeEventSwallowLayer"))
                removeESL = exp4.address;
            if (exp4.name.includes("GameManager") && exp4.name.includes("sharedManager"))
                gmShared = exp4.address;
        }
        for (const exp4 of mod.enumerateExports()) {
            if (exp4.name.includes("ItemBagLayer") && exp4.name.includes("init") && !exp4.name.includes("CCB")) {
                Interceptor.attach(exp4.address, {
                    onLeave(retval) {
                        if (gmShared && gmGetScene && removeESL) {
                            try {
                                const mgr = new NativeFunction(gmShared, 'pointer', [])();
                                const scene = new NativeFunction(gmGetScene, 'pointer', ['pointer'])(mgr);
                                if (!scene.isNull()) {
                                    new NativeFunction(removeESL, 'void', ['pointer'])(scene);
                                    send("[seers-fix] Bag: removed EventSwallowLayer");
                                }
                            } catch(e) {}
                        }
                    }
                });
                send("[seers-fix] Bag fix hooked");
                break;
            }
        }

        installed = true;
        return;
    }
}

setInterval(install, 1000);
install();
