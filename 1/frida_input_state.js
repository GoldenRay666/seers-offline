// Check what's blocking input after quest accept
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Search for all input/touch/movement-related functions
const KW = ["touch", "Touch", "lock", "Lock", "enable", "Enable", "disable", "Disable", "move", "Move", "input", "Input", "swallow", "Swallow"];

let found = [];
for (const exp of mod.enumerateExports()) {
    for (const kw of KW) {
        if (exp.name.includes(kw) && !found.some(f => f.name === exp.name)) {
            found.push(exp);
            break;
        }
    }
}

// Just show the most relevant ones
const relevant = found.filter(f => {
    const n = f.name;
    return n.includes("Lock") || n.includes("lock") ||
           n.includes("Disable") || n.includes("disable") ||
           n.includes("Swallow") || n.includes("swallow") ||
           n.includes("Touch") || n.includes("touch") ||
           n.includes("Move") && n.includes("Player");
});

send(`Found ${relevant.length} relevant functions:`);
for (const r of relevant.slice(0, 30)) {
    send(`  ${r.name}`);
}

// Also find isLocked or isTouchEnabled type functions
const gameFuncs = found.filter(f => {
    const n = f.name;
    return (n.includes("Game") || n.includes("Player") || n.includes("Scene") || n.includes("Map")) &&
           (n.includes("is") || n.includes("get") || n.includes("can") || n.includes("has"));
});

send(`\nGame state check functions:`);
for (const r of gameFuncs.slice(0, 20)) {
    send(`  ${r.name}`);
}
