// Verify proto merge: dump compiled message memory after each merge
// Compare with IDA: offsets for each field
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

function dumpMsg(msg, size, label) {
    let parts = [];
    for (let i = 0; i < size; i += 4) {
        try {
            const v = msg.add(i).readU32();
            if (v !== 0) parts.push(`[+${i}]=${v}`);
        } catch(e) {}
    }
    send(`[${label}] ${parts.join(', ')}`);
}

// 1. cli_get_item_out::Merge
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("cli_get_item_out")) continue;
    if (!exp.name.includes("MergePartialFromCodedStream")) continue;
    if (exp.name.includes("one_t")) continue;

    Interceptor.attach(exp.address, {
        onEnter(args) { this.msg = args[0]; },
        onLeave(retval) {
            send(`[GETITEM_MERGE] ret=${retval.toInt32()}`);
            dumpMsg(this.msg, 0x40, "GETITEM_MSG");
        }
    });
    send(`[HOOK] get_item_out merge`);
    break;
}

// 2. cli_get_item_out_one_t::Merge
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("cli_get_item_out_one_t")) continue;
    if (!exp.name.includes("MergePartialFromCodedStream")) continue;

    Interceptor.attach(exp.address, {
        onEnter(args) { this.msg = args[0]; },
        onLeave(retval) {
            send(`[GETITEM_ONE_MERGE] ret=${retval.toInt32()}`);
            dumpMsg(this.msg, 0x34, "GETITEM_ONE");
        }
    });
    send(`[HOOK] get_item_out_one_t merge`);
    break;
}

// 3. cli_notify_item_bag_updates_out::Merge
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("notify_item_bag_updates")) continue;
    if (exp.name.includes("one_t")) continue;
    if (!exp.name.includes("MergePartialFromCodedStream")) continue;

    Interceptor.attach(exp.address, {
        onEnter(args) { this.msg = args[0]; },
        onLeave(retval) {
            send(`[BAG_MERGE] ret=${retval.toInt32()}`);
            dumpMsg(this.msg, 0x80, "BAG_MSG");
        }
    });
    send(`[HOOK] bag_updates_out merge`);
    break;
}

// 4. cli_notify_item_bag_updates_out_one_t::Merge
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("notify_item_bag_updates_out_one_t")) continue;
    if (!exp.name.includes("MergePartialFromCodedStream")) continue;

    Interceptor.attach(exp.address, {
        onEnter(args) { this.msg = args[0]; },
        onLeave(retval) {
            send(`[BAG_ONE_MERGE] ret=${retval.toInt32()}`);
            dumpMsg(this.msg, 0x34, "BAG_ONE");
        }
    });
    send(`[HOOK] bag_updates_out_one_t merge`);
    break;
}

// 5. submit_map_mine_info_out::Merge
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("submit_map_mine_info_out")) continue;
    if (!exp.name.includes("MergePartialFromCodedStream")) continue;

    Interceptor.attach(exp.address, {
        onEnter(args) { this.msg = args[0]; },
        onLeave(retval) {
            send(`[MINE_MERGE] ret=${retval.toInt32()}`);
            dumpMsg(this.msg, 0x40, "MINE_MSG");
        }
    });
    send(`[HOOK] submit_map_mine_info_out merge`);
    break;
}

// Also check IsInitialized
for (const exp of mod.enumerateExports()) {
    for (const t of ["notify_item_bag_updates_out_one_t", "notify_item_bag_updates_out",
                      "get_item_out_one_t", "get_item_out", "submit_map_mine_info_out"]) {
        if (exp.name.includes(t) && exp.name.includes("IsInitialized")) {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    const short = t.substring(t.lastIndexOf(':') + 1 || 0).substring(0, 40);
                    send(`[ISINIT] ${short} = ${retval.toInt32()}`);
                }
            });
        }
    }
}

send('[***] All hooks installed. Mine now.');
