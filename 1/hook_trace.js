// Stable trace: mining + dispatch
'use strict';
const MODULE = "libgame_logic.so";
let installed = false;

function install() {
    if (installed) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;
    send(`Module @ ${mod.base}`);

    // Guide bypass
    let _guideMgr, _endGuideFn, _processGuideFn;
    for (const e of mod.enumerateExports()) {
        if (e.name.includes("GameGuideManager") && e.name.endsWith("sharedManagerEv"))
            _guideMgr = new NativeFunction(e.address, 'pointer', []);
        if (e.name.includes("GameGuideManager") && e.name.endsWith("8endGuideEv"))
            _endGuideFn = new NativeFunction(e.address, 'void', ['pointer']);
        if (e.name.includes("GameGuideManager") && e.name.endsWith("12processGuideEv"))
            _processGuideFn = new NativeFunction(e.address, 'void', ['pointer']);
    }
    let _gc = false;
    for (const e of mod.enumerateExports()) {
        if (e.name.includes("player_enter_map_out") && e.name.includes("MergePartial")) {
            Interceptor.attach(e.address, {
                onLeave(r) {
                    if (_gc || !_guideMgr || !_endGuideFn) return;
                    _gc = true;
                    setTimeout(() => { const m = _guideMgr(); if(m&&!m.isNull()){_endGuideFn(m);_processGuideFn(m);} }, 2000);
                }
            }); break;
        }
    }

    // Mining merge — autofix + trace
    const ORE_MAP = {1:20081, 2:20082};
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartial")) continue;
        Interceptor.attach(exp.address, {
            onEnter(args) {
                this.n = (this.n||0)+1;
                this.msg = args[0];
                const cs = args[1]; // CodedInputStream*
                // FIX the CodedInputStream: shift buffer forward by 4, extend end by 4
                const oldBuf = cs.add(4).readPointer();
                const oldEnd = cs.add(8).readPointer();
                cs.add(4).writePointer(oldBuf.add(4));
                cs.add(8).writePointer(oldEnd.add(4));
                // Verify
                const newBuf = cs.add(4).readPointer();
                const newEnd = cs.add(8).readPointer();
                let hex = ""; try { for(let i=0;i<newEnd.sub(newBuf).toInt32();i++) hex+=("0"+newBuf.add(i).readU8().toString(16)).slice(-2); } catch(e) {}
                send(`[CS_FIX#${this.n}] buf shifted +4, new data="${hex}"`);
            },
            onLeave(retval) {
                send(`[MINE_MERGE#${this.n}] ret=${retval} msg+8=${this.msg.add(8).readU32()} msg+12=${this.msg.add(12).readU32()}`);
                // fallback autofix
                const ORE_MAP = {1:20081, 2:20082};
                const ore = this.msg.add(12).readU32() || 1;
                const itemId = ORE_MAP[ore] || 20081;
                if (retval.toInt32() === 0) {
                    this.msg.add(8).writeU32(itemId);
                    this.msg.add(12).writeU32(1);
                    retval.replace(ptr(1));
                    send(`[MINE_AUTOFIX] itemId=${itemId}`);
                }
            }
        });
        send(`[HOOK] mine_merge`);
        break;
    }

    installed = true;
    send(`\n[READY]`);
}
setInterval(install, 2000);
install();
