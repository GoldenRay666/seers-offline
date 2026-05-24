// Find what functions getItemBagDump calls (by address)
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

// Addresses seen in getItemBagDump disassembly:
// These are absolute addresses from a specific session. Calculate offsets.
// The session where disassembly was done had getItemBagDump @ 0xc0f21005
// Current session getItemBagDump might be at a different address.
// Let's find the current address first.
let dumpAddr = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN12ItemBagLayer14getItemBagDumpEv") {
        dumpAddr = exp.address;
        break;
    }
}

if (!dumpAddr) { send("not found"); } else {
    const dumpOffset = dumpAddr.sub(base);
    send(`getItemBagDump offset: 0x${dumpOffset.toString(16)}`);

    // The function is at offset 0x4d8005 (from earlier session: 0xc0f21005 - base)
    // Let's read the function and find BL/BLX instructions
    const code = dumpAddr.readByteArray(1024);
    const arr = new Uint8Array(code);

    let pos = 0;
    let calls = [];
    while (pos < arr.length - 3) {
        const hw = arr[pos] | (arr[pos+1] << 8);

        // BL instruction: 0xF000-0xF7FF for first halfword
        if ((hw & 0xF800) === 0xF000 && pos + 3 < arr.length) {
            const hw2 = arr[pos+2] | (arr[pos+3] << 8);
            const S = (hw >> 10) & 1;
            const J1 = (hw2 >> 13) & 1;
            const J2 = (hw2 >> 11) & 1;
            const I1 = ~(J1 ^ S) & 1;
            const I2 = ~(J2 ^ S) & 1;
            const imm10 = hw & 0x3FF;
            const imm11 = hw2 & 0x7FF;
            let offset = (S << 24) | (I1 << 23) | (I2 << 22) | (imm10 << 12) | (imm11 << 1);
            if (S) offset |= 1;
            if (offset & (1<<24)) offset -= (1<<25);
            const target = dumpAddr.add(pos + 4 + offset);
            calls.push({pos, target});
            pos += 4;
            continue;
        }

        // BLX instruction: 0x4700 for register BLX
        if (hw === 0x4700 || hw === 0x4780) {
            pos += 2;
            continue;
        }
        // BLX label: 0xF000-0xF7FF with specific bits
        if ((hw & 0xFFF0) === 0xF0C0 && pos + 3 < arr.length) {
            // This is a BLX to an immediate
            pos += 4;
            continue;
        }

        pos += 2;
    }

    // For each call target, find the function name
    send(`Found ${calls.length} BL calls:`);
    for (const c of calls) {
        // Check if there's an export near this address
        let name = '?';
        for (const exp of mod.enumerateExports()) {
            const diff = exp.address.sub(c.target).toInt32();
            if (Math.abs(diff) < 4) {
                name = exp.name;
                break;
            }
        }
        const off = c.target.sub(base);
        send(`  +${c.pos.toString(16)}: calls 0x${off.toString(16)} — ${name}`);
    }
}

send('[DONE]');
