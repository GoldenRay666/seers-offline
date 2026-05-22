// Hook LevelLayer::getChildrenByTag and CCActionManager::addAction
// to see what's null and why

// Base address of libgame_logic.so
var base = Module.findBaseAddress("libgame_logic.so");
if (!base) {
    console.log("[!] libgame_logic.so not loaded yet. Waiting...");
    // Wait for it
    var interval = setInterval(function() {
        base = Module.findBaseAddress("libgame_logic.so");
        if (base) {
            clearInterval(interval);
            console.log("[+] libgame_logic.so loaded at " + base);
            hookFunctions();
        }
    }, 100);
} else {
    console.log("[+] libgame_logic.so at " + base);
    hookFunctions();
}

function hookFunctions() {
    // Offset from IDA: LevelLayer::getChildrenByTag at 0x55fba0
    var getChildrenByTag = base.add(0x55fba0);
    Interceptor.attach(getChildrenByTag, {
        onEnter: function(args) {
            console.log("[getChildrenByTag] this=" + args[0] + " node=" + args[1] + " tag=" + args[2]);
            if (args[1].isNull()) {
                console.log("[!!!] NULL node passed to getChildrenByTag!");
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\n'));
            }
        },
        onLeave: function(retval) {
            console.log("[getChildrenByTag] result=" + retval);
        }
    });

    // CCActionManager::addAction at 0x477a000 + offset
    // From tombstone: CCActionManager::addAction+281 = 0x477aa3a
    // So addAction start = 0x477aa3a - 281 = 0x477a91f (approximately)
    // Actually 281 decimal = 0x119, so start = 0x477aa3a - 0x119 = 0x477a921
    var addActionStart = base.add(0x477a921);
    Interceptor.attach(addActionStart, {
        onEnter: function(args) {
            console.log("[addAction] this=" + args[0] + " action=" + args[1] + " node=" + args[2]);
            if (args[2].isNull()) {
                console.log("[!!!] NULL node passed to addAction!");
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\n'));
            }
        }
    });

    // Also hook the select_main_mon handler to see what it does
    // MessageHandler::handleMessage(NORMAL_MSG_PACKAGE*) at 0x6329fc
    var handleMsg = base.add(0x6329fc);
    Interceptor.attach(handleMsg, {
        onEnter: function(args) {
            console.log("[handleMessage] this=" + args[0] + " pkg=" + args[1]);
        }
    });

    console.log("[+] Hooks installed");
}
