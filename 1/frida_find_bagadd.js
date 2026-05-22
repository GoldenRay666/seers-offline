// Find function that adds items to player backpack
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Search for bag/inventory/storage add functions
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm.includes("bag") || nm.includes("Bag") || nm.includes("storage") || nm.includes("Storage") ||
         nm.includes("inventory") || nm.includes("Inventory") || nm.includes("backpack")) &&
        (nm.includes("add") || nm.includes("Add") || nm.includes("insert") || nm.includes("Insert") ||
         nm.includes("put") || nm.includes("Put") || nm.includes("push") || nm.includes("Push") ||
         nm.includes("update") || nm.includes("Update")) &&
        nm.length < 120) {
        send(nm);
    }
}

// Also search for item grid management
send('\n=== Item Grid functions ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("Grid") && nm.includes("Item") && nm.length < 100) {
        send(nm);
    }
}

send('[***] Done');
