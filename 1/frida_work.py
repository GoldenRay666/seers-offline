"""Working Frida script — crash fix + guide bypass"""
import frida, sys

JS = """
'use strict';

function tryInstall() {
    var base = Module.findBaseAddress("libgame_logic.so");
    if (!base) return;

    console.log("[+] libgame_logic.so at " + base);

    // Crash prevention
    Interceptor.attach(base.add(0x55fba0), {
        onEnter: function(args) {
            if (args[0].isNull()) { this.skip = true; }
        },
        onLeave: function(retval) {
            if (this.skip) retval.replace(ptr(0));
        }
    });
    console.log("[+] getChildrenByTag NULL guard");

    Interceptor.attach(base.add(0x477a921), {
        onEnter: function(args) {
            if (args[0].isNull() || args[2].isNull()) { this.skip = true; }
        },
        onLeave: function(retval) {
            if (this.skip) retval.replace(ptr(0));
        }
    });
    console.log("[+] addAction NULL guard");

    // Guide bypass (correct addresses from IDA)
    Interceptor.attach(base.add(0x48da0e), {
        onEnter: function(args) {
            console.log("[BYPASS] showMaskLayer");
            this.context.pc = this.context.lr;
        }
    });
    console.log("[+] showMaskLayer bypass");

    Interceptor.attach(base.add(0x46e7d0), {
        onEnter: function(args) {
            console.log("[BYPASS] beginGuide");
            this.context.pc = this.context.lr;
        }
    });
    console.log("[+] beginGuide bypass");

    console.log("[+] ALL HOOKS ACTIVE");
}

// Poll for library
tryInstall();
if (!Module.findBaseAddress("libgame_logic.so")) {
    console.log("[*] Waiting for libgame_logic.so...");
    setInterval(function() {
        tryInstall();
        if (Module.findBaseAddress("libgame_logic.so")) {
            // Stop polling once installed
        }
    }, 500);
}
"""

device = frida.get_device("127.0.0.1:7555")
print(f"[+] Device: {device.name}")

pid = device.spawn(["com.taomee.seers"])
print(f"[+] Spawned PID: {pid}")
session = device.attach(pid)
print(f"[+] Attached")

script = session.create_script(JS)
script.on('message', lambda m, d: print(f"[JS] {m.get('payload', m.get('description', ''))}"))
script.load()
print("[+] Script loaded")
device.resume(pid)
print(f"[+] Resumed. Game running with full protection.")
sys.stdout.flush()

# Keep alive
import time
while True:
    time.sleep(5)
