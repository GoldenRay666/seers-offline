'use strict';
const MODULE = "libgame_logic.so";
let done = 0, base = null;
function L(s) { send(s); }

function install() {
    if (done) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;
    base = mod.base;

    // Hook server_role_t::Merge @ 0x5a1a96
    Interceptor.attach(base.add(0x5a1a96), {
        onEnter(args) {
            this.msg = args[0];
            L(`[server_role Merge] ENTER msg=${this.msg}`);
        },
        onLeave(retval) {
            L(`[server_role Merge] RETURN ${retval.toInt32()}`);
        }
    });

    // Hook player_info_t::Merge @ 0x59f0bc
    Interceptor.attach(base.add(0x59f0bc), {
        onEnter(args) {
            this.msg = args[0];
            L(`[player_info Merge] ENTER msg=${this.msg}`);
        },
        onLeave(retval) {
            L(`[player_info Merge] RETURN ${retval.toInt32()}`);
        }
    });

    L(`[READY] 2 hooks`);
    done = 1;
}
setInterval(install, 1000);
install();
