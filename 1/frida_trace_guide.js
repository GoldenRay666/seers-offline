// Trace ALL GameGuideManager functions to find the gray-screen culprit
'use strict';

const MODULE = "libgame_logic.so";

// All GameGuideManager guide step handlers (from IDA output)
const FUNCTIONS = [
    {addr: 0x46e564, name: "initProgress"},
    {addr: 0x46e6fa, name: "getGuideStep"},
    {addr: 0x46e700, name: "processGuide"},
    {addr: 0x46e784, name: "goNextStep"},
    {addr: 0x46e53c, name: "endGuide"},
    {addr: 0x46e556, name: "isInGuide"},
    {addr: 0x46e7d0, name: "beginGuide"},
    {addr: 0x46e878, name: "showDoctorEvaOnGuideLayer"},
    {addr: 0x46e88a, name: "showDoctorEvaOnMap"},
    {addr: 0x46e4f4, name: "guideSelectMainSprite"},
    {addr: 0x46fa6c, name: "guideSelectMainSpriteDialog"},
    {addr: 0x46f97c, name: "guideWalkToEva"},
    {addr: 0x46f92e, name: "guideTakeQuest"},
    {addr: 0x46f6ba, name: "guideSubmitQuest"},
    {addr: 0x46e8ca, name: "guideQuestCenterDialog"},
    {addr: 0x46e918, name: "guidePressQuestCenter"},
    {addr: 0x46f8de, name: "guideShowFunctionButtons"},
    {addr: 0x46e7c0, name: "guideHideFunctionButtons"},
    {addr: 0x46f74c, name: "guideElectricityHint"},
    {addr: 0x46fad8, name: "guideViewWorldSetting"},
    {addr: 0x46e9c8, name: "guidePressSetFirst"},
    {addr: 0x46ea54, name: "guidePressForBattle"},
    {addr: 0x46eae0, name: "guidePressToStorage"},
    {addr: 0x46e766, name: "guideTakeChangeSpriteStatusQuest"},
    {addr: 0x46ed18, name: "guideTakeSettingQuest"},
    {addr: 0x46f244, name: "guideTakeCultivateQuest"},
    {addr: 0x46f628, name: "guideTakeBuyGoodQuest"},
    {addr: 0x46f590, name: "guideShopDescription"},
    {addr: 0x46f680, name: "guideGainPrize"},
    {addr: 0x46ef34, name: "guideClosePack"},
    {addr: 0x46ebb8, name: "guideCloseSetting"},
    {addr: 0x46efb4, name: "guideCloseStatusPage"},
    {addr: 0x46fb30, name: "guideStartBattle"},
    {addr: 0x46f796, name: "guideSelectSkill"},
    {addr: 0x46f070, name: "guideSelectFood"},
    {addr: 0x46f4d0, name: "guideMoveScrollView"},
    {addr: 0x48da0e, name: "GuideLayer::showMaskLayer"},
    {addr: 0x48d9f2, name: "GuideLayer::hideMaskLayer"},
    {addr: 0x48da3a, name: "GuideLayer::showDialogNode"},
    {addr: 0x48da2a, name: "GuideLayer::hideDialogNode"},
];

function tryInstall() {
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;
    const base = mod.base;
    send(`[+] ${MODULE} at ${base}`);

    let count = 0;
    for (const f of FUNCTIONS) {
        try {
            Interceptor.attach(base.add(f.addr), {
                onEnter(args) {
                    send(`[GUIDE-CALL] ${f.name} @ ${f.addr.toString(16)}`);
                }
            });
            count++;
        } catch(e) {
            // silently skip already-patched (would crash) or invalid addresses
        }
    }
    send(`[+] Hooked ${count}/${FUNCTIONS.length} guide functions`);
    send(`[***] TRACE ACTIVE. Now accept the quest to trigger gray screen...`);
}

setInterval(tryInstall, 500);
tryInstall();
