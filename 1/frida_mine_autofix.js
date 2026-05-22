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

        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                // msg+12 has ore index from mock field 2 (fits in single-byte varint)
                const oreIndex = this.msg.add(12).readU32();
                const itemId = ORE_MAP[oreIndex] || 20081;
                this.msg.add(8).writeU32(itemId);
                this.msg.add(12).writeU32(1); // count=1
                retval.replace(ptr(1));
            }
        });
        installed = true;
        send("[seers-fix] Mining auto-fix installed (ore map)");
        return;
    }
}

setInterval(install, 1000);
install();
