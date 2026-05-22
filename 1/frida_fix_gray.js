// Attempt to fix gray screen by forcefully removing EventSwallowLayer
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;

// Find SceneLayer::removeEventSwallowLayer
let removeFn = null;
let getSceneLayerFn = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.endsWith("23removeEventSwallowLayerEv")) removeFn = exp.address;
    if (exp.name.endsWith("13getSceneLayerEv")) getSceneLayerFn = exp.address;
}

send(`removeEventSwallowLayer @ ${removeFn}`);
send(`getSceneLayer @ ${getSceneLayerFn}`);

// Also find GameManager::sharedManager to get the scene layer
let sharedGameMgr = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.endsWith("sharedManagerEv") && exp.name.includes("GameManager")) {
        sharedGameMgr = exp.address;
    }
}
send(`GameManager::sharedManager @ ${sharedGameMgr}`);

// Try to call removeEventSwallowLayer
if (sharedGameMgr && getSceneLayerFn && removeFn) {
    const getMgr = new NativeFunction(sharedGameMgr, 'pointer', []);
    const getScene = new NativeFunction(getSceneLayerFn, 'pointer', ['pointer']);
    const removeESL = new NativeFunction(removeFn, 'void', ['pointer']);

    try {
        const mgr = getMgr();
        send(`GameManager instance: ${mgr}`);
        const scene = getScene(mgr);
        send(`SceneLayer instance: ${scene}`);
        if (!scene.isNull()) {
            removeESL(scene);
            send(`[+] Called removeEventSwallowLayer!`);
        }
    } catch(e) {
        send(`Error: ${e.message}`);
    }
}

// Also try: find all EventSwallowLayer instances and call their destructor
let eslC1 = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN17EventSwallowLayerD1Ev") eslC1 = exp.address;
}
send(`EventSwallowLayer::~D1 @ ${eslC1}`);

send(`[***] Done. Check if gray screen cleared.`);
