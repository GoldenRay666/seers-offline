// Find Lua bridge functions for item operations
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

send('=== Lua item functions ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes('Lua') && (nm.includes('Item') || nm.includes('item') || nm.includes('Bag') || nm.includes('bag'))) {
        send(`  ${nm}`);
    }
}

send('\n=== OnlineNetworkManager functions ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes('OnlineNetworkManager') && nm.includes('Item')) {
        send(`  ${nm}`);
    }
}

send('\n=== CheatLayer (debug commands) ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes('CheatLayer')) {
        send(`  ${nm}`);
    }
}
send('[***] Done');
