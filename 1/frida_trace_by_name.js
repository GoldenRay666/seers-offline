// Trace guide functions by exported symbol name (correct approach)
'use strict';

const MODULE = "libgame_logic.so";

// All relevant guide function mangled names from verified exports
const SYMBOLS = [
    // GameGuideManager
    "_ZN16GameGuideManager9isInGuideEv",
    "_ZN16GameGuideManager8endGuideEv",
    "_ZN16GameGuideManager12processGuideEv",
    "_ZN16GameGuideManager10beginGuideEv",
    "_ZN16GameGuideManager10goNextStepEv",
    "_ZN16GameGuideManager12getGuideStepEv",
    "_ZN16GameGuideManager16getGuideProgressEv",
    "_ZN16GameGuideManager11initProgressEv",

    "_ZN16GameGuideManager14guideWalkToEvaEv",
    "_ZN16GameGuideManager14guideTakeQuestEv",
    "_ZN16GameGuideManager17guideSubmitQuestEv",
    "_ZN16GameGuideManager22guideQuestCenterDialogEv",
    "_ZN16GameGuideManager21guidePressQuestCenterEv",
    "_ZN16GameGuideManager25guideShowFunctionButtonsEv",
    "_ZN16GameGuideManager24guideHideFunctionButtonsEv",
    "_ZN16GameGuideManager21guideSelectMainSpriteEv",
    "_ZN16GameGuideManager27guideSelectMainSpriteDialogEv",
    "_ZN16GameGuideManager18guidePressSetFirstEv",
    "_ZN16GameGuideManager19guidePressForBattleEv",
    "_ZN16GameGuideManager19guidePressToStorageEv",
    "_ZN16GameGuideManager32guideTakeChangeSpriteStatusQuestEv",
    "_ZN16GameGuideManager34guideSubmitChangeSpriteStatusQuestEv",
    "_ZN16GameGuideManager21guideTakeSettingQuestEv",
    "_ZN16GameGuideManager23guideTakeCultivateQuestEv",
    "_ZN16GameGuideManager21guideTakeBuyGoodQuestEv",
    "_ZN16GameGuideManager17guideSelectSkillEv",
    "_ZN16GameGuideManager15guideClosePackEv",
    "_ZN16GameGuideManager21guideCloseStatusPageEv",
    "_ZN16GameGuideManager17guideCloseSettingEv",
    "_ZN16GameGuideManager15guideStartBattleEv",
    "_ZN16GameGuideManager18guideSelectFoodEv",
    "_ZN16GameGuideManager19guideMoveScrollViewEv",
    "_ZN16GameGuideManager23guideElectricityHintEv",
    "_ZN16GameGuideManager22guideViewWorldSettingEv",
    "_ZN16GameGuideManager14guideGainPrizeEv",
    "_ZN16GameGuideManager21guideShopDescriptionEv",
    "_ZN16GameGuideManager21guideViewWorldMapEv",
    "_ZN16GameGuideManager23guideShowEvaOnGuideLayerEv",
    "_ZN16GameGuideManager19guideShowEvaOnMapEv",

    // GuideLayer
    "_ZN10GuideLayer14showMaskLayerEv",
    "_ZN10GuideLayer14hideMaskLayerEv",
    "_ZN10GuideLayer14showDialogNodeEv",
    "_ZN10GuideLayer14hideDialogNodeEv",
    "_ZN10GuideLayer22addObjectToContentNodeEPN7cocos2d6CCNodeE",

    // GameOpenAssignFunctionManager
    "_ZN29GameOpenAssignFunctionManager10beginGuideEv",
    "_ZN29GameOpenAssignFunctionManager8endGuideEv",
    "_ZN29GameOpenAssignFunctionManager12processGuideEv",
    "_ZN29GameOpenAssignFunctionManager15isInGuideAssignEv",
];

let hooked = 0;
let failed = 0;

for (const sym of SYMBOLS) {
    try {
        const addr = Module.findExportByName(MODULE, sym);
        if (addr) {
            Interceptor.attach(addr, {
                onEnter(args) {
                    const shortName = sym.split('::').pop().replace('Ev', '');
                    send(`[GUIDE] -> ${shortName}`);
                }
            });
            hooked++;
        } else {
            failed++;
        }
    } catch(e) {
        failed++;
        send(`[-] Failed to hook ${sym}: ${e.message}`);
    }
}

send(`[+] Hooked ${hooked}/${SYMBOLS.length} functions (${failed} failed)`);
send(`[***] All hooks active. Trigger the quest/guide to see call chain.`);
send(`[***] Then accept quest to trigger gray screen...`);
