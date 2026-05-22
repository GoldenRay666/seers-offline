#!/usr/bin/env python3
"""Spawn seers game with frida crash-prevention + guide-bypass hooks."""
import frida, sys, time

JS_CODE = """
'use strict';

var MODULE = "libgame_logic.so";

// Wait for library, then install hooks
var attempts = 0;
var timer = setInterval(function() {
    var base = Module.findBaseAddress(MODULE);
    attempts++;
    if (base) {
        clearInterval(timer);
        installHooks(base);
    }
    if (attempts > 600) {
        clearInterval(timer);
        console.log("[-] Timeout waiting for " + MODULE);
    }
}, 1000);

function installHooks(base) {
    console.log("[+] " + MODULE + " at " + base);

    // === CRASH PREVENTION ===

    // getChildrenByTag at 0x55fba0 - NULL this check
    Interceptor.attach(base.add(0x55fba0), {
        onEnter: function(args) {
            if (args[0].isNull()) {
                console.log("[CRASH-FIX] getChildrenByTag NULL -> skip");
                this.skip = true;
            }
        },
        onLeave: function(retval) {
            if (this.skip) retval.replace(ptr(0));
        }
    });
    console.log("[+] getChildrenByTag guard");

    // CCActionManager::addAction at 0x477a921 - NULL node check
    Interceptor.attach(base.add(0x477a921), {
        onEnter: function(args) {
            if (args[0].isNull() || args[2].isNull()) {
                console.log("[CRASH-FIX] addAction NULL -> skip");
                this.skip = true;
            }
        },
        onLeave: function(retval) {
            if (this.skip) retval.replace(ptr(0));
        }
    });
    console.log("[+] addAction guard");

    // === GUIDE BYPASS ===

    // showMaskLayer at 0x597784 - make it no-op
    Interceptor.attach(base.add(0x597784), {
        onEnter: function(args) {
            console.log("[GUIDE] showMaskLayer blocked");
            this.context.pc = this.context.lr;
        }
    });
    console.log("[+] showMaskLayer bypass");

    // beginGuide at 0x5818d4 - make it no-op
    Interceptor.attach(base.add(0x5818d4), {
        onEnter: function(args) {
            console.log("[GUIDE] beginGuide blocked");
            this.context.pc = this.context.lr;
        }
    });
    console.log("[+] beginGuide bypass");

    console.log("[*] ALL HOOKS ACTIVE - crash prevention + guide bypass");
}
"""

def main():
    device = frida.get_usb_device()
    print(f"[+] USB device: {device}")

    pid = device.spawn(["com.taomee.seers"])
    print(f"[+] Spawned PID: {pid}")

    session = device.attach(pid)
    print(f"[+] Attached")

    script = session.create_script(JS_CODE)
    def on_msg(msg, data):
        if msg['type'] == 'send':
            print(f"[JS] {msg['payload']}")
        elif msg['type'] == 'error':
            print(f"[JS ERROR] {msg.get('description', msg)}")
    script.on('message', on_msg)
    script.load()
    print("[+] Script loaded")

    device.resume(pid)
    print("[+] Resumed. Game is running with hooks active.")
    print("[*] Waiting... Ctrl+C to stop")

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n[*] Stopping...")
        script.unload()
        session.detach()
        print("[*] Done")

if __name__ == '__main__':
    main()
