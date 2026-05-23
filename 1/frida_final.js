// Simplified fix: inject mining + verify bag update
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
let installed = false;

function install() {
    if (installed) return;

    // 1. Mining merge: inject item_id/count
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartialFromCodedStream")) continue;

        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                this.msg.add(8).writeU32(20081);
                this.msg.add(12).writeU32(1);
                retval.replace(ptr(1));
                send(`[FIX] Mine merge: injected id=20081 cnt=1`);
            }
        });
        send(`[FIX] Mining merge hooked`);
        break;
    }

    // 2. get_item_out merge: force true
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("get_item_out")) continue;
        if (exp.name.includes("one_t")) continue;
        if (!exp.name.includes("MergePartialFromCodedStream")) continue;
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                send(`[FIX] get_item merge ret=${retval.toInt32()} cap@+28=${this.msg.add(0x28).readU32()}`);
                retval.replace(ptr(1));
            }
        });
        send(`[FIX] get_item_out merge hooked`);
        break;
    }

    // 3. ItemBagLayer: delayed removeESL
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("ItemBagLayer") || !exp.name.includes("init") || exp.name.includes("CCB")) continue;

        let gmGetScene=null, removeESL=null, gmShared=null;
        for (const e2 of mod.enumerateExports()) {
            if (e2.name.includes("GameManager") && e2.name.includes("getSceneLayer")) gmGetScene = e2.address;
            if (e2.name.includes("SceneLayer") && e2.name.includes("removeEventSwallowLayer")) removeESL = e2.address;
            if (e2.name.includes("GameManager") && e2.name.includes("sharedManager")) gmShared = e2.address;
        }

        Interceptor.attach(exp.address, {
            onLeave() {
                send(`[FIX] ItemBagLayer init called`);
                for (let d = 200; d <= 1000; d += 200) {
                    setTimeout(() => {
                        if (gmShared && gmGetScene && removeESL) {
                            try {
                                const mgr = new NativeFunction(gmShared, 'pointer', [])();
                                const scene = new NativeFunction(gmGetScene, 'pointer', ['pointer'])(mgr);
                                if (!scene.isNull()) {
                                    new NativeFunction(removeESL, 'void', ['pointer'])(scene);
                                    send(`[FIX] ESL removed at ${d}ms`);
                                }
                            } catch(e) {}
                        }
                    }, d);
                }
            }
        });
        send(`[FIX] Bag layer fix hooked`);
        installed = true;
        break;
    }
}

setInterval(install, 2000);
install();
