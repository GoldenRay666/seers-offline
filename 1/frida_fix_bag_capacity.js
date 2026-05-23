// Fix backpack capacity: write 999 to compiled field1 of cli_notify_item_bag_updates_out
// Compiled field1 = capacity (required, no wire mapping, default=0)
// This is the same shift pattern as one_t's grid_id
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
let installed = false;

function install() {
    if (installed) return;

    // 1. Find and hook cli_notify_item_bag_updates_out Merge
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("notify_item_bag_updates_out")) continue;

        // Hook IsInitialized - force return true (same issue as one_t)
        if (exp.name.includes("IsInitialized")) {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    if (retval.toInt32() === 0) {
                        retval.replace(ptr(1));
                        send("[BAGFIX] IsInitialized forced true");
                    }
                }
            });
            send(`[BAGFIX] IsInitialized hooked @ ${exp.address}`);
        }

        // Hook Merge to inject capacity
        if (exp.name.includes("MergePartialFromCodedStream")) {
            Interceptor.attach(exp.address, {
                onEnter(args) { this.msg = args[0]; },
                onLeave(retval) {
                    // Write capacity=999 at compiled field1 (likely msg+0 or msg+4)
                    // Try both offsets
                    // one_t layout: compiled_f1@+0..+7 (8 bytes), item_id@+8, count@+12
                    // Parent layout: capacity(f1)@+0 or +4, items vector@+8
                    this.msg.add(0).writeU32(999);
                    this.msg.add(4).writeU32(999);
                    send(`[BAGFIX] Merge done, wrote 999 to +0 and +4`);
                    // Force return true
                    retval.replace(ptr(1));
                }
            });
            send(`[BAGFIX] Merge hooked @ ${exp.address}`);
        }
    }

    // 2. Also hook IsInitialized for the one_t inside bag updates
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes("notify_item_bag_updates_out_one_t") &&
            exp.name.includes("IsInitialized")) {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    if (retval.toInt32() === 0) {
                        retval.replace(ptr(1));
                        send("[BAGFIX] one_t IsInitialized forced true");
                    }
                }
            });
            send(`[BAGFIX] one_t IsInitialized hooked @ ${exp.address}`);
        }
    }

    installed = true;
    send("[BAGFIX] All hooks installed. Capacity will be set to 999 on next bag update.");
}

setInterval(install, 2000);
install();
