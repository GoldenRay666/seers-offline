'use strict';
const MODULE = "libgame_logic.so";
let done = 0, base = null;
function L(s) { send(s); }

function install() {
    if (done) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;
    base = mod.base;

    // Hook getLastServerId
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes("getLastServerId") && exp.name.length < 50) {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    L(`[getLastServerId] returns ${retval} (0x${retval.toString(16)})`);
                }
            });
            L(`[hook] getLastServerId @ ${exp.address.sub(base)}`);
        }
    }

    // Hook the check_session handler entry to see the response fields
    Interceptor.attach(base.add(0x62f0b4), {
        onEnter(args) { L(`[checkSession handler] entered`); },
        onLeave() { L(`[checkSession handler] done`); }
    });

    // Hook the comparison at 0x62f116
    Interceptor.attach(base.add(0x62f116), {
        onEnter(args) {
            // At this point: R7 = getLastServerId(), R3 = local_server.online_id
            L(`[COMPARE] getLastServerId() vs serverInfo.id`);
        }
    });

    done = 1;
    L(`[READY]`);
}
setInterval(install, 1000);
install();
