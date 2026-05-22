// Final targeted trace: EventSwallowLayer + Mask + Quest accept
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
send(`[+] Module at ${mod.base}`);

// Manual list of exact mangled names to hook
const HOOK_LIST = [
    // EventSwallowLayer lifecycle
    "_ZN17EventSwallowLayer4initEi",           // init
    "_ZN17EventSwallowLayerC1Ev",              // constructor
    "_ZN17EventSwallowLayerC2Ev",              // constructor v2
    "_ZN17EventSwallowLayerD1Ev",              // destructor
    "_ZN17EventSwallowLayerD2Ev",              // destructor v2
    "_ZN17EventSwallowLayer27registerWithTouchDispatcherEv",  // register touch

    // SceneLayer cleanup
    "_ZN10SceneLayer23removeEventSwallowLayerEv",  // remove EventSwallow

    // Mask show/hide
    "_ZN10GuideLayer13showMaskLayerEv",
    "_ZN10GuideLayer13hideMaskLayerEv",
    "_ZN17OpenFunctionLayer13showMaskLayerEv",
    "_ZN17OpenFunctionLayer13hideMaskLayerEv",

    // Quest acceptance
    "_ZN3NPC13questAcceptedEt",
    "_ZN3NPC13questPublishedEt",
    "_ZN5Quest12submitResultEv",
];

// Build a map of address -> short name
const addrMap = new Map();
for (const exp of mod.enumerateExports()) {
    if (HOOK_LIST.includes(exp.name)) {
        addrMap.set(exp.address.toString(), exp.name);
    }
}

// Also add guide flow functions from earlier
const GUIDE_EXTRAS = [
    "endGuideEv", "beginGuideEv", "processGuideEv", "goNextStepEv",
    "guideTakeQuestEv", "isInGuideEv", "getGuideStepEv",
    "showDialogNodeEv", "hideDialogNodeEv",
];
for (const exp of mod.enumerateExports()) {
    for (const suffix of GUIDE_EXTRAS) {
        if (exp.name.endsWith(suffix) && !addrMap.has(exp.address.toString())) {
            addrMap.set(exp.address.toString(), exp.name);
        }
    }
}

// Hook all found addresses
let hooked = 0;
for (const [addrStr, name] of addrMap) {
    const addr = ptr(addrStr);
    // Shorten the name for output
    let short = name;
    const idx = name.lastIndexOf("::");
    if (idx >= 0) short = name.substring(idx + 2);
    short = short.replace("Ev", "").replace("Et", "");

    try {
        const label = short; // capture
        Interceptor.attach(addr, {
            onEnter: function(args) {
                send(`[TRACE] ${label}`);
            }
        });
        hooked++;
    } catch(e) {
        send(`  [SKIP] ${short}: ${e.message}`);
    }
}

send(`[+] Hooked ${hooked} functions`);
send(`[***] Ready. Accept the quest now!`);
