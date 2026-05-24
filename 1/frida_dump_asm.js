// Use Frida's Instruction API to disassemble getItemBagDump
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

let targetAddr = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN12ItemBagLayer14getItemBagDumpEv") {
        targetAddr = exp.address;
        break;
    }
}

if (!targetAddr) { send("not found"); } else {
    // Thumb mode: address must have LSB=1
    const thumbAddr = targetAddr.or(1);
    send(`getItemBagDump @ ${targetAddr} (offset ${targetAddr.sub(base)})`);

    // Read function size estimate
    const maxBytes = 1024;
    let addr = thumbAddr;
    let count = 0;

    while (count < 300 && addr.sub(thumbAddr) < maxBytes) {
        try {
            const insn = Instruction.parse(addr);
            send(`  +${addr.sub(base).toString(16).padStart(4)}: ${insn.toString()}`);
            addr = insn.next;
            count++;
        } catch(e) {
            // Try next aligned address
            addr = addr.add(2);
            if (addr.sub(thumbAddr) > maxBytes) break;
        }
    }
}

send('[DONE]');
