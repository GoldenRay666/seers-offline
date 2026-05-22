// Hook the actual field setters for gain_prize and item_bag messages
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find ALL set_/add_/mutable_ functions for these message types
let found = [];
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm.includes('notify_gain_prize') || nm.includes('notify_item_bag')) &&
        (nm.includes('set_') || nm.includes('add_') || nm.includes('mutable_') ||
         nm.includes('clear_'))) {
        found.push(nm);
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    send(`[SETTER] ${nm} arg1=${args[1]}`);
                }
            });
        } catch(e) {}
    }
}

send(`[+] Hooked ${found.length} setter functions`);
if (found.length === 0) {
    // Show what functions exist for these messages
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes('notify_gain_prize')) {
            send(`  ${exp.name}`);
        }
    }
}
send(`[***] Go mine!`);
