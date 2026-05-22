// Probe cli_notify_gain_prize_out message layout
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find the merge function
let mergeFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes('notify_gain_prize_out') &&
        exp.name.includes('MergePartialFromCodedStream')) {
        mergeFn = exp.address;
    }
}

if (mergeFn) {
    send(`Merge @ ${mergeFn}`);
    Interceptor.attach(mergeFn, {
        onEnter(args) {
            this.msg = args[0];
        },
        onLeave(retval) {
            const msg = this.msg;
            send(`[PROBE] notify_gain_prize_out @ ${msg}, merge=${retval.toInt32()}`);

            // Read first 64 bytes
            const raw = msg.readByteArray(64);
            const bytes = new Uint8Array(raw);
            let hex = '';
            for (let i = 0; i < bytes.length; i += 4) {
                const val = (bytes[i+3] << 24) | (bytes[i+2] << 16) | (bytes[i+1] << 8) | bytes[i];
                const v = val >>> 0; // unsigned
                hex += `[+${i.toString().padStart(2)}]=${v.toString(10).padStart(10)} `;
                if ((i + 4) % 16 === 0) hex += '\n';
            }
            send(`[PROBE] Memory:\n${hex}`);

            // Also check common offset patterns
            for (let off = 4; off < 48; off += 4) {
                const v = msg.add(off).readU32();
                if (v > 0 && v < 100000) {
                    send(`  offset +${off}: potential item_id or count = ${v}`);
                }
            }
        }
    });
    send(`[+] Hooked. Go mine!`);
} else {
    send(`[-] Merge not found`);
}
