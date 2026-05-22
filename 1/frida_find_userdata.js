// Find UserData instance
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Search all UserData functions
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("UserData") && nm.length < 100) {
        send(nm);
    }
}

// Also search for m_itemBag which is a member
send('\n=== Looking for UserData singleton ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm === "_ZN8UserData9m_itemBagE" || nm.includes("s_instance") || nm.includes("g_userData")) && nm.length < 80) {
        send(`${nm} @ ${exp.address}`);
    }
}

send('[***] Done');
