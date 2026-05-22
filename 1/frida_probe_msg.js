// Probe message memory layout to find field offsets
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

let mergeFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("submit_map_mine_info_out") &&
        exp.name.includes("MergePartialFromCodedStream")) {
        mergeFn = exp.address;
    }
}

if (mergeFn) {
    Interceptor.attach(mergeFn, {
        onEnter(args) {
            this.msg = args[0]; // capture this pointer
        },
        onLeave(retval) {
            const msg = this.msg;
            send(`[PROBE] Message at ${msg}`);

            // Read first 48 bytes of message to find field values
            const raw = msg.readByteArray(48);
            const bytes = new Uint8Array(raw);
            let hex = '';
            for (let i = 0; i < bytes.length; i += 4) {
                const val = (bytes[i+3] << 24) | (bytes[i+2] << 16) | (bytes[i+1] << 8) | bytes[i];
                hex += `  [+${i.toString().padStart(2)}]=0x${val.toString(16).padStart(8,'0')}`;
                if ((i + 4) % 16 === 0) hex += '\n';
            }
            send(`[PROBE] Raw bytes:\n${hex}`);
            send(`[PROBE] Merge returned: ${retval}`);

            // Now try writing values at common field offsets
            // Protobuf lite: fields start at +8 (after vtable ptr + has_bits)
            // Field 1 (mine_item_id, uint32) at +8 or +12
            // Field 2 (mine_item_count, uint32) at +12 or +16

            // Try writing to multiple positions
            for (const [idOff, cntOff] of [[8,12], [12,16], [16,20], [4,8]]) {
                const idVal = msg.add(idOff).readU32();
                const cntVal = msg.add(cntOff).readU32();
                send(`  [${idOff},${cntOff}] current: id=${idVal} cnt=${cntVal}`);
            }
        }
    });
    send(`[+] Probe active. Go mine!`);
} else {
    send(`[-] Merge not found`);
}
