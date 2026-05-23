// Full trace: all submit_map_mine_info_out related functions
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Log ALL submit_map_mine exports
let mergeCount = 0;
send("=== All submit_map_mine_info_out functions ===");
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("submit_map_mine_info_out") && !exp.name.includes("FieldNumber")) {
        send(`  ${exp.name} @ ${exp.address}`);
    }
}

// Hook ALL Merge/MergePartial functions
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("submit_map_mine_info_out")) continue;
    if (exp.name.includes("FieldNumber")) continue;

    if (exp.name.includes("Merge")) {
        Interceptor.attach(exp.address, {
            onEnter(args) {
                this.idx = ++mergeCount;
                this.msg = args[0];
                send(`[M${this.idx}] ENTER ${exp.name} msg=${args[0]} stream=${args[1]}`);
                // Dump stream header if available
                try {
                    const stream = args[1];
                    const pos = stream.add(4).readU32();
                    const end = stream.add(8).readU32();
                    const remaining = end - pos;
                    send(`[M${this.idx}]   stream: pos=${pos} end=${end} remaining=${remaining}`);
                    if (remaining > 0 && remaining < 100) {
                        const data = stream.add(pos).readByteArray(Math.min(remaining, 64));
                        const arr = new Uint8Array(data);
                        let hex = '';
                        for (let i = 0; i < arr.length; i++) hex += arr[i].toString(16).padStart(2,'0');
                        send(`[M${this.idx}]   raw bytes: ${hex}`);
                    }
                } catch(e) {}
            },
            onLeave(retval) {
                const m = this.msg;
                send(`[M${this.idx}] LEAVE ret=${retval.toInt32()}`);
                // Dump first 0x20 bytes of message
                let parts = [];
                for (let i = 0; i < 0x20; i += 4) {
                    try { const v = m.add(i).readU32(); if (v !== 0) parts.push(`[+${i}]=${v}`); } catch(e) {}
                }
                if (parts.length) send(`[M${this.idx}]   msg: ${parts.join(', ')}`);
            }
        });
        send(`[HOOK] ${exp.name}`);
    }
}

// Hook ExtensionSet::ParseField if available
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("ExtensionSet") && exp.name.includes("ParseField")) {
        Interceptor.attach(exp.address, {
            onEnter(args) {
                send(`[EXT] ParseField called`);
            },
            onLeave(retval) {
                send(`[EXT] ParseField ret=${retval.toInt32()}`);
            }
        });
        send(`[HOOK] ${exp.name} @ ${exp.address}`);
    }
}

// Hook IsInitialized
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("submit_map_mine_info_out")) continue;
    if (exp.name.includes("IsInitialized")) {
        Interceptor.attach(exp.address, {
            onLeave(retval) {
                send(`[INIT] IsInitialized=${retval.toInt32()}`);
            }
        });
        send(`[HOOK] ${exp.name} @ ${exp.address}`);
    }
}

send('[***] Ready. Mine now.');
