// Minimal fix: only force IsInitialized=true for shifted-field messages
// The descriptor-to-compiled field shift is a binary incompatibility,
// not a server logic issue. This is the minimum required hook.
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
let count = 0;

// These messages have required fields with no wire mapping due to proto version mismatch
const TARGETS = [
    "cli_notify_item_bag_updates_out_one_t",
    "cli_notify_item_bag_updates_out",
    "submit_map_mine_info_out",
];

for (const exp of mod.enumerateExports()) {
    for (const t of TARGETS) {
        if (exp.name.includes(t) && exp.name.includes("IsInitialized")) {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    if (retval.toInt32() === 0) {
                        retval.replace(ptr(1));
                    }
                }
            });
            count++;
        }
    }
}

send(`[MINIMAL] Fixed IsInitialized for ${count} shifted-field messages`);
