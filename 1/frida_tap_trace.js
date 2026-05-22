// Trace all touch events to find what's blocking them
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Hook ccTouchBegan on ALL classes to see which ones are handling touches
let count = 0;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("ccTouchBegan") && exp.name.length < 120) {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    const short = exp.name.split("::").pop().replace("EPN7cocos2d7CCTouchEPNS0_7CCEventE","");
                    this.name = short;
                },
                onLeave(retval) {
                    if (retval.toInt32() !== 0) {
                        send(`[TOUCH] ${this.name} returned TRUE (swallowing touch!)`);
                    }
                }
            });
            count++;
        } catch(e) {}
    }
}
send(`[+] Hooked ${count} ccTouchBegan functions`);

// Also hook registerWithTouchDispatcher to see who registers
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("registerWithTouchDispatcher") && exp.name.length < 100) {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    send(`[REGISTER] ${exp.name.split("::")[1]}`);
                }
            });
        } catch(e) {}
    }
}

send('[***] Now tap the NPC');
