// Find item-add related functions in game
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

const keywords = ["addItem", "AddItem", "add_item", "addBag",
            "insertItem", "InsertItem", "putItem",
            "receiveItem", "obtainItem", "ObtainItem",
            "gainItem", "GainItem", "pickItem",
            "BagManager", "ItemManager", "ItemBag",
            "addGoods", "AddGoods", "awardItem", "AwardItem"];

for (const kw of keywords) {
    const matches = [];
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes(kw)) matches.push(exp.name);
    }
    if (matches.length > 0 && matches.length <= 20) {
        send(`[${kw}] ${matches.length}:`);
        for (const m of matches) send(`  ${m}`);
    }
}

// Search for Manager functions with item/bag context
send('\n--- Manager item functions ---');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("Manager") && (nm.includes("item") || nm.includes("Item") || nm.includes("bag") || nm.includes("Bag"))) {
        if (nm.length < 120) send(`  ${nm}`);
    }
}
send('[***] Done');
