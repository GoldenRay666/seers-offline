'use strict';

// Hook getChildrenByTag to prevent crash on NULL this pointer
// Crash: SIGSEGV at getChildrenByTag (0x55fba0) when this==NULL
// ebx register shows code at 0x55fbaa in libgame_logic.so

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
    // The function does:
    //   PUSH {R0-R2,R4-R7,LR}
    //   MOVS R3, #0
    //   STR R3, [R0]     ← CRASH HERE when R0(this)=NULL
    //   STR R3, [R0,#4]
    //   STR R3, [R0,#8]
    var getChildrenByTag = base.add(0x55fba0);
    Interceptor.attach(getChildrenByTag, {
        onEnter: function(args) {
            // args[0] = this pointer
            // args[1] = node
            // args[2] = tag
            if (args[0].isNull()) {
                console.log("[!!!] getChildrenByTag called with NULL this!");
                console.log("  node=" + args[1] + " tag=" + args[2]);
                console.log("  Backtrace:");
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\n'));
                // Prevent crash by skipping function
                this.skip = true;
                this.retval = ptr(0); // return NULL
            }
        },
        onLeave: function(retval) {
            if (this.skip) {
                retval.replace(ptr(0));
            }
        }
    });
    console.log("[+] Hooked getChildrenByTag at " + getChildrenByTag);

    // Also hook the select_main_mon_out handler to see what happens
    // MessageHandler::handleMessage(NORMAL_MSG_PACKAGE*) at 0x6329fc
    var handleMsg = base.add(0x6329fc);
    Interceptor.attach(handleMsg, {
        onEnter: function(args) {
            // Read the message CMD from the package
            var pkg = args[1];
            try {
                // cs_msg_head_t has cmd at offset 0x10 (string length) + 0x14
                // The cmd string is at some offset
                var cmdPtr = pkg.add(0x10).readPointer();
                if (!cmdPtr.isNull()) {
                    try {
                        var cmd = cmdPtr.readCString();
                        if (cmd && cmd.includes("select_main_mon")) {
                            console.log("\n[*] handleMessage: " + cmd);
                        }
                    } catch(e) {}
                }
            } catch(e) {}
        },
        onLeave: function(retval) {
        }
    });
    console.log("[+] Hooked handleMessage at " + handleMsg);

    // Hook CCActionManager::addAction - previous tombstone also showed this
    // crash in addAction. From hook_crash3.js: offset 0x477a921
    var addAction = base.add(0x477a921);
    Interceptor.attach(addAction, {
        onEnter: function(args) {
            if (args[0].isNull() || args[2].isNull()) {
                console.log("[!!!] addAction called with NULL args: this=" + args[0] + " action=" + args[1] + " node=" + args[2]);
                this.skip = true;
            }
        },
        onLeave: function(retval) {
            if (this.skip) {
                retval.replace(ptr(0));
            }
        }
    });
    console.log("[+] Hooked CCActionManager::addAction at " + addAction);

    console.log("[+] All hooks installed. Waiting for crash...");
}
