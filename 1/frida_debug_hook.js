// Debug: test Interceptor.attach with raw address vs export address
'use strict';

const MODULE = "libgame_logic.so";

const mod = Process.findModuleByName(MODULE);
const base = mod.base;
send(`[+] Module at ${base}`);

// Test 1: use Module.findExportByName
const symName = "_ZN16GameGuideManager9isInGuideEv";
const addr = Module.findExportByName(MODULE, symName);
send(`[+] findExportByName("${symName}") = ${addr}`);

if (addr) {
    send(`[+] addr type: ${typeof addr}, isNull: ${addr.isNull()}`);

    // Test 2: try Interceptor.attach with export address
    try {
        Interceptor.attach(addr, {
            onEnter(args) {
                send(`[GUIDE] isInGuide called!`);
            }
        });
        send(`[+] Hook SUCCESS with export address`);
    } catch(e) {
        send(`[-] Hook FAILED with export address: ${e.message}`);
    }
}

// Test 3: try with raw base+offset (Thumb bit set)
const rawAddr = base.add(0x46e557);
send(`[+] rawAddr = base+0x46e557 = ${rawAddr}`);
send(`[+] rawAddr equals export addr? ${rawAddr.equals(addr)}`);

// Test 4: try hooking a known simple function
// Let's try a different approach - use base.add with the correct offset
if (!rawAddr.equals(addr)) {
    try {
        Interceptor.attach(rawAddr, {
            onEnter(args) {
                send(`[GUIDE] isInGuide (raw addr) called!`);
            }
        });
        send(`[+] Hook SUCCESS with raw address`);
    } catch(e) {
        send(`[-] Hook FAILED with raw address: ${e.message}`);
    }
}

send(`[***] Debug complete`);
