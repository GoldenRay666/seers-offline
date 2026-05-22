// Search exports for relevant functions
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
const KW = ["Swallow", "swallow", "Mask", "mask", "Event", "Scene", "Layer", "Quest", "quest", "Npc", "npc"];

for (const kw of KW) {
    const matches = [];
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes(kw)) matches.push(exp.name);
    }
    send(`\n[${kw}] ${matches.length} matches:`);
    for (const m of matches.slice(0, 15)) send(`  ${m}`);
    if (matches.length > 15) send(`  ... and ${matches.length - 15} more`);
}
send(`\n[***] Done`);
