// Read the actual field number values from memory
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

// The kMineItemIdFieldNumber and kMineItemCountFieldNumber are static const int
// They appear in the symbol table at known offsets within .rodata
// Let me search for them by scanning memory near the string references

// Find the string in memory
const str1 = 'kMineItemIdFieldNumber';
const str2 = 'kMineItemCountFieldNumber';

// Scan for these strings in the module's memory
const modSize = mod.size;
const modEnd = base.add(modSize);

// Use Module findExportByName equivalent: scan exports for the strings
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes('MineItemIdFieldNumber')) {
        // The VALUE of this constant is an integer stored as an immediate
        // in the code that references it, or as a static initializer
        send(`Found symbol: ${exp.name} @ ${exp.address}`);
    }
    if (exp.name.includes('MineItemCountFieldNumber')) {
        send(`Found symbol: ${exp.name} @ ${exp.address}`);
    }
}

// Instead, look for the field numbers by tracing the Merge function
// The merge function has inline code that reads specific fields
// Let's hook it and trace the actual field tags being read

// Find ReadTag function
let readTag = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes('ReadTag') && exp.name.includes('CodedInputStream') && !exp.name.includes('Expect')) {
        readTag = exp.address;
        break;
    }
}

if (readTag) {
    send(`ReadTag @ ${readTag}`);
    Interceptor.attach(readTag, {
        onLeave(retval) {
            const tag = retval.toInt32();
            if (tag > 0) {
                const fn = tag >>> 3;
                const wt = tag & 7;
                send(`[ReadTag] field=${fn} wire_type=${wt}`);
            }
        }
    });
    send(`[+] ReadTag hooked. Go mine!`);
} else {
    send(`[-] ReadTag not found`);
}
