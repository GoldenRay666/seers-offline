// Direct injection: force-write item data into merge result
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

// Hook submit_map_mine_info_out merge
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("submit_map_mine_info_out")) continue;
    if (!exp.name.includes("MergePartialFromCodedStream")) continue;

    const mergeFn = exp.address;
    send(`Merge @ ${mergeFn} (offset ${mergeFn.sub(base)})`);

    Interceptor.attach(mergeFn, {
        onEnter(args) {
            this.msg = args[0];
        },
        onLeave(retval) {
            const msg = this.msg;
            const result = retval.toInt32();
            send(`[MERGE] result=${result}, msg=${msg}`);

            // Read current state
            const v0 = msg.add(12).readU32();
            const v1 = msg.add(16).readU32();
            send(`[MERGE] current: [+12]=${v0} [+16]=${v1}`);

            // Force-write mine_item_id=20081 at offset 12
            msg.add(12).writeU32(20081);
            // Force-write mine_item_count=1 at offset 16
            msg.add(16).writeU32(1);

            const after0 = msg.add(12).readU32();
            const after1 = msg.add(16).readU32();
            send(`[MERGE] forced: [+12]=${after0} [+16]=${after1}`);

            // Ensure merge returns true
            if (result === 0) {
                retval.replace(ptr(1));
                send(`[MERGE] Overrode return to true`);
            }
        }
    });
    send(`[+] Merge interceptor installed`);
    break;
}

// Also hook the text/gain_prize merges and make them succeed
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("MergePartialFromCodedStream")) continue;

    // Make notify_text_msg_out merge succeed (it's used for the text popup)
    if (exp.name.includes("notify_text_msg_out")) {
        Interceptor.attach(exp.address, {
            onLeave(retval) {
                if (retval.toInt32() === 0) {
                    retval.replace(ptr(1));
                }
            }
        });
        send(`[+] text_msg_out merge patched`);
    }

    // Make notify_gain_prize_out merge succeed
    if (exp.name.includes("notify_gain_prize_out")) {
        Interceptor.attach(exp.address, {
            onEnter(args) {
                this.msg = args[0];
            },
            onLeave(retval) {
                if (retval.toInt32() === 0) {
                    // Force-write item into prize message
                    send(`[PRIZE] Injecting item data...`);
                    // The prize message has nested structure
                    // Let's try to find the item fields
                    retval.replace(ptr(1));
                }
            }
        });
        send(`[+] gain_prize_out merge patched`);
    }

    // Make item_bag_updates merge succeed
    if (exp.name.includes("notify_item_bag_updates_out")) {
        Interceptor.attach(exp.address, {
            onLeave(retval) {
                if (retval.toInt32() === 0) {
                    retval.replace(ptr(1));
                }
            }
        });
        send(`[+] item_bag_updates merge patched`);
    }
}

send(`[***] All hooks active. Go mine!`);
