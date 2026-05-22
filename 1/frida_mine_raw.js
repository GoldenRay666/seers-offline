// Deeper trace: hook the actual body bytes and field reads
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Hook the merge function and dump the body bytes
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("submit_map_mine_info_out") &&
        exp.name.includes("MergePartialFromCodedStream")) {

        Interceptor.attach(exp.address, {
            onEnter(args) {
                // args[1] is CodedInputStream*
                const input = args[1];
                // Try to read available data
                send(`[MERGE] this=${args[0]} input=${input}`);

                // Read the bytes from the input stream
                // CodedInputStream has internal buffer
                try {
                    // Try to read the first bytes from input
                    const ptr = input.add(0x10); // might be buffer pointer at offset 0x10
                    const len = input.add(0x18).readU32(); // might be limit at offset 0x18
                    send(`[MERGE] input buffer ptr=${ptr} len=${len}`);

                    if (ptr && !ptr.isNull() && len > 0 && len < 200) {
                        const bytes = ptr.readByteArray(len);
                        if (bytes) {
                            const arr = new Uint8Array(bytes);
                            let hex = '';
                            for (let i = 0; i < arr.length; i++) {
                                hex += arr[i].toString(16).padStart(2, '0') + ' ';
                            }
                            send(`[MERGE] body bytes: ${hex}`);
                        }
                    }
                } catch(e) {
                    send(`[MERGE] Error reading input: ${e.message}`);
                }
            },
            onLeave(retval) {
                send(`[MERGE] Result: ${retval}`);
            }
        });
        send(`Hooked MergePartialFromCodedStream`);
    }
}

// Also hook ReadTag to see which fields are read
for (const exp of mod.enumerateExports()) {
    // Find ReadTag in the google::protobuf::io namespace
    if (exp.name.includes("ReadTag") && exp.name.includes("CodedInputStream")) {
        send(`ReadTag @ ${exp.address}`);
        try {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    if (retval.toInt32() !== 0) {
                        const tag = retval.toInt32();
                        const fieldNum = tag >>> 3;
                        const wireType = tag & 7;
                        send(`[READ] tag=${tag} field=${fieldNum} wire=${wireType}`);
                    }
                }
            });
        } catch(e) {}
    }
}

send(`[+] Hooks active. Go mine!`);
