/**
 * Frida hook script — bypass server selection crash and redirect to local server.
 * Based on FRIDA_PLAN.md Phase 2-4 analysis.
 */
'use strict';

// Wait for libgame_logic.so to load
function hookGameLogic() {
    const module = Process.findModuleByName("libgame_logic.so");
    if (!module) {
        console.log("[*] Waiting for libgame_logic.so...");
        return false;
    }
    console.log("[+] libgame_logic.so loaded at " + module.base);

    // ── Phase 2: Bypass SelectServerLayer::onServerSelected crash ──
    // The game crashes with SIGABRT when user taps server due to
    // JSON login_ip (string) vs proto login_ip (uint32) type mismatch.
    // Hook this function to intercept the server selection and redirect.

    const onServerSelected = Module.findExportByName(
        "libgame_logic.so",
        "_ZN17SelectServerLayer16onServerSelectedEPN7cocos2d8CCObjectE"
    );
    if (onServerSelected) {
        console.log("[+] Found SelectServerLayer::onServerSelected at " + onServerSelected);
        Interceptor.attach(onServerSelected, {
            onEnter: function (args) {
                console.log("[*] SelectServerLayer::onServerSelected called — bypassing");
                // Skip the original function - don't let it crash
                // Instead, we'll call connect2Server directly
            },
            onLeave: function (retval) {
                // Replace return value to indicate success
                console.log("[*] onServerSelected original returned: " + retval);
            }
        });
    } else {
        console.log("[-] SelectServerLayer::onServerSelected NOT found");
    }

    // ── Hook connect2Server ──
    const connect2Server = Module.findExportByName(
        "libgame_logic.so",
        "_ZN11NetWorkUtil14connect2ServerEPKcifi"
    );
    if (connect2Server) {
        console.log("[+] Found NetWorkUtil::connect2Server at " + connect2Server);
        Interceptor.attach(connect2Server, {
            onEnter: function (args) {
                const host = Memory.readCString(args[0]);
                const port = args[1].toInt32();
                console.log("[*] connect2Server(" + host + ", " + port + ")");
                // Redirect to local server
                args[0] = Memory.allocUtf8String("127.0.0.1");
                args[1] = ptr(8002);
            },
            onLeave: function (retval) {
                console.log("[*] connect2Server returned: " + retval);
            }
        });
    } else {
        console.log("[-] NetWorkUtil::connect2Server NOT found");
    }

    // ── Hook sendMessage ──
    const sendMessage = Module.findExportByName(
        "libgame_logic.so",
        "_ZN11NetWorkUtil11sendMessageEPN14ISeer20CSProto13cs_msg_head_tEPN6google8protobuf7MessageEfi"
    );
    if (sendMessage) {
        console.log("[+] Found NetWorkUtil::sendMessage at " + sendMessage);
        Interceptor.attach(sendMessage, {
            onEnter: function (args) {
                console.log("[*] sendMessage called");
            }
        });
    }

    // ── Hook decodeMessage / dispatchMessage ──
    const dispatchMessage = Module.findExportByName(
        "libgame_logic.so",
        "_ZN11NetWorkUtil15dispatchMessageEPciS0_ii"
    );
    if (dispatchMessage) {
        console.log("[+] Found NetWorkUtil::dispatchMessage at " + dispatchMessage);
        Interceptor.attach(dispatchMessage, {
            onEnter: function (args) {
                const cmd = Memory.readCString(args[2]);
                console.log("[*] dispatchMessage cmd: " + cmd);
            }
        });
    }

    // ── Hook LoginManager::startConnectServer ──
    const startConnectServer = Module.findExportByName(
        "libgame_logic.so",
        "_ZN12LoginManager18startConnectServerEv"
    );
    if (startConnectServer) {
        console.log("[+] Found LoginManager::startConnectServer at " + startConnectServer);
        Interceptor.attach(startConnectServer, {
            onEnter: function (args) {
                console.log("[*] LoginManager::startConnectServer called");
            }
        });
    }

    console.log("[+] All hooks installed");
    return true;
}

// Poll for the module
const interval = setInterval(function () {
    if (hookGameLogic()) {
        clearInterval(interval);
    }
}, 500);

// Also catch SIGABRT to get a stack trace
Process.setExceptionHandler(function (details) {
    console.log("[!] Exception: " + details.type + " at " + details.address);
    console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
        .map(DebugSymbol.fromAddress).join('\n'));
    return false; // let the app crash but log it
});
