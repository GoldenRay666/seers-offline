// Find BattleFinishedLayer::ccTouchBegan address
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("BattleFinishedLayer") && exp.name.includes("ccTouchBegan")) {
        send(`${exp.name} @ ${exp.address} (offset ${exp.address.sub(base)})`);
    }
}
send('[***] Done');
