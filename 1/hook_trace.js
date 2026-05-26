'use strict';
const MODULE = "libgame_logic.so";
let installed = false;

function install() {
    if (installed) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

    // Mining CS_FIX
    const ORE_MAP = {1:20081, 2:20082};
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartial")) continue;
        Interceptor.attach(exp.address, {
            onEnter(args) {
                this.m = args[0];
                const cs = args[1];
                try { const b=cs.add(4).readPointer(); const e=cs.add(8).readPointer();
                    if(b.toInt32()>0x10000){cs.add(4).writePointer(b.add(4));cs.add(8).writePointer(e.add(4));}
                } catch(e) {}
            },
            onLeave(r) {
                if (r.toInt32() === 0) {
                    const ore = this.m.add(12).readU32() || 1;
                    this.m.add(8).writeU32(ORE_MAP[ore] || 20081);
                    this.m.add(12).writeU32(1);
                    r.replace(ptr(1));
                }
            }
        });
        break;
    }

    // Bag trace
    for (const exp of mod.enumerateExports()) {
        if (exp.name !== "_ZN8UserData15updateItemInBagERK8SaveItemPKc") continue;
        Interceptor.attach(exp.address, {
            onEnter(args) {
                const si = args[0];
                send(`[BAG] id=${si.add(0).readU32()} cnt=${si.add(4).readU32()} grid=${si.add(8).readU32()}`);
            }
        });
        break;
    }

    // Task traces — read-only
    for (const exp of mod.enumerateExports()) {
        const nm = exp.name;
        try {
            if ((nm.includes("task")||nm.includes("Task")||nm.includes("finish_task")) && nm.includes("MergePartial") && nm.length<120 && !nm.includes("set_task_step")) {
                Interceptor.attach(exp.address, {onEnter(a){send(`[T] ${nm.split("::").pop()}`);}});
            }
            // set_task_step_out merge — trace what fields are parsed
            if (nm.includes("set_task_step_out") && nm.includes("MergePartial") && nm.length<120) {
                Interceptor.attach(exp.address, {
                    onEnter(args) {
                        this.msg = args[0];
                        const cis = args[1];
                        const buf = cis.add(4).readPointer();
                        const end = cis.add(8).readPointer();
                        this.preLen = end.sub(buf).toInt32();
                        send(`[SSO] merge enter buf=${buf} len=${this.preLen}`);
                    },
                    onLeave(retval) {
                        const m = this.msg;
                        send(`[SSO] done ret=${retval} +0=${m.add(0).readU32()} +4=${m.add(4).readU32()} +8=${m.add(8).readU32()} +12=${m.add(12).readU32()} +16=${m.add(16).readU32()}`);
                    }
                });
            }
            // Battle end merge trace
            if ((nm.includes("battle_end")||nm.includes("btl_notify_battle_end")) && nm.includes("MergePartial") && nm.length<120) {
                Interceptor.attach(exp.address, {onEnter(a){send(`[BTL-END] ${nm.split("::").pop()}`);}});
            }
            // finish_task_out merge — trace fields
            if (nm.includes("finish_task_out") && nm.includes("MergePartial") && nm.length<120) {
                Interceptor.attach(exp.address, {
                    onEnter(args) {
                        this.fm = args[0];
                        const cis = args[1];
                        const buf = cis.add(4).readPointer();
                        const end = cis.add(8).readPointer();
                        this.preLen = end.sub(buf).toInt32();
                        send(`[FTO] merge enter buf=${buf} len=${this.preLen}`);
                    },
                    onLeave(retval) {
                        const m = this.fm;
                        send(`[FTO] merge done ret=${retval} +4=${m.add(4).readU32()} +8=${m.add(8).readU32()} +12=${m.add(12).readU32()}`);
                    }
                });
            }
            if (nm.includes("addNewQuestInfo") && nm.length<80) {
                Interceptor.attach(exp.address, {
                    onEnter(args) {
                        const p = args[1];
                        // ARM C++ object: offset 0=vtable, offset 4=id(uint32)
                        const id4 = p.add(4).readU32();
                        const id0 = p.add(0).readU16();
                        send(`[Q] addNew info id@4=${id4} vtable@0=${id0}`);
                    }
                });
            }
            if (nm.includes("isQuestFinished") && nm.length<80) {
                Interceptor.attach(exp.address, {
                    onEnter(a){send(`[Q] isQuestFinished a1=${a[1]} a2=${a[2]}`);},
                    onLeave(r){send(`[Q] isQuestFinished ret=${r}`);}
                });
            }
            if (nm.includes("handleErrMapTask") || nm.includes("getQuestInfoByQuestId") ||
                nm.includes("isHaveQuestByQuestID") || nm.includes("isTaskStepByQuestID")) {
                if (nm.length<100) Interceptor.attach(exp.address, {onEnter(a){send(`[T] ${nm.split("::").pop()}`);}});
            }
    // Battle side matching — hook by name (confirmed exports)
    if (nm.includes("setAttackee") && nm.length < 100) {
        Interceptor.attach(exp.address, {
            onEnter(args) { send(`[BTLSIDE] setAttackee — uid MISMATCH`); }
        });
        send(`[HOOK] setAttackee installed: ${nm}`);
    }
    if (nm.includes("addWaiting") && nm.length < 100) {
        Interceptor.attach(exp.address, {
            onEnter(args) { send(`[BTLSIDE] addWaiting — uid MATCHES`); }
        });
        send(`[HOOK] addWaiting installed: ${nm}`);
    }
            // Monster flow hooks
            if ((nm.includes("get_bag_mon") || nm.includes("select_main_mon") || nm.includes("mon_info_t") || nm.includes("MonInfo") || nm.includes("mon_basic")) && nm.includes("MergePartial") && nm.length < 120) {
                Interceptor.attach(exp.address, { onEnter(a){ send(`[MON-MERGE] ${nm.split("::").pop()}`); } });
            }
            if (nm.includes("addMon") || nm.includes("setMon") || nm.includes("updateMon") || nm.includes("initMon")) {
                if (nm.length < 100) Interceptor.attach(exp.address, { onEnter(a){ send(`[MON-FN] ${nm.split("::").pop()}`); } });
            }
            // All mon sub-type IsInitialized checks
            if (nm.includes("ISeer20Comm") && nm.includes("mon_") && nm.includes("IsInitialized")) {
                Interceptor.attach(exp.address, {
                    onEnter(a) { this.m = a[0]; },
                    onLeave(r) {
                        send(`[MON-INIT] ${nm.split("::").pop()} ret=${r}`);
                    }
                });
            }
            // UserData sprite/mon hooks
            if (nm.includes("UserData") && (nm.includes("Sprite")||nm.includes("addSprite")||nm.includes("Mon")||nm.includes("addObtained")||nm.includes("Follow")) && nm.length < 100) {
                Interceptor.attach(exp.address, {
                    onEnter(args) { send(`[UD-SPR] ${nm.split("::").pop()} a1=${args[1]}`); }
                });
            }
            if (nm.includes("checkAction") && nm.length < 80) {
                Interceptor.attach(exp.address, {
                    onEnter(args) { send(`[Q] checkAction(${args[1]})`); },
                    onLeave(r) { send(`[Q] checkAction ret=${r}`); }
                });
            }
            if (nm.includes("getQuestState") && nm.length < 80) {
                Interceptor.attach(exp.address, {
                    onEnter(args) { send(`[Q] getQuestState(qid=${args[1]})`); },
                    onLeave(r) { send(`[Q] getQuestState ret=${r}`); }
                });
            }
        } catch(ex) {}
    }

    // No field dump — too much output
    if (!installed) {
        for (const e of mod.enumerateExports()) {
            try {
                const nm = e.name;
                // Hook start_battle_pve_out merge to trace parsed fields
                if (nm.includes("start_battle_pve_out") && nm.includes("MergePartial") && nm.includes("CSProto")) {
                    Interceptor.attach(e.address, {
                        onEnter(args) {
                            this.bm = args[0];
                            const cis = args[1];
                            const buf = cis.add(4).readPointer();
                            const end = cis.add(8).readPointer();
                            this.blen = end.sub(buf).toInt32();
                            send(`[BTL] merge enter buf=${buf} len=${this.blen}`);
                        },
                        onLeave(retval) {
                            const m = this.bm;
                            send(`[BTL] done ret=${retval} +0=${m.add(0).readU32()} +4=${m.add(4).readU32()} +8=${m.add(8).readU32()} +12=${m.add(12).readU32()} +16=${m.add(16).readU32()} +20=${m.add(20).readU32()}`);
                        }
                    });
                }
                // Hook finish_task handler
                if (nm.includes("finish_task") && nm.includes("handler") && nm.length<100) {
                    Interceptor.attach(e.address, {
                        onEnter(args) {
                            send(`[FTH] finish_task handler called this=${args[0]} msg=${args[1]}`);
                            if(args[1]){const m=args[1];send(`[FTH] msg +4=${m.add(4).readU32()} +8=${m.add(8).readU32()} +12=${m.add(12).readU32()}`);}
                        }
                    });
                    send(`[FIELD] Hooked finish_task handler: ${nm}`);
                }
            } catch(ex) {}
        }
    }

    // Hook the gain new mon handler — THIS should call addSpriteToPack
    const hGainMon = mod.base.add(0x6322f4).or(1);
    try { Interceptor.attach(hGainMon, {
        onEnter(args) { send(`[GAIN-MON] handleNtfMsgGainNewMon CALLED!`); },
        onLeave(r) { send(`[GAIN-MON] done`); }
    }); send(`[HOOK] handleNtfMsgGainNewMon installed`); } catch(ex){send(`[ERR] GainMon: ${ex}`);}

    // GenSprite hook — dump SpriteInfo nonzero fields
    const hGenSprite = mod.base.add(0x631ecc).or(1);
    try { Interceptor.attach(hGenSprite, {
        onEnter(args) { this.si = args[1]; },
        onLeave(r) {
            let nz = [];
            for (let off = 0; off < 0x110; off += 4) {
                const v = this.si.add(off).readU32();
                if (v > 0 && v < 10000) nz.push(`${off.toString(16)}=${v}`);
            }
            send(`[GEN] nonzero: ${nz.join(' ')}`);
        }
    }); } catch(ex){}

    // Hook addSpriteToPack and addSpriteToStorage to see which is called
    const hAddPack = mod.base.add(0x5513e8).or(1);
    try { Interceptor.attach(hAddPack, {
        onEnter(args) { send(`[ROUTE] addSpriteToPack CALLED → PACK!`); }
    }); } catch(ex){}
    const hAddStore = mod.base.add(0x5515a0).or(1);
    try { Interceptor.attach(hAddStore, {
        onEnter(args) { send(`[ROUTE] addSpriteToStorage CALLED → STORAGE`); }
    }); } catch(ex){}

    installed = true;
    send(`[READY]`);
}
setInterval(install, 500);
install();
