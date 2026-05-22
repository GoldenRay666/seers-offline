// Bare minimum: no hooks, just confirm Frida works
'use strict';

const MODULE = "libgame_logic.so";
const mod = Process.findModuleByName(MODULE);
if (mod) {
    send(`[+] ${MODULE} at ${mod.base}, size=${mod.size}`);
    send(`[+] Exports count: ${mod.enumerateExports().length}`);
    send(`[+] Frida is working. Module loaded successfully.`);
} else {
    send(`[-] Module ${MODULE} not found yet, will retry...`);
}
