// Quick lookup of OpenFunctionLayer mask functions
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("OpenFunctionLayer") && (exp.name.includes("Mask") || exp.name.includes("mask"))) {
        send(`${exp.name} @ ${exp.address} (offset: ${exp.address.sub(mod.base)})`);
    }
}
send("Done");
