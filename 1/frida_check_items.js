// Check player's item and quest state
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Find getItemCountByID function
let getCountFn = null, getItemsCountFn = null, sharedFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN19GameDataManager4Lua16getItemCountByIDEi")
        getCountFn = exp.address;
    if (exp.name === "_ZN19GameDataManager4Lua13getItemsCountEv")
        getItemsCountFn = exp.address;
    // GameDataManager4Lua shared
    if (exp.name.includes("GameDataManager4Lua") && exp.name.includes("shared"))
        sharedFn = exp.address;
}

if (getCountFn && getItemsCountFn) {
    // Try calling getItemsCount - it might be a static method
    try {
        const getCount = new NativeFunction(getItemsCountFn, 'int', []);
        const total = getCount();
        send(`Total items: ${total}`);
    } catch(e) {
        send(`getItemsCount error: ${e.message}`);
    }

    // Try getItemCountByID for 20081
    try {
        const getById = new NativeFunction(getCountFn, 'int', ['int']);
        const cnt = getById(20081);
        send(`Item 20081 count: ${cnt}`);
    } catch(e) {
        send(`getItemCountByID error: ${e.message}`);
    }
}

// Also check quest state via QuestManager
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN12QuestManager15isQuestFinishedEt") {
        try {
            // Need sharedManager first
            const fn = exp.address;
            send(`isQuestFinished @ ${fn}`);
        } catch(e) {}
    }
}

send('[***] Done');
