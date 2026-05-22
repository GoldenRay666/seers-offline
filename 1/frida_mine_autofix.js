// Auto-fix: inject mine_item_id and mine_item_count into mining response
// This script is auto-loaded by Frida Gadget at game startup
'use strict';

const MODULE = "libgame_logic.so";

function install() {
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartialFromCodedStream")) continue;

        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                // Write mine_item_id=20081 at +8, mine_item_count=1 at +12
                this.msg.add(8).writeU32(20081);
                this.msg.add(12).writeU32(1);
                retval.replace(ptr(1));
            }
        });
        send("[seers-fix] Mining auto-fix installed");
        return;
    }
}

// Retry until module is loaded
setInterval(install, 1000);
install();
