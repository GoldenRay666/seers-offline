// Disassemble updateItemInBag to find SaveItem offsets
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData15updateItemInBagERK8SaveItemPKc") {
        const addr = exp.address;
        const offset = addr.sub(base);
        send(`updateItemInBag @ ${addr} (offset ${offset})`);

        // Read 0x100 bytes of code
        const bytes = addr.readByteArray(0x100);
        const arr = new Uint8Array(bytes);

        // Look for LDR with R1 base (SaveItem pointer)
        for (let i = 0; i < arr.length - 1; i += 2) {
            const h = (arr[i+1] << 8) | arr[i];

            // LDR Rd, [Rn, #imm5*4]: 0110 1xxx (Thumb-1)
            if ((h & 0xF800) === 0x6800) {
                const rd = (h >> 8) & 7;  // actually bits [10:8]? No, that's wrong
                // Actually: bits [2:0] = Rn, bits [5:3] = Rd? No.
                // Thumb-1 LDR: 0110 1 imm5 Rn Rd
                // Wait, different encoding:
                // LDR Rt, [Rn, #imm5*4]: 0110 1 imm5 Rn Rt
                // imm5 = bits[10:6], Rn = bits[5:3], Rt = bits[2:0]
                const imm5 = (h >> 6) & 0x1F;
                const rn = (h >> 3) & 7;
                const rt = h & 7;
                const off = imm5 * 4;
                if (rn === 1) {  // R1 = SaveItem
                    send(`  LDR R${rt}, [R1, #${off}] at +0x${i.toString(16)}`);
                }
            }

            // 32-bit Thumb-2 LDR: 1111 1000 0101 xxxx
            // LDR.W Rt, [Rn, #imm12]
            if (i < arr.length - 3) {
                const h2 = (arr[i+3] << 8) | arr[i+2];
                if ((h & 0xFFF0) === 0xF8D0) {  // LDR.W
                    const rn = h & 0xF;
                    const rt = (h2 >> 12) & 0xF;
                    const imm12 = h2 & 0xFFF;
                    if (rn === 1) {
                        send(`  LDR.W R${rt}, [R1, #${imm12}] at +0x${i.toString(16)}`);
                    }
                }
                // LDRH.W: 1111 1000 1011 xxxx
                if ((h & 0xFFF0) === 0xF8B0) {
                    const rn = h & 0xF;
                    const rt = (h2 >> 12) & 0xF;
                    const imm12 = h2 & 0xFFF;
                    if (rn === 1) {
                        send(`  LDRH.W R${rt}, [R1, #${imm12}] at +0x${i.toString(16)}`);
                    }
                }
                // LDRB.W: 1111 1000 1001
                if ((h & 0xFFF0) === 0xF890) {
                    const rn = h & 0xF;
                    const rt = (h2 >> 12) & 0xF;
                    const imm12 = h2 & 0xFFF;
                    if (rn === 1) {
                        send(`  LDRB.W R${rt}, [R1, #${imm12}] at +0x${i.toString(16)}`);
                    }
                }
            }
        }
        break;
    }
}
send('[***] Done');
