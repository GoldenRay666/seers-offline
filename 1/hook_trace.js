'use strict';
const MODULE = "libgame_logic.so";
let installed = false;

function install() {
    if (installed) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

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

    // Mining merge + CS_FIX (proven working)
    const ORE_MAP = {1:20081, 2:20082};
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartial")) continue;
        Interceptor.attach(exp.address, {
            onEnter(args) {
                this.m = args[0];
                const cs = args[1];
                try {
                    const buf = cs.add(4).readPointer();
                    const end = cs.add(8).readPointer();
                    if (buf.toInt32() > 0x10000) {
                        cs.add(4).writePointer(buf.add(4));
                        cs.add(8).writePointer(end.add(4));
                    }
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

    // updateItemInBag
    for (const exp of mod.enumerateExports()) {
        if (exp.name !== "_ZN8UserData15updateItemInBagERK8SaveItemPKc") continue;
        Interceptor.attach(exp.address, {
            onEnter(args) {
                const si = args[0];
                const cnt = si.add(0).readU32();
                const grid = si.add(4).readU32();
                const itemId = si.add(0x1C).readU32();
                if (itemId > 0 && itemId < 100000 && cnt > 0) {
                    si.add(0).writeU32(itemId);
                    si.add(4).writeU32(cnt);
                    if (grid < 1) si.add(8).writeU32(1);
                }
            }
        }); break;
    }

    installed = true;
    send(`\n[READY]`);
}
setInterval(install, 2000);
install();
