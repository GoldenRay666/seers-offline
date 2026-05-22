// Step-by-step: hook one function at a time to find crash culprit
'use strict';

const MODULE = "libgame_logic.so";
const mod = Process.findModuleByName(MODULE);
const BASE = mod.base;
send(`[+] ${MODULE} at ${BASE}`);

// Test 1: isInGuide - just returns bool, very safe
const TEST_ADDR = 0x46e556;
const fnAddr = BASE.add(TEST_ADDR);
send(`[+] Attempting hook at base+0x${TEST_ADDR.toString(16)} = ${fnAddr}`);

Interceptor.attach(fnAddr, {
    onEnter(args) {
        send(`[HOOK] isInGuide called`);
    },
    onLeave(retval) {
        send(`[HOOK] isInGuide returned: ${retval}`);
    }
});
send(`[+] Hook installed successfully!`);
send(`[***] Waiting for guide events...`);
