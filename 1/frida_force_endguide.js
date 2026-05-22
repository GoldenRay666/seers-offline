// Forcefully advance/reset guide state to try to unblock the game
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

// Find sharedManager and key guide functions
let sharedMgr = null, endGuide = null, processGuide = null, beginGuide = null;
let getGuideStep = null;

for (const exp of mod.enumerateExports()) {
    if (exp.name.endsWith("sharedManagerEv") && exp.name.includes("GameGuideManager"))
        sharedMgr = exp.address;
    if (exp.name.endsWith("8endGuideEv") && exp.name.includes("GameGuideManager"))
        endGuide = exp.address;
    if (exp.name.endsWith("12processGuideEv") && exp.name.includes("GameGuideManager"))
        processGuide = exp.address;
    if (exp.name.endsWith("10beginGuideEv") && exp.name.includes("GameGuideManager"))
        beginGuide = exp.address;
    if (exp.name.endsWith("12getGuideStepEv") && exp.name.includes("GameGuideManager"))
        getGuideStep = exp.address;
}

send(`sharedManager @ ${sharedMgr}`);
send(`endGuide @ ${endGuide}`);
send(`processGuide @ ${processGuide}`);

if (sharedMgr && endGuide && processGuide) {
    const getMgr = new NativeFunction(sharedMgr, 'pointer', []);
    const doEnd = new NativeFunction(endGuide, 'void', ['pointer']);
    const doProcess = new NativeFunction(processGuide, 'void', ['pointer']);
    const doStep = new NativeFunction(getGuideStep, 'int', ['pointer']);

    const mgr = getMgr();
    send(`GameGuideManager: ${mgr}`);
    send(`Step before: ${doStep(mgr)}`);

    // Try endGuide first
    doEnd(mgr);
    send(`Called endGuide() - step now: ${doStep(mgr)}`);

    // Try processGuide
    doProcess(mgr);
    send(`Called processGuide() - step now: ${doStep(mgr)}`);
}

send(`[***] Done. Check if game is responsive now.`);
