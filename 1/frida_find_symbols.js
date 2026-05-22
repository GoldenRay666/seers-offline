// Phase 1: Verify addresses by finding exported symbols
'use strict';

const MODULE = "libgame_logic.so";

const mod = Process.findModuleByName(MODULE);
if (!mod) { send("[-] Module not found"); } else {
    send(`[+] ${MODULE} at ${mod.base}, size=${mod.size}`);

    // Search for key guide functions in exports
    const keywords = ["isInGuide", "Guide", "guide", "guideWalk", "guideTake", "processGuide", "beginGuide", "endGuide"];
    const exports = mod.enumerateExports();
    send(`[+] Total exports: ${exports.length}`);

    for (const kw of keywords) {
        const matches = exports.filter(e => e.name.includes(kw));
        if (matches.length > 0) {
            send(`\n[EXPORT] "${kw}" matches:`);
            for (const m of matches.slice(0, 10)) {
                send(`  ${m.name} @ ${m.address} (offset: ${m.address.sub(mod.base)})`);
            }
        } else {
            send(`[-] "${kw}" not found in exports`);
        }
    }
}

send(`\n[***] Done.`);
