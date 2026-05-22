"""
Frida hook script — bypass server selection crash in 赛尔号战神联盟.
Connects to frida-server on device and hooks native functions.
"""
import frida
import sys
import time

SCRIPT = """
'use strict';

// Wait for libgame_logic.so to load
function hookAll() {
    const mod = Process.findModuleByName("libgame_logic.so");
    if (!mod) return false;
    console.log("[+] libgame_logic.so at " + mod.base);

    // ── Hook 1: Bypass SelectServerLayer::onServerSelected crash ──
    // Game crashes here because JSON login_ip (string) vs proto login_ip (uint32) mismatch
    const onServerSelected = Module.findExportByName(
        "libgame_logic.so",
        "_ZN17SelectServerLayer16onServerSelectedEPN7cocos2d8CCObjectE"
    );
    if (onServerSelected) {
        Interceptor.attach(onServerSelected, {
            onEnter(args) {
                console.log("[*] onServerSelected — bypassing original logic");
                // Don't let the original function run — it crashes
                // Instead, manually trigger the connect flow
                this.skip = true;
            },
            onLeave(retval) {
                if (this.skip) {
                    // Call connect2Server directly from here (via RPC)
                    send({ type: "doConnect" });
                    retval.replace(ptr(1)); // Indicate success
                }
            }
        });
        console.log("[+] Hooked SelectServerLayer::onServerSelected");
    } else {
        console.log("[-] onServerSelected NOT found — trying mangled variants");
        Module.enumerateExports("libgame_logic.so").forEach(function(exp) {
            if (exp.name.includes("onServerSelected") || exp.name.includes("SelectServer")) {
                console.log("    found: " + exp.name + " at " + exp.address);
            }
        });
    }

    // ── Hook 2: connect2Server — redirect to local server ──
    const connect2Server = Module.findExportByName(
        "libgame_logic.so",
        "_ZN11NetWorkUtil14connect2ServerEPKcifi"
    );
    if (connect2Server) {
        Interceptor.attach(connect2Server, {
            onEnter(args) {
                const host = Memory.readCString(args[0]);
                const port = args[1].toInt32();
                console.log("[*] connect2Server(" + host + ", " + port + ") → redirect to 127.0.0.1:8002");
                args[0] = Memory.allocUtf8String("127.0.0.1");
                args[1] = ptr(8002);
            }
        });
        console.log("[+] Hooked connect2Server");
    }

    // ── Hook 3: LoginManager::startConnectServer ──
    const startConnectServer = Module.findExportByName(
        "libgame_logic.so",
        "_ZN12LoginManager18startConnectServerEv"
    );
    if (startConnectServer) {
        Interceptor.attach(startConnectServer, {
            onEnter(args) {
                console.log("[*] LoginManager::startConnectServer called");
            }
        });
    }

    // ── Hook 4: dispatchMessage — log all received messages ──
    const dispatchMessage = Module.findExportByName(
        "libgame_logic.so",
        "_ZN11NetWorkUtil15dispatchMessageEPciS0_ii"
    );
    if (dispatchMessage) {
        Interceptor.attach(dispatchMessage, {
            onEnter(args) {
                const cmd = Memory.readCString(args[2]);
                console.log("[*] dispatchMessage: " + cmd);
            }
        });
    }

    // ── Hook 5: sendMessage — log all sent messages ──
    const sendMessage = Module.findExportByName(
        "libgame_logic.so",
        "_ZN11NetWorkUtil11sendMessageEPN14ISeer20CSProto13cs_msg_head_tEPN6google8protobuf7MessageEfi"
    );
    if (sendMessage) {
        Interceptor.attach(sendMessage, {
            onEnter(args) {
                // Read the cs_msg_head_t to get the CMD
                try {
                    // cs_msg_head_t: field 1 = cmd (string), field 2 = seq (varint), ...
                    const hdrPtr = args[0];
                    // Try reading the cmd from proto
                    const cmdTag = hdrPtr.readU8();
                    if (cmdTag === 0x0a) {
                        const cmdLen = hdrPtr.add(1).readU8();
                        const cmd = hdrPtr.add(2).readCString(cmdLen);
                        console.log("[*] sendMessage: " + cmd);
                    }
                } catch(e) {
                    console.log("[*] sendMessage (parse error: " + e + ")");
                }
            }
        });
    }

    // ── Catch the crash ──
    const parseJsonStr = Module.findExportByName(
        "libgame_logic.so",
        "_Z12parseJsonStrPKcRN4Json5ValueE"
    );
    if (parseJsonStr) {
        Interceptor.attach(parseJsonStr, {
            onEnter(args) {
                const json = Memory.readCString(args[0]);
                if (json && json.length < 500) {
                    console.log("[*] parseJsonStr: " + json);
                }
            }
        });
    }

    console.log("[+] All hooks installed. Waiting for user interaction...");
    return true;
}

const interval = setInterval(function() {
    if (hookAll()) clearInterval(interval);
}, 500);

// Handle messages from hooks
recv(function(msg) {
    if (msg.type === "doConnect") {
        console.log("[!] Should connect to server now");
    }
});
"""

def on_message(msg, data):
    if msg['type'] == 'send':
        print(f"[HOOK] {msg['payload']}")
    elif msg['type'] == 'error':
        print(f"[ERROR] {msg}")

def main():
    # Connect to frida-server on device
    device = frida.get_device_manager().add_remote_device("127.0.0.1:27042")
    print(f"[*] Connected to device: {device}")

    # Wait for the game to launch, then attach
    print("[*] Waiting for com.taomee.seers to start...")
    while True:
        try:
            processes = device.enumerate_processes()
            for p in processes:
                if p.name == "com.taomee.seers":
                    print(f"[+] Found process: {p.name} (PID: {p.pid})")
                    session = device.attach(p.pid)
                    script = session.create_script(SCRIPT)
                    script.on('message', on_message)
                    script.load()
                    print("[+] Script loaded. Game is now hooked!")
                    print("[*] Press Ctrl+C to stop...")
                    sys.stdin.read()
                    return
            time.sleep(1)
        except KeyboardInterrupt:
            return
        except Exception as e:
            print(f"[-] Error: {e}")
            time.sleep(1)

if __name__ == "__main__":
    main()
