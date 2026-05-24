// Dismiss dialog v7: hook GameGuideManager to block tutorial
const mod = Process.findModuleByName("libgame_logic.so");

// Find GameGuideManager beginGuide
let beginGuideFn = null;
let hideDialogFn = null;

for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("GameGuideManager") && exp.name.includes("beginGuide") && !exp.name.includes("~"))
        beginGuideFn = exp.address;
    if (exp.name.includes("GuideLayer") && exp.name.includes("hideDialogNode"))
        hideDialogFn = exp.address;
}
send(`beginGuide=${!!beginGuideFn} hideDialog=${!!hideDialogFn}`);

if (beginGuideFn) {
    Interceptor.attach(beginGuideFn, {
        onEnter(args) {
            send(`GameGuideManager::beginGuide called! this=${args[0]}`);
            // Try to block it by returning early? No, need to return 0/false
        },
        onLeave(retval) {
            send(`beginGuide returned ${retval}`);
        }
    });
    send("beginGuide hooked");
}

// Also hook all GuideLayer show functions
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("GuideLayer")) continue;
    if (exp.name.includes("show") || exp.name.includes("create") || exp.name.includes("add")) {
        if (exp.name.includes("Dialog") || exp.name.includes("Mask") || exp.name.includes("Node")) {
            send(`  GuideLayer fn: ${exp.name}`);
        }
    }
}

// If hideDialogNode is found, try to call it on current bag instance
// by finding GuideLayer through the bag-to-guide connection
if (hideDialogFn) {
    Interceptor.attach(hideDialogFn, {
        onEnter(args) {
            send(`captured GuideLayer=${args[0]}`);
            // Save this for later RPC
            this.guide = args[0];
        }
    });
}

send("[DONE] — tap '我知道了' to capture GuideLayer ptr");
