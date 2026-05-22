// Hook mining message handler to see what fields are expected
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find handlers related to mine
let found = [];
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("mine") || nm.includes("Mine") || nm.includes("submit_map")) {
        found.push({name: nm, addr: exp.address, offset: exp.address.sub(mod.base)});
    }
}

send(`Found ${found.length} mine-related functions:`);
for (const f of found.slice(0, 20)) {
    send(`  ${f.name} (offset: ${f.offset})`);
}

// Also search for item award / add item functions
send(`\nItem award functions:`);
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm.includes("addItem") || nm.includes("AddItem") ||
         nm.includes("awardItem") || nm.includes("AwardItem") ||
         nm.includes("giveItem") || nm.includes("GiveItem") ||
         nm.includes("obtainItem") || nm.includes("ObtainItem")) &&
        nm.length < 120) {
        send(`  ${nm} (offset: ${exp.address.sub(mod.base)})`);
    }
}

send(`\n[***] Done`);
