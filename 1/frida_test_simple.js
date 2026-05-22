// Minimal test: hook one safe function
'use strict';

const MODULE = "libgame_logic.so";

function tryInstall() {
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;
    const base = mod.base;
    send(`[+] ${MODULE} at ${base}`);
    send(`[+] module size: ${mod.size}`);

    // Test: hook isInGuide (should be safe, just returns bool)
    try {
        Interceptor.attach(base.add(0x46e556), {
            onEnter(args) {
                send(`[GUIDE-CALL] isInGuide`);
            },
            onLeave(retval) {
                send(`[GUIDE-RET] isInGuide = ${retval}`);
            }
        });
        send(`[+] Hooked isInGuide successfully`);
    } catch(e) {
        send(`[-] isInGuide hook failed: ${e}`);
    }

    // Test: hook processGuide
    try {
        Interceptor.attach(base.add(0x46e700), {
            onEnter(args) {
                send(`[GUIDE-CALL] processGuide`);
            }
        });
        send(`[+] Hooked processGuide successfully`);
    } catch(e) {
        send(`[-] processGuide hook failed: ${e}`);
    }

    send(`[***] TEST HOOKS ACTIVE. Now interact with the game...`);
}

setInterval(tryInstall, 1000);
tryInstall();
