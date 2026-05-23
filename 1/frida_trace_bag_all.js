// Trace ALL cli_notify_item_bag_updates_out function calls
// No assumptions about which function is the merge
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Hook every single function that mentions notify_item_bag_updates
let count = 0;
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("notify_item_bag_updates")) continue;
    if (exp.name.includes("FieldNumber") || exp.name.includes("descriptor") ||
        exp.name.includes("InitAsDefault") || exp.name.includes("Shared") ||
        exp.name.includes("default_instance") || exp.name.includes("GetMetadata") ||
        exp.name.includes("GetCached") || exp.name.includes("SetCached") ||
        exp.name.includes("ByteSize") || exp.name.includes("Clear") ||
        exp.name.includes("CopyFrom") || exp.name.includes("Swap") ||
        exp.name.includes("New") || exp.name.includes("operator") ||
        exp.name.includes("D2Ev") || exp.name.includes("D0Ev") || exp.name.includes("D1Ev") ||
        exp.name.includes("C1Ev") || exp.name.includes("C2Ev")) continue;

    try {
        Interceptor.attach(exp.address, {
            onEnter(args) {
                const name = exp.name;
                send(`[F${count}] ENTER ${name} arg0=${args[0]} arg1=${args[1]} arg2=${args[2]}`);
                // Dump arg0 (usually 'this' message pointer) if it looks like a message
                if (args[0] && !args[0].isNull()) {
                    try {
                        const raw = args[0].readByteArray(64);
                        const arr = new Uint8Array(raw);
                        let hex = '';
                        for (let i = 0; i < Math.min(arr.length, 64); i += 4) {
                            const v = (arr[i+3]<<24)|(arr[i+2]<<16)|(arr[i+1]<<8)|arr[i];
                            if (v !== 0) hex += `[+${i}]=${(v>>>0)} `;
                        }
                        if (hex) send(`[F${count}]   msg dump: ${hex}`);
                    } catch(e) {}
                }
            },
            onLeave(retval) {
                send(`[F${count}] LEAVE ret=${retval}`);
            }
        });
        send(`[HOOKED] #${count}: ${exp.name}`);
        count++;
    } catch(e) {}
}

send(`[***] Hooked ${count} bag update functions. Now mine to trigger.`);
