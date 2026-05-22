// Find submit_map_mine_info_out field numbers by tracing MergePartialFromCodedStream
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find the MergePartialFromCodedStream function for submit_map_mine_info_out
let mergeFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("submit_map_mine_info_out") &&
        exp.name.includes("MergePartialFromCodedStream")) {
        mergeFn = exp.address;
        send(`MergePartialFromCodedStream @ ${exp.address} (offset: ${exp.address.sub(mod.base)})`);
    }
}

if (mergeFn) {
    // Read the ARM Thumb code to find the field numbers
    // The function reads each field tag (varint) and does a switch/case
    // Field tags are: (field_number << 3) | wire_type
    // Wire type 0 (varint) = tag value = field_number * 8 + 0

    const code = mergeFn.readByteArray(0x200);
    const bytes = new Uint8Array(code);

    // Look for MOVW/MOVT or CMP patterns that set field tag values
    let output = 'Field tags: ';
    for (let i = 0; i < bytes.length - 1; i++) {
        // Thumb CMP: compare with immediate
        // CMP R0, #imm: 0x28xx (16-bit) or 0xF1Bx xxxx (32-bit)
        if (bytes[i] === 0x28 && bytes[i+1] >= 0x00) {
            let imm = bytes[i+1];
            if (imm >= 0x08 && imm <= 0x78 && imm % 8 === 0) {
                const fieldNum = imm >> 3;
                output += `[f${fieldNum}] `;
            }
        }
    }
    send(output);
}

// Alternatively, just search for the kMineItemIdFieldNumber value
// These are static const int members
send(`\nSearching exports for field number constants...`);
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("FieldNumber") && exp.name.includes("mine")) {
        send(`  ${exp.name}`);
    }
}

send(`[***] Done`);
