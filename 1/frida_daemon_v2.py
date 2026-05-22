import frida, time, sys

JS = """
var installed = false;
function tryInstall() {
    if (installed) return;
    var mod = Process.findModuleByName("libgame_logic.so");
    if (!mod) return;
    installed = true;
    var base = mod.base;
    send("[DAEMON] libgame_logic.so at " + base);

    // === CRASH PREVENTION (addresses confirmed from crash logs) ===
    Interceptor.attach(base.add(0x55fba0), {
        onEnter(a) { if(a[0].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send("[DAEMON] +getChildrenByTag guard");

    Interceptor.attach(base.add(0x477a921), {
        onEnter(a) { if(a[0].isNull()||a[2].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send("[DAEMON] +addAction guard");

    // === GUIDE BYPASS (addresses from IDA analysis 2026-05-22) ===
    // GuideLayer::showMaskLayer at 0x48da0e (28 bytes)
    Interceptor.attach(base.add(0x48da0e), {
        onEnter(a) {
            send("[GUIDE] showMaskLayer BLOCKED");
            this.context.pc = this.context.lr;
        }
    });
    send("[DAEMON] +showMaskLayer bypass (0x48da0e)");

    // GuideLayer::hideMaskLayer at 0x48d9f2 (28 bytes)
    Interceptor.attach(base.add(0x48d9f2), {
        onEnter(a) {
            send("[GUIDE] hideMaskLayer - allowing");
        }
    });
    send("[DAEMON] +hideMaskLayer monitor (0x48d9f2)");

    // GameGuideManager::beginGuide at 0x46e7d0
    Interceptor.attach(base.add(0x46e7d0), {
        onEnter(a) {
            send("[GUIDE] beginGuide BLOCKED");
            this.context.pc = this.context.lr;
        }
    });
    send("[DAEMON] +beginGuide bypass (0x46e7d0)");

    // GameOpenAssignFunctionManager::beginGuide at 0x477254
    Interceptor.attach(base.add(0x477254), {
        onEnter(a) {
            send("[GUIDE] GameOpenAssign beginGuide BLOCKED");
            this.context.pc = this.context.lr;
        }
    });
    send("[DAEMON] +GameOpenAssign beginGuide bypass (0x477254)");

    // GuideLayer::ccTouchBegan at 0x48d1e4 - hook to see touch events
    Interceptor.attach(base.add(0x48d1e4), {
        onEnter(a) {
            send("[GUIDE] ccTouchBegan - allowing touch");
            // Return true to allow touch, bypass guide restrictions
        },
        onLeave(r) {
            r.replace(ptr(1)); // force return true (touch handled)
        }
    });
    send("[DAEMON] +ccTouchBegan force-true (0x48d1e4)");

    // GameGuideManager::endGuide at 0x46e53c - try calling it
    send("[DAEMON] === ALL HOOKS ACTIVE ===");
    send("[DAEMON] Guide system bypassed. Mask blocked, touches free.");
}
setInterval(tryInstall, 500);
tryInstall();
"""

d = frida.get_usb_device()
s = d.attach(4680)
script = s.create_script(JS)
def on_msg(m, d):
    line = f"[{m['type']}] {m.get('payload', m.get('description', ''))}"
    with open('c:/javatools/1/daemon2_log.txt', 'a') as f:
        f.write(line + '\n')
    sys.stdout.write(line + '\n')
    sys.stdout.flush()
script.on('message', on_msg)
script.load()
print("[DAEMON2] Started. Waiting for libgame_logic.so...")
sys.stdout.flush()

while True:
    time.sleep(5)
