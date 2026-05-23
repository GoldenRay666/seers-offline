// Find capacity offset in compiled cli_notify_item_bag_updates_out
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
let done = false;

// Hook notify_item_bag_updates_out Merge
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("notify_item_bag_updates")) continue;

    if (exp.name.includes("MergePartialFromCodedStream") && !exp.name.includes("one_t")) {
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                if (done) return;
                const msg = this.msg;
                // Dump 64 bytes with both u32 and byte view
                let parts = [];
                for (let i = 0; i < 64; i += 4) {
                    try {
                        const v = msg.add(i).readU32();
                        if (v !== 0) parts.push(`[+${i}]=${v}`);
                    } catch(e) {}
                }
                send(`[MERGE_DUMP] non-zero fields: ${parts.join(', ')}`);
                send(`[MERGE_DUMP] retval=${retval.toInt32()}`);

                // Also read as individual bytes for raw hex
                try {
                    const raw = msg.readByteArray(64);
                    const arr = new Uint8Array(raw);
                    let hex = '';
                    for (let i = 0; i < arr.length; i++) {
                        hex += arr[i].toString(16).padStart(2,'0');
                        if ((i+1) % 4 === 0) hex += ' ';
                        if ((i+1) % 16 === 0) hex += '\n';
                    }
                    send(`[MERGE_HEX]\n${hex}`);
                } catch(e) {}
                done = true;
            }
        });
        send(`[PROBE] Merge hooked @ ${exp.address}`);
        break;
    }
}

// Hook IsInitialized for the parent message
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("notify_item_bag_updates")) continue;
    if (exp.name.includes("IsInitialized") && !exp.name.includes("one_t")) {
        Interceptor.attach(exp.address, {
            onLeave(retval) {
                send(`[ISINIT] parent IsInitialized = ${retval.toInt32()}`);
            }
        });
        send(`[PROBE] IsInitialized hooked @ ${exp.address}`);
        break;
    }
}

// Hook one_t IsInitialized
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("notify_item_bag_updates_out_one_t") &&
        exp.name.includes("IsInitialized")) {
        Interceptor.attach(exp.address, {
            onLeave(retval) {
                send(`[ISINIT] one_t IsInitialized = ${retval.toInt32()}`);
            }
        });
        send(`[PROBE] one_t IsInitialized hooked @ ${exp.address}`);
        break;
    }
}

// Hook handler function for bag updates to see what it reads
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("notify_item_bag") && !nm.includes("IsInitialized") &&
        !nm.includes("Merge") && !nm.includes("descriptor") &&
        !nm.includes("FieldNumber") && !nm.includes("one_t") &&
        !nm.includes("Serialize") && !nm.includes("Coded") &&
        !nm.includes("ByteSize") && !nm.includes("CopyFrom") &&
        !nm.includes("operator") && !nm.includes("Swap") &&
        !nm.includes("New") && nm.length < 120) {
        send(`[PROBE] Handler candidate: ${nm} @ ${exp.address}`);
    }
}

send("[***] Trigger by mining");
