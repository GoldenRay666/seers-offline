"""Frida hook — bypass pet selection crash in GLThread"""
import frida
import sys
import time

SCRIPT = """
'use strict';

var base = Module.findBaseAddress("libgame_logic.so");
if (!base) {
    console.log("[!] libgame_logic.so not loaded, waiting...");
    var interval = setInterval(function() {
        base = Module.findBaseAddress("libgame_logic.so");
        if (base) {
            clearInterval(interval);
            console.log("[+] libgame_logic.so at " + base);
            installHooks(base);
        }
    }, 200);
} else {
    console.log("[+] libgame_logic.so at " + base);
    installHooks(base);
}

function installHooks(base) {
    // Hook getChildrenByTag at 0x55fba0
    // SIGSEGV when this==NULL, stores to [R0] which is addr 0
    var getChildrenByTag = base.add(0x55fba0);
    Interceptor.attach(getChildrenByTag, {
        onEnter: function(args) {
            if (args[0].isNull()) {
                console.log("[!!!] getChildrenByTag called with NULL this!");
                console.log("  node=" + args[1] + " tag=" + args[2]);
                console.log("  Backtrace:");
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\\n'));
                this.skip = true;
                this.retval = ptr(0);
            }
        },
        onLeave: function(retval) {
            if (this.skip) {
                retval.replace(ptr(0));
                console.log("[FIX] getChildrenByTag bypassed, returning NULL");
            }
        }
    });
    console.log("[+] Hooked getChildrenByTag");

    // Hook CCActionManager::addAction at 0x477a921
    var addAction = base.add(0x477a921);
    Interceptor.attach(addAction, {
        onEnter: function(args) {
            if (args[0].isNull() || args[2].isNull()) {
                console.log("[!!!] addAction NULL args: this=" + args[0] + " action=" + args[1] + " node=" + args[2]);
                this.skip = true;
            }
        },
        onLeave: function(retval) {
            if (this.skip) {
                retval.replace(ptr(0));
                console.log("[FIX] addAction bypassed");
            }
        }
    });
    console.log("[+] Hooked addAction");

    // Hook select_main_mon handling
    var handleMsg = base.add(0x6329fc);
    Interceptor.attach(handleMsg, {
        onEnter: function(args) {
            var pkg = args[1];
            try {
                var cmdPtr = pkg.add(0x10).readPointer();
                if (!cmdPtr.isNull()) {
                    var cmd = cmdPtr.readCString();
                    if (cmd && (cmd.includes("select_main") || cmd.includes("get_pvp") || cmd.includes("get_unlock") || cmd.includes("mail_head"))) {
                        console.log("\\n[*] handleMessage: " + cmd);
                    }
                }
            } catch(e) {}
        }
    });

    // Also hook GameManager::startGame or scene transitions
    var startGame = Module.findExportByName("libgame_logic.so", "_ZN11GameManager9startGameEv");
    if (startGame) {
        Interceptor.attach(startGame, {
            onEnter: function(args) {
                console.log("\\n[*] GameManager::startGame called");
                console.log("  Backtrace:");
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\\n'));
            }
        });
        console.log("[+] Hooked GameManager::startGame");
    }

    console.log("[+] All hooks installed. Waiting for interaction...");
}
"""

try:
    device = frida.get_device("127.0.0.1:7555")
    print(f"[*] Connected to device: {device.name}")

    session = device.attach("com.taomee.seers")
    print(f"[*] Attached to com.taomee.seers")

    script = session.create_script(SCRIPT)
    script.on("message", lambda msg, data: print(f"[JS] {msg}"))
    script.load()
    print("[*] Script loaded. Game is running with hooks installed.")

    print("[*] Now tap 'Select Pet' in the game to trigger the flow.")
    print("[*] Press Ctrl+C to stop.")

    sys.stdin.read()
except KeyboardInterrupt:
    print("\n[*] Stopped.")
except Exception as e:
    print(f"[!] Error: {e}")
