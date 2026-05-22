// Inject mine_item data directly, bypassing proto parsing
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find set_mine_item_id and set_mine_item_count functions
let setItemId = null;
let setItemCount = null;
let mergeFn = null;

for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("submit_map_mine_info_out")) {
        if (nm.includes("set_mine_item_id")) {
            setItemId = exp.address;
            send(`set_mine_item_id @ ${exp.address}`);
        }
        if (nm.includes("set_mine_item_count")) {
            setItemCount = exp.address;
            send(`set_mine_item_count @ ${exp.address}`);
        }
        if (nm.includes("MergePartialFromCodedStream")) {
            mergeFn = exp.address;
            send(`MergePartialFromCodedStream @ ${exp.address}`);
        }
    }
}

if (mergeFn && setItemId && setItemCount) {
    Interceptor.attach(mergeFn, {
        onLeave(retval) {
            // If merge failed (returned false), manually set fields
            if (retval.toInt32() === 0) {
                send(`[FIX] Merge failed, injecting item data manually...`);
                // this is the message object (first arg)
                const msg = this.context.r0; // ARM: first arg in R0
                // Call set_mine_item_id(msg, 20081)
                const setId = new NativeFunction(setItemId, 'void', ['pointer', 'uint32']);
                setId(msg, 20081);
                send(`[FIX] Set mine_item_id = 20081`);
                // Call set_mine_item_count(msg, 1)
                const setCnt = new NativeFunction(setItemCount, 'void', ['pointer', 'uint32']);
                setCnt(msg, 1);
                send(`[FIX] Set mine_item_count = 1`);
                // Override return value to true
                retval.replace(ptr(1));
                send(`[FIX] Return value overridden to true`);
            } else {
                send(`[FIX] Merge succeeded normally`);
            }
        }
    });
    send(`[+] Merge interceptor installed. Go mine!`);
} else {
    send(`[-] Missing functions: mergeFn=${!!mergeFn} setId=${!!setItemId} setCnt=${!!setItemCount}`);
}
