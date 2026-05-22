"""Spawn seers game with crash prevention + guide bypass (correct addresses from IDA)."""
import frida, time, sys

JS = """
// Crash prevention + Guide bypass hooks
// Will install as soon as libgame_logic.so loads
var installed = false;
function tryInstall() {
    if (installed) return;
    var mod = Process.findModuleByName("libgame_logic.so");
    if (!mod) return;
    installed = true;
    var base = mod.base;
    send("[+] libgame_logic.so at " + base);

    // === CRASH PREVENTION ===
    Interceptor.attach(base.add(0x55fba0), {
        onEnter(a) { if(a[0].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send("[+] getChildrenByTag NULL guard");

    Interceptor.attach(base.add(0x477a921), {
        onEnter(a) { if(a[0].isNull()||a[2].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send("[+] addAction NULL guard");

    // === GUIDE BYPASS (verified from IDA 2026-05-22) ===
    Interceptor.attach(base.add(0x48da0e), {
        onEnter(a) { send("[GUIDE] showMaskLayer blocked"); this.context.pc=this.context.lr; }
    });
    send("[+] showMaskLayer bypass");

    Interceptor.attach(base.add(0x46e7d0), {
        onEnter(a) { send("[GUIDE] beginGuide blocked"); this.context.pc=this.context.lr; }
    });
    send("[+] GameGuideManager::beginGuide bypass");

    Interceptor.attach(base.add(0x477254), {
        onEnter(a) { send("[GUIDE] GameOpenAssign::beginGuide blocked"); this.context.pc=this.context.lr; }
    });
    send("[+] GameOpenAssignFunctionManager::beginGuide bypass");

    Interceptor.attach(base.add(0x48d1e4), {
        onEnter(a) { send("[GUIDE] ccTouchBegan touch"); },
        onLeave(r) { r.replace(ptr(1)); }
    });
    send("[+] ccTouchBegan force return true");

    send("[***] ALL HOOKS ACTIVE - crash prevention + guide bypass");
}
setInterval(tryInstall, 500);
tryInstall();
"""

d = frida.get_usb_device()
pid = d.spawn(["com.taomee.seers"])
print(f"[+] Spawned PID: {pid}")
s = d.attach(pid)
print(f"[+] Attached to PID {pid}")
script = s.create_script(JS)
script.on('message', lambda m, d: print(f"[JS] {m.get('payload', m.get('description', ''))}") if m['type']=='send' else print(f"[JS ERR] {m.get('description', m)}"))
script.load()
print("[+] Script loaded")
d.resume(pid)
print(f"[+] Resumed PID {pid}")
print("[*] Game started with full protection. Waiting...")
sys.stdout.flush()

# Stay alive
while True:
    time.sleep(5)
