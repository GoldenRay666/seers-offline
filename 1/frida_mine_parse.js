// Hook MergePartialFromCodedStream for submit_map_mine_info_out
// to see what fields are parsed from the response

'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find merge function
let mergeFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("submit_map_mine_info_out") &&
        exp.name.includes("MergePartialFromCodedStream")) {
        mergeFn = exp.address;
        send(`MergePartialFromCodedStream @ ${exp.address}`);
    }
}

if (!mergeFn) {
    send("[-] Merge function not found");
} else {
    // Hook the merge function
    // The function signature is: bool MergePartialFromCodedStream(MessageLite* this, CodedInputStream* input)
    // args[0] = this (message being merged into)
    // args[1] = CodedInputStream*

    Interceptor.attach(mergeFn, {
        onEnter(args) {
            this.msg = args[0];
            send(`[MERGE] Parsing submit_map_mine_info_out...`);
        },
        onLeave(retval) {
            send(`[MERGE] Done, result=${retval}`);
        }
    });

    // Also hook the specific field accessors
    // Find mine_item_id() getter
    let setId = null, setCount = null;
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes("set_mine_item_id") && exp.name.includes("submit_map_mine_info_out")) {
            setId = exp.address;
            send(`set_mine_item_id @ ${exp.address}`);
        }
        if (exp.name.includes("set_mine_item_count") && exp.name.includes("submit_map_mine_info_out")) {
            setCount = exp.address;
            send(`set_mine_item_count @ ${exp.address}`);
        }
    }

    if (setId) {
        Interceptor.attach(setId, {
            onEnter(args) {
                send(`[SET] mine_item_id = ${args[1]}`);
            }
        });
    }
    if (setCount) {
        Interceptor.attach(setCount, {
            onEnter(args) {
                send(`[SET] mine_item_count = ${args[1]}`);
            }
        });
    }
}

send(`[+] Hooks active. Go mine now!`);
