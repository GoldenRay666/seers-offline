// Fix backpack exit button by removing EventSwallowLayer when bag opens
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

let removeESL = null;
let getSceneLayer = null;

for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("SceneLayer") && exp.name.includes("removeEventSwallowLayer"))
        removeESL = exp.address;
    if (exp.name.includes("GameManager") && exp.name.includes("sharedManager"))
        getSceneLayer = exp.address;  // Actually this is GameManager::sharedManager
}

// Need SceneLayer from GameManager
let gmGetScene = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("GameManager") && exp.name.includes("getSceneLayer"))
        gmGetScene = exp.address;
}

// Hook ItemBagLayer init to auto-fix
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("ItemBagLayer") && exp.name.includes("init") && !exp.name.includes("CCB")) {
        Interceptor.attach(exp.address, {
            onLeave(retval) {
                send(`[BAG-FIX] ItemBagLayer opened, removing EventSwallowLayer...`);
                if (removeESL && gmGetScene && getSceneLayer) {
                    try {
                        const getMgr = new NativeFunction(getSceneLayer, 'pointer', []);
                        const mgr = getMgr();
                        const getScene = new NativeFunction(gmGetScene, 'pointer', ['pointer']);
                        const scene = getScene(mgr);
                        if (!scene.isNull()) {
                            new NativeFunction(removeESL, 'void', ['pointer'])(scene);
                            send(`[BAG-FIX] removeEventSwallowLayer called`);
                        }
                    } catch(e) {
                        send(`[BAG-FIX] error: ${e.message}`);
                    }
                }
            }
        });
        send(`[+] ItemBagLayer hook installed`);
        break;
    }
}

send('[***] Ready. Open backpack to test.');
