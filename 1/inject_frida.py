#!/usr/bin/env python3
"""
Inject Frida hooks into running seers game process.
Applies crash prevention + guide bypass.
"""
import sys, os, time

sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'frida_lib'))
import frida

SCRIPT = """
'use strict';

var MODULE = "libgame_logic.so";
var base = null;

function waitForLib(callback) {
    base = Module.findBaseAddress(MODULE);
    if (base) {
        callback();
        return;
    }
    console.log("[*] Waiting for " + MODULE + " to load...");
    var attempts = 0;
    var timer = setInterval(function() {
        base = Module.findBaseAddress(MODULE);
        attempts++;
        if (base) {
            clearInterval(timer);
            console.log("[+] " + MODULE + " loaded at " + base + " after " + attempts + " attempts");
            callback();
        }
        if (attempts > 300) {
            clearInterval(timer);
            console.log("[-] Timeout waiting for " + MODULE);
        }
    }, 1000);
}

function installHooks() {
    console.log("[*] Installing hooks at base=" + base);

    // === CRASH PREVENTION ===

    // Hook getChildrenByTag at 0x55fba0 - prevent NULL this crash
    try {
        Interceptor.attach(base.add(0x55fba0), {
            onEnter: function(args) {
                if (args[0].isNull()) {
                    console.log("[CRASH-PREVENT] getChildrenByTag NULL this -> skipping");
                    this.skip = true;
                }
            },
            onLeave: function(retval) {
                if (this.skip) retval.replace(ptr(0));
            }
        });
        console.log("[+] Hooked getChildrenByTag");
    } catch(e) { console.log("[-] getChildrenByTag: " + e); }

    // Hook CCActionManager::addAction at 0x477a921 - prevent NULL node crash
    try {
        Interceptor.attach(base.add(0x477a921), {
            onEnter: function(args) {
                if (args[0].isNull() || args[2].isNull()) {
                    console.log("[CRASH-PREVENT] addAction NULL -> skipping");
                    this.skip = true;
                }
            },
            onLeave: function(retval) {
                if (this.skip) retval.replace(ptr(0));
            }
        });
        console.log("[+] Hooked addAction");
    } catch(e) { console.log("[-] addAction: " + e); }

    // === GUIDE BYPASS ===

    // Hook showMaskLayer at 0x597784
    try {
        Interceptor.attach(base.add(0x597784), {
            onEnter: function(args) {
                console.log("[GUIDE-BYPASS] showMaskLayer -> block");
                this.context.pc = this.context.lr;
            }
        });
        console.log("[+] Hooked showMaskLayer");
    } catch(e) { console.log("[-] showMaskLayer: " + e); }

    // Hook beginGuide at 0x5818d4
    try {
        Interceptor.attach(base.add(0x5818d4), {
            onEnter: function(args) {
                console.log("[GUIDE-BYPASS] beginGuide -> block");
                this.context.pc = this.context.lr;
            }
        });
        console.log("[+] Hooked beginGuide");
    } catch(e) { console.log("[-] beginGuide: " + e); }

    // Hook CCLayerColor::setOpacity - force mask opacity to 0
    try {
        var setOpacity = Module.findExportByName(MODULE,
            "_ZN7cocos2d12CCLayerColor10setOpacityEa");
        if (setOpacity) {
            Interceptor.attach(setOpacity, {
                onEnter: function(args) {
                    var opacity = args[1].toInt32();
                    if (opacity > 50 && opacity < 200) {
                        console.log("[GUIDE-BYPASS] Overriding opacity " + opacity + " -> 0");
                        args[1] = ptr(0);
                    }
                }
            });
            console.log("[+] Hooked CCLayerColor::setOpacity");
        }
    } catch(e) { console.log("[-] setOpacity: " + e); }

    console.log("[*] All hooks installed. Game should be crash-free + guide bypassed!");
}

waitForLib(installHooks);
"""

def main():
    device_manager = frida.get_device_manager()
    device = None

    print("[*] Looking for device...")
    for d in device_manager.enumerate_devices():
        print(f"    {d.id} - {d.name} ({d.type})")

    # Try to find the MuMu USB device
    for d in device_manager.enumerate_devices():
        if '7555' in d.id or 'MuMu' in d.name:
            device = d
            print(f"[+] Using device: {d.id} - {d.name}")
            break

    if not device:
        # Fall back to remote
        try:
            device = device_manager.add_remote_device("127.0.0.1:27042")
            print(f"[+] Connected to remote device")
        except Exception as e:
            print(f"[-] Remote failed: {e}")
            return 1

    # Attach by PID (frida lists it)
    try:
        # Try to attach by name first
        session = device.attach("com.taomee.seers")
        print(f"[+] Attached to com.taomee.seers")
    except Exception as e:
        print(f"[-] Attach by name failed: {e}")
        try:
            session = device.attach(4303)
            print(f"[+] Attached to PID 4303")
        except Exception as e2:
            print(f"[-] Attach by PID failed: {e2}")
            # List processes to find PID
            for proc in device.enumerate_processes():
                if 'taomee' in proc.name.lower() or 'seer' in proc.name.lower():
                    print(f"    Process: {proc.name} PID={proc.pid}")
            return 1

    script = session.create_script(SCRIPT)

    def on_message(message, data):
        if message['type'] == 'send':
            print(f"[Script] {message['payload']}")
        elif message['type'] == 'error':
            print(f"[Script Error] {message.get('description', message)}")

    script.on('message', on_message)
    script.load()
    print("[+] Script loaded. Hooks are active.")
    # Write success marker
    with open('/c/javatools/1/frida_status.txt', 'w') as f:
        f.write('Hooks active\n')
    print("[*] Hooks installed. Frida is running in the background.")
    print("[*] Keep this script running to maintain hooks.")
    print("[*] Press Ctrl+C to detach (hooks will be removed)")

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n[*] Detaching...")
        script.unload()
        session.detach()
        print("[*] Done")

if __name__ == '__main__':
    main()
