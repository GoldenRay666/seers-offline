// Hook submit_map_mine_info_out accessors to find field numbers
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find all mine-related accessors
const hooks = [];
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("mine_item") || nm.includes("MineItem") || nm.includes("mine_info_out")) {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    send(`[ACCESS] ${nm} this=${args[0]}`);
                }
            });
            hooks.push(nm);
        } catch(e) {}
    }
}

send(`[+] Hooked ${hooks.length} mine accessors`);

// Specifically find getters for the response message
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm.includes("mine_item_id") || nm.includes("mine_item_count")) &&
        !nm.includes("FieldNumber")) {
        send(`  GETTER: ${nm}`);
    }
}

send(`[***] Ready - go mine now`);
