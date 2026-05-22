"""Spawn seers game with realm='emulated' so frida sees ARM libgame_logic.so via Houdini."""
import frida, sys, time

JS = """
'use strict';

function log(msg) { send(msg); }

let installed = false;
function tryInstall() {
    if (installed) return;
    const mod = Process.findModuleByName("libgame_logic.so");
    if (!mod) return;
    installed = true;
    const base = mod.base;
    log("[+] libgame_logic.so at " + base + " size=" + mod.size);

    // Hook GuideLayer::showMaskLayer (Thumb entry 0x48da0e)
    try {
        Interceptor.attach(base.add(0x48da0e), {
            onEnter(a) {
                log("[GUIDE] showMaskLayer blocked");
                this.context.pc = this.context.lr;
            }
        });
        log("[+] showMaskLayer hooked");
    } catch (e) { log("[-] showMaskLayer hook failed: " + e); }

    // GameGuideManager::beginGuide
    try {
        Interceptor.attach(base.add(0x46e7d0), {
            onEnter(a) {
                log("[GUIDE] GameGuideManager.beginGuide blocked");
                this.context.pc = this.context.lr;
            }
        });
        log("[+] GameGuideManager.beginGuide hooked");
    } catch (e) { log("[-] beginGuide hook failed: " + e); }

    // GameOpenAssignFunctionManager::beginGuide
    try {
        Interceptor.attach(base.add(0x477254), {
            onEnter(a) {
                log("[GUIDE] GameOpenAssign.beginGuide blocked");
                this.context.pc = this.context.lr;
            }
        });
        log("[+] GameOpenAssign.beginGuide hooked");
    } catch (e) { log("[-] GameOpenAssign hook failed: " + e); }

    // ccTouchBegan force return true
    try {
        Interceptor.attach(base.add(0x48d1e4), {
            onLeave(r) { r.replace(ptr(1)); }
        });
        log("[+] ccTouchBegan force-true hooked");
    } catch (e) { log("[-] ccTouchBegan hook failed: " + e); }

    log("[***] ALL HOOKS ACTIVE");
}

setInterval(tryInstall, 500);
tryInstall();

// Diagnostic: enumerate modules every 5s for first 30s
let pollCount = 0;
const moduleListInterval = setInterval(function() {
    pollCount++;
    const mods = Process.enumerateModules();
    log("[modules pass " + pollCount + "] count=" + mods.length);
    for (const m of mods) {
        if (m.name.includes("game_logic") || m.name.includes("houdini") || m.name.includes("cocos")) {
            log("  - " + m.name + " @ " + m.base + " size=" + m.size);
        }
    }
    if (pollCount >= 6 || installed) clearInterval(moduleListInterval);
}, 5000);
"""

def on_message(message, data):
    if message['type'] == 'send':
        print(f"[JS] {message['payload']}", flush=True)
    elif message['type'] == 'error':
        print(f"[JS-ERR] {message.get('description','')} at {message.get('fileName','')}:{message.get('lineNumber','')}", flush=True)
        print(f"        stack: {message.get('stack','')}", flush=True)

dev = frida.get_usb_device()
print(f"[*] device: {dev.name}", flush=True)

pid = dev.spawn(["com.taomee.seers"])
print(f"[+] Spawned PID: {pid}", flush=True)

# Attach with realm='emulated' to see ARM-via-Houdini modules
try:
    sess = dev.attach(pid, realm='emulated')
    print(f"[+] Attached PID {pid} realm=emulated", flush=True)
except Exception as e:
    print(f"[-] emulated realm failed: {e}; falling back to native", flush=True)
    sess = dev.attach(pid)

script = sess.create_script(JS)
script.on('message', on_message)
script.load()
print("[+] Script loaded", flush=True)

dev.resume(pid)
print(f"[+] Resumed PID {pid}", flush=True)

try:
    while True:
        time.sleep(2)
        sys.stdout.flush()
except KeyboardInterrupt:
    print("[*] interrupt — detaching", flush=True)
    sess.detach()
