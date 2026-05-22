// Disassemble MergePartialFromCodedStream to find setter calls
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

// Find merge function
let mergeFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("submit_map_mine_info_out") &&
        exp.name.includes("MergePartialFromCodedStream")) {
        mergeFn = exp.address;
    }
}

if (mergeFn) {
    const offset = mergeFn.sub(base);
    send(`Merge at offset 0x${offset.toString(16)}`);

    // Read and disassemble first 0x80 bytes
    const bytes = mergeFn.readByteArray(0x80);
    const arr = new Uint8Array(bytes);

    // Simple Thumb disassembly - look for BL/BLX instructions
    // Thumb-2 BL: first half F0-F7, second half D0-DF or C0-CF or F0-FF
    for (let i = 0; i < arr.length - 3; i += 2) {
        const h1 = (arr[i+1] << 8) | arr[i];
        const h2 = (arr[i+3] << 8) | arr[i+2];

        // Check for BL (Thumb-2 32-bit)
        if ((h1 & 0xF800) === 0xF000 && (h2 & 0xD000) === 0xD000) {
            // Calculate target
            const S = (h1 >> 10) & 1;
            const imm10 = h1 & 0x3FF;
            const J1 = (h2 >> 13) & 1;
            const J2 = (h2 >> 11) & 1;
            const imm11 = h2 & 0x7FF;

            const I1 = ~(J1 ^ S) & 1;
            const I2 = ~(J2 ^ S) & 1;
            let offset32 = (S << 24) | (I1 << 23) | (I2 << 22) | (imm10 << 12) | (imm11 << 1);
            if (S) offset32 -= (1 << 25);

            const targetAddr = mergeFn.add(i + 4 + offset32);
            const targetOffset = targetAddr.sub(base);

            // Try to resolve the function name
            let name = '?';
            for (const exp of mod.enumerateExports()) {
                const eoff = exp.address.sub(base);
                if (eoff.equals(targetOffset) ||
                    (targetOffset.toInt32() === eoff.toInt32() + 1)) {
                    name = exp.name;
                    break;
                }
            }

            if (name === '?') {
                send(`  BL 0x${targetOffset.toString(16)} [${name}]`);
            } else if (name.includes('set_') || name.includes('mine')) {
                send(`  BL 0x${targetOffset.toString(16)} → ${name} ⭐`);
            }
        }
    }
}
