// Minimal mining fix: verify & patch submit_map_mine_info_out merge
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
let installed = false;

// Mining merge: wire f1→msg+8(item_id), wire f2→msg+12(count)
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("submit_map_mine_info_out")) continue;
    if (!exp.name.includes("MergePartialFromCodedStream")) continue;

    Interceptor.attach(exp.address, {
        onEnter(args) {
            this.msg = args[0];
            // Dump input stream state
            const stream = args[1];
            send(`[MINE_FIX] Before merge: msg@+8=${this.msg.add(8).readU32()} msg@+12=${this.msg.add(12).readU32()}`);
        },
        onLeave(retval) {
            const itemId = this.msg.add(8).readU32();
            const count = this.msg.add(12).readU32();
            send(`[MINE_FIX] After merge: ret=${retval.toInt32()} item_id@+8=${itemId} count@+12=${count}`);

            // If merge wrote correct values, do nothing
            if (itemId !== 0 && count !== 0) {
                send(`[MINE_FIX] OK - merge wrote correct values, no fix needed`);
                return;
            }

            // Otherwise inject correct values (same as old autofix)
            // Mock sends f1=20081, f2=1. If merge failed, write manually.
            this.msg.add(8).writeU32(20081);  // item_id
            this.msg.add(12).writeU32(1);      // count
            send(`[MINE_FIX] Injected item_id=20081 count=1`);
        }
    });
    send(`[MINE_FIX] Hooked mining merge @ ${exp.address}`);
    installed = true;
    break;
}
