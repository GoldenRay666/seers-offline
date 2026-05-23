// Find GameItemDataManager functions
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

send("=== GameItemDataManager functions ===");
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("GameItemDataManager") && exp.name.length < 120) {
        send(`  ${exp.name} @ ${exp.address}`);
    }
}

send("\n=== UserData item functions ===");
for (const exp of mod.enumerateExports()) {
    if ((exp.name.includes("UserData") || exp.name.includes("ItemBag") || exp.name.includes("itemBag")) &&
        (exp.name.includes("add") || exp.name.includes("Add") || exp.name.includes("update") || exp.name.includes("Update") ||
         exp.name.includes("Item") || exp.name.includes("item")) && exp.name.length < 120) {
        send(`  ${exp.name} @ ${exp.address}`);
    }
}

send("\n=== SaveItem related ===");
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("SaveItem") && exp.name.length < 100) {
        send(`  ${exp.name} @ ${exp.address}`);
    }
}

send("\n[***] Done");
