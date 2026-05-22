// Check what UI layers are active when backpack opens
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Hook EventSwallowLayer init to see if it's created for backpack
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN17EventSwallowLayer4initEi") {
        Interceptor.attach(exp.address, {
            onEnter(args) {
                send(`[EVENT-SWALLOW] init called! this=${args[0]} priority=${args[1]}`);
                // Capture stack trace to see who created it
                send(`  backtrace: ${Thread.backtrace(this.context, Backtracer.ACCURATE).map(DebugSymbol.fromAddress).join(' → ')}`);
            }
        });
        send(`[+] EventSwallowLayer::init hooked`);
    }
    // Also hook ItemBagLayer
    if (exp.name.includes("ItemBagLayer") && exp.name.includes("init")) {
        Interceptor.attach(exp.address, {
            onEnter(args) {
                send(`[BAG] ItemBagLayer::init called`);
            }
        });
        send(`[+] ItemBagLayer::init hooked`);
    }
}

send('[***] Open the backpack now');
