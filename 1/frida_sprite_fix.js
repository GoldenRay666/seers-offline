var modName = "libgame_logic.so";
var hooked = false;

function installHooks() {
    if (hooked) return;
    var mod = Process.findModuleByName(modName);
    if (!mod) { console.log("[DBG] Module not loaded yet, retrying..."); return; }

    console.log("[DBG] Module found at:", mod.base);
    var base = mod.base;

    // Use known IDA offsets (thumb mode = offset | 1)
    var addElf = base.add(0x44d50c).or(1);
    var bmStart = base.add(0x465c54).or(1);
    var getAttacker = base.add(0x4463bc).or(1);
    var addWaiting = base.add(0x466550).or(1);
    var setAttackee = base.add(0x466a3a).or(1);
    var addAnimInt = base.add(0x558afc).or(1);

    if (!bmStart) { console.log("[DBG] Functions not found yet, retrying..."); return; }

    hooked = true;
    console.log("[DBG] addElfComponent:", addElf);
    console.log("[DBG] getAttacker:", getAttacker);
    console.log("[DBG] addWaitingSprites:", addWaiting);
    console.log("[DBG] setAttackee:", setAttackee);
    console.log("[DBG] BattleManager::start:", bmStart);

    if (addWaiting) {
        Interceptor.attach(addWaiting, {
            onEnter: function(args) {
                console.log("[DBG] addWaitingSprites called, bm=", args[0]);
            }
        });
    }

    if (setAttackee) {
        Interceptor.attach(setAttackee, {
            onEnter: function(args) {
                console.log("[DBG] setAttackee called, bm=", args[0]);
            }
        });
    }

    if (getAttacker) {
        Interceptor.attach(getAttacker, {
            onLeave: function(retval) {
                if (retval && !retval.isNull()) {
                    console.log("[DBG] getAttacker returned:", retval, "first word:", retval.readU32());
                } else {
                    console.log("[DBG] getAttacker returned NULL");
                }
            }
        });
    }

    if (addElf) {
        Interceptor.attach(addElf, {
            onEnter: function(args) {
                console.log("[DBG] addElfComponent called, side=", args[1].toInt32());
            },
            onLeave: function(retval) {
                console.log("[DBG] addElfComponent returned:", retval);
            }
        });
    }

    if (bmStart) {
        Interceptor.attach(bmStart, {
            onEnter: function(args) {
                console.log("[DBG] ===== BattleManager::start called =====");
            },
            onLeave: function(retval) {
                console.log("[DBG] ===== BattleManager::start done =====");
            }
        });
    }

    if (addAnimInt) {
        Interceptor.attach(addAnimInt, {
            onEnter: function(args) {
                console.log("[DBG] addAnimSprite(int) monId=", args[1].toInt32(),
                            "x=", args[2].toInt32(), "y=", args[3].toInt32());
            },
            onLeave: function(retval) {
                console.log("[DBG] addAnimSprite returned:", retval);
            }
        });
    }
    console.log("[DBG] Hooks installed");
}

setInterval(installHooks, 1000);
installHooks();