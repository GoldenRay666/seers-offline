// Frida script: hook GuideLayer::ccTouchBegan on ARM to debug touch routing
'use strict';

const MODULE = "libgame_logic.so";

function tryInstall() {
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;
    const base = mod.base;
    send(`[+] ${MODULE} at ${base}`);

    // GuideLayer::ccTouchBegan @ 0x48d1e4 — return false (pass through)
    try {
        Interceptor.attach(base.add(0x48d1e4), {
            onEnter(args) {
                // args[0]=this, args[1]=CCTouch*, args[2]=CCEvent*
                send(`[TOUCH] GuideLayer::ccTouchBegan called`);
            },
            onLeave(retval) {
                // Force return false to pass touch through
                send(`[TOUCH] GuideLayer::ccTouchBegan was returning ${retval}, forcing false`);
                retval.replace(ptr(0));
            }
        });
        send("[+] GuideLayer::ccTouchBegan hooked → pass through");
    } catch(e) {
        send(`[-] ccTouchBegan hook failed: ${e}`);
    }

    // Also hook NPCTalkLayer::ccTouchBegan to see if touches reach it
    try {
        Interceptor.attach(base.add(0x4e9110), {
            onEnter(args) {
                send(`[NPC] NPCTalkLayer::ccTouchBegan called!`);
            },
            onLeave(retval) {
                send(`[NPC] NPCTalkLayer::ccTouchBegan returned ${retval}`);
                retval.replace(ptr(1)); // force return true (touch consumed)
            }
        });
        send("[+] NPCTalkLayer::ccTouchBegan hooked");
    } catch(e) {
        send(`[-] NPCTalkLayer hook failed: ${e}`);
    }

    send("[***] All hooks active. Touch Eva dialog and watch for [NPC] messages.");
}

setInterval(tryInstall, 500);
tryInstall();
