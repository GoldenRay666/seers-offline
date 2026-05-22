"""Frida hook runner — outputs to file"""
import frida
import sys
import time
from datetime import datetime

def log(msg):
    ts = datetime.now().strftime("%H:%M:%S")
    line = f"[{ts}] {msg}"
    print(line)
    sys.stdout.flush()
    with open("C:/Users/23287/AppData/Local/Temp/frida_log.txt", "a") as f:
        f.write(line + "\n")

SCRIPT = """
'use strict';

function installHooks(base) {
    // Hook getChildrenByTag at 0x55fba0
    var getChildrenByTag = base.add(0x55fba0);
    Interceptor.attach(getChildrenByTag, {
        onEnter: function(args) {
            if (args[0].isNull()) {
                send({type: "crash", func: "getChildrenByTag", this_: String(args[0]),
                      node: String(args[1]), tag: String(args[2])});
                this.skip = true;
                this.retval = ptr(0);
            }
        },
        onLeave: function(retval) {
            if (this.skip) retval.replace(ptr(0));
        }
    });
    send({type: "hook", func: "getChildrenByTag", addr: String(getChildrenByTag)});

    // Hook CCActionManager::addAction at approx 0x477a921
    var addAction = base.add(0x477a921);
    Interceptor.attach(addAction, {
        onEnter: function(args) {
            if (args[0].isNull() || args[2].isNull()) {
                send({type: "crash", func: "addAction", this_: String(args[0]),
                      action: String(args[1]), node: String(args[2])});
                this.skip = true;
            }
        },
        onLeave: function(retval) {
            if (this.skip) retval.replace(ptr(0));
        }
    });
    send({type: "hook", func: "addAction", addr: String(addAction)});

    send({type: "ready"});
}

var base = Module.findBaseAddress("libgame_logic.so");
if (base) {
    send({type: "info", msg: "libgame_logic.so at " + base});
    installHooks(base);
} else {
    send({type: "info", msg: "Waiting for libgame_logic.so..."});
    var interval = setInterval(function() {
        base = Module.findBaseAddress("libgame_logic.so");
        if (base) {
            clearInterval(interval);
            send({type: "info", msg: "libgame_logic.so loaded at " + base});
            installHooks(base);
        }
    }, 500);
}
"""

try:
    # Try multiple connection methods
    try:
        device = frida.get_usb_device()
        log("Connected via USB")
    except:
        try:
            device = frida.get_device_manager().add_remote_device("127.0.0.1:7555")
            log("Connected via remote device")
        except:
            device = frida.get_device("127.0.0.1:7555")
            log("Connected via device name")
    log(f"Connected to device: {device.name}")

    # Try to find the process by name, fall back to spawning
    try:
        session = device.attach("com.taomee.seers")
    except:
        # Try to find the PID and attach
        log("Trying to find game process...")
        processes = device.enumerate_processes()
        for p in processes:
            if "seers" in p.name.lower() or "taomee" in p.name.lower():
                log(f"Found: {p.name} (PID: {p.pid})")
                session = device.attach(p.pid)
                break
        else:
            # Spawn the app
            log("Spawning new process...")
            pid = device.spawn(["com.taomee.seers"])
            session = device.attach(pid)
            device.resume(pid)
    log(f"Attached to session")

    def on_msg(msg, data):
        if msg["type"] == "send":
            payload = msg.get("payload", msg)
            if isinstance(payload, dict) and payload.get("type") == "crash":
                log(f"[CRASH BYPASS] {payload['func']}: this={payload['this_']} node={payload.get('node','?')} tag={payload.get('tag','?')}")
            elif isinstance(payload, dict) and payload.get("type") == "hook":
                log(f"[HOOK] {payload['func']} at {payload['addr']}")
            elif isinstance(payload, dict) and payload.get("type") == "ready":
                log("[READY] All hooks installed, waiting for pet selection...")
            else:
                log(f"[JS] {payload}")

    script = session.create_script(SCRIPT)
    script.on("message", on_msg)
    script.load()
    log("Script loaded successfully")

    log("Now interact with the game. Press Ctrl+C to stop.")
    while True:
        time.sleep(1)

except KeyboardInterrupt:
    log("Stopped by user")
except Exception as e:
    log(f"Error: {e}")
