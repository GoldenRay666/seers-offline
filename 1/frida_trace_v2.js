// Trace guide functions - using enumerateExports (works with Gadget)
'use strict';

const MODULE = "libgame_logic.so";

const mod = Process.findModuleByName(MODULE);
const base = mod.base;
send(`[+] ${MODULE} at ${base}`);

// Build a map of mangled name -> short name for fast lookup
const TARGETS = new Map();
const NAMES = [
    "isInGuide", "endGuide", "processGuide", "beginGuide", "goNextStep",
    "getGuideStep", "getGuideProgress", "initProgress",
    "guideWalkToEva", "guideTakeQuest", "guideSubmitQuest",
    "guideQuestCenterDialog", "guidePressQuestCenter",
    "guideShowFunctionButtons", "guideHideFunctionButtons",
    "guideSelectMainSprite", "guideSelectMainSpriteDialog",
    "guidePressSetFirst", "guidePressForBattle", "guidePressToStorage",
    "guideTakeChangeSpriteStatusQuest", "guideSubmitChangeSpriteStatusQuest",
    "guideTakeSettingQuest", "guideTakeCultivateQuest", "guideTakeBuyGoodQuest",
    "guideSelectSkill", "guideClosePack", "guideCloseStatusPage", "guideCloseSetting",
    "guideStartBattle", "guideSelectFood", "guideMoveScrollView",
    "guideElectricityHint", "guideViewWorldSetting", "guideGainPrize",
    "guideShopDescription", "showEvaOnGuideLayer", "showEvaOnMap",
    "showMaskLayer", "hideMaskLayer", "showDialogNode", "hideDialogNode",
    "addObjectToContentNode",
];
const CLASSES = ["GameGuideManager", "GuideLayer", "GameOpenAssignFunctionManager"];

// Build set of short names we care about
const targetShortNames = new Set(NAMES);

const exports = mod.enumerateExports();
let hooked = 0;

for (const exp of exports) {
    const name = exp.name;
    // Extract short function name from C++ mangled name
    for (const cls of CLASSES) {
        const prefix = `_ZN${cls.length}${cls}`;
        if (name.startsWith(prefix)) {
            // Extract the method name
            const rest = name.substring(prefix.length);
            // Method name is digit-prefixed like "9isInGuideEv" -> "isInGuide"
            let i = 0;
            while (i < rest.length && rest[i] >= '0' && rest[i] <= '9') i++;
            if (i > 0) {
                const len = parseInt(rest.substring(0, i));
                const method = rest.substring(i, i + len);
                if (targetShortNames.has(method)) {
                    try {
                        Interceptor.attach(exp.address, {
                            onEnter(args) {
                                send(`[GUIDE] ${cls}::${method}()`);
                            }
                        });
                        hooked++;
                        send(`  [OK] ${cls}::${method}`);
                    } catch(e) {
                        send(`  [FAIL] ${cls}::${method}: ${e.message}`);
                    }
                }
            }
        }
    }
}

send(`\n[+] Hooked ${hooked} guide functions`);
send(`[***] Hooks active. Proceed to accept the quest to trigger gray screen...`);
