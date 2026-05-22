// Trace which fields the game reads from submit_map_mine_info_out
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Hook google::protobuf::MessageLite::ParseFromArray and log mine-related parses
// But that's complex. Instead, hook the high-level handler

// Find all protobuf read functions
// Protobuf read functions: ReadTag, ReadVarint32, ReadLittleEndian32, etc.
// Let's hook the tag reader to see what fields are accessed

for (const exp of mod.enumerateExports()) {
    // Look for functions related to mine handling
    if (exp.name.includes("Mine") || exp.name.includes("mine")) {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    send(`[MINE-FN] ${exp.name}`);
                }
            });
        } catch(e) {}
    }
}

send(`[+] Mine hooks installed`);

// Also hook the generic "handle message" dispatch
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm === "_ZN11NetWorkUtil15dispatchMessageEPciS0_ii" ||
         nm.includes("dispatchMessage")) && nm.length < 80) {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    // args[0] = buffer, args[1] = length, args[2] = cmd name
                    const cmdName = args[2].readCString();
                    if (cmdName && cmdName.includes("mine")) {
                        const len = args[1].toInt32();
                        send(`[DISPATCH] ${cmdName} len=${len}`);
                    }
                }
            });
        } catch(e) {}
        break;
    }
}

send(`[***] Ready. Go mine now...`);
