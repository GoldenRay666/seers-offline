// Find how to create/update SaveItem for backpack
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

send('=== UserData functions ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("UserData") && (nm.includes("Item") || nm.includes("item")) && nm.length < 100) {
        send(nm);
    }
}

send('\n=== SaveItem functions ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("SaveItem") && (nm.includes("C1") || nm.includes("C2") || nm.includes("create") || nm.includes("init")) && nm.length < 100) {
        send(nm);
    }
}

send('\n=== handleNtfMsgCliItemBagUpdate ===');
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("handleNtfMsgCliItemBagUpdate")) {
        send(`${exp.name} @ ${exp.address}`);
    }
}

send('[***] Done');
