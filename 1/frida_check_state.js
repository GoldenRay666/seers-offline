// Check current guide state in gray screen (using enumerateExports)
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

let sharedMgr = null, isInGuideFn = null, getGuideStepFn = null, getGuideProgressFn = null;

for (const exp of mod.enumerateExports()) {
    if (exp.name.endsWith("sharedManagerEv")) sharedMgr = exp.address;
    if (exp.name.endsWith("9isInGuideEv")) isInGuideFn = exp.address;
    if (exp.name.endsWith("12getGuideStepEv")) getGuideStepFn = exp.address;
    if (exp.name.endsWith("16getGuideProgressEv")) getGuideProgressFn = exp.address;
}

send(`sharedManager @ ${sharedMgr}`);
send(`isInGuide @ ${isInGuideFn}`);
send(`getGuideStep @ ${getGuideStepFn}`);

if (sharedMgr && isInGuideFn) {
    const mgr = new NativeFunction(sharedMgr, 'pointer', []);
    const isInGuide = new NativeFunction(isInGuideFn, 'int', ['pointer']);
    try {
        const instance = mgr();
        send(`GameGuideManager instance: ${instance}`);
        send(`isInGuide() = ${isInGuide(instance)}`);
    } catch(e) {
        send(`Error: ${e.message}`);
    }
}

if (sharedMgr && getGuideStepFn) {
    const mgr = new NativeFunction(sharedMgr, 'pointer', []);
    const getStep = new NativeFunction(getGuideStepFn, 'int', ['pointer']);
    try {
        send(`getGuideStep() = ${getStep(mgr())}`);
    } catch(e) {
        send(`Error: ${e.message}`);
    }
}

send(`[***] Done`);
