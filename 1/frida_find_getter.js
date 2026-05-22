// Find mine_item_id getter function
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

for (const exp of mod.enumerateExports()) {
    if (exp.name.includes('mine_item_id') && !exp.name.includes('FieldNumber')) {
        send(`${exp.name} @ ${exp.address} (offset ${exp.address.sub(base)})`);
    }
    if (exp.name.includes('mine_item_count') && !exp.name.includes('FieldNumber')) {
        send(`${exp.name} @ ${exp.address} (offset ${exp.address.sub(base)})`);
    }
}
send('[***] Done');
