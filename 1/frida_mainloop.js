// Check if game main loop is still running during gray screen
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find CCDirector::mainLoop
let mainLoop = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("mainLoop") && exp.name.includes("CCDirector")) {
        mainLoop = exp.address;
    }
}
send(`mainLoop @ ${mainLoop}`);

let frameCount = 0;
if (mainLoop) {
    Interceptor.attach(mainLoop, {
        onEnter(args) {
            frameCount++;
            if (frameCount <= 5 || frameCount % 60 === 0) {
                send(`[FRAME] mainLoop #${frameCount}`);
            }
        }
    });
    send(`[+] Hooked mainLoop. Counting frames...`);
} else {
    send(`[-] mainLoop not found`);
}

// Also hook CCApplication::update (might be different from mainLoop)
let updateFn = null;
for (const exp of mod.enumerateExports()) {
    if ((exp.name.includes("update") || exp.name.includes("mainLoop")) &&
        (exp.name.includes("CCApplication") || exp.name.includes("AppDelegate"))) {
        updateFn = exp.address;
        send(`Found: ${exp.name} @ ${exp.address}`);
    }
}

setTimeout(() => {
    send(`[STATS] ${frameCount} frames in 5 seconds`);
}, 5000);
