'use strict';
const MODULE = "libgame_logic.so";
let installed = false;

function install() {
    if (installed) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

    // Guide bypass
    let _gm, _end, _proc;
    for (const e of mod.enumerateExports()) {
        if (e.name.includes("GameGuideManager") && e.name.endsWith("sharedManagerEv")) _gm = new NativeFunction(e.address, 'pointer', []);
        if (e.name.includes("GameGuideManager") && e.name.endsWith("8endGuideEv")) _end = new NativeFunction(e.address, 'void', ['pointer']);
        if (e.name.includes("GameGuideManager") && e.name.endsWith("12processGuideEv")) _proc = new NativeFunction(e.address, 'void', ['pointer']);
    }
    let _gc = false;
    for (const e of mod.enumerateExports()) {
        if (e.name.includes("player_enter_map_out") && e.name.includes("MergePartial")) {
            Interceptor.attach(e.address, { onLeave(r) {
                if (_gc || !_gm || !_end) return; _gc = true;
                setTimeout(() => { const m = _gm(); if(m&&!m.isNull()){_end(m);_proc(m);} }, 2000);
            }}); break;
        }
    }

    // Mining merge + CS_FIX
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
        }); break;
    }

    // Bag trace only — mock now sends f1=grid natively
    for (const exp of mod.enumerateExports()) {
        if (exp.name !== "_ZN8UserData15updateItemInBagERK8SaveItemPKc") continue;
        Interceptor.attach(exp.address, {
            onEnter(args) {
                const si = args[0];
                send(`[BAG] id=${si.add(0).readU32()} cnt=${si.add(4).readU32()} grid=${si.add(8).readU32()}`);
            }
        }); break;
    }

    installed = true;
    send(`\n[READY]`);
}
setInterval(install, 2000);
install();
