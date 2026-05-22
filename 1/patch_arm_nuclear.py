"""Nuclear option: patch EVERY guide, mask, event-swallow, and touch-blocking function.

Includes:
- ALL GameGuideManager step handlers (including char creation ones)
- ALL GameOpenAssignFunctionManager handlers
- GuideLayer mask/dialog handlers
- EventSwallowLayer touch handler
- SceneLayer addEventSwallowLayer, addGuideLayer (the layer that Wraps everything)
- NPCTalkLayer touch handler

This is a scorched-earth approach. If gray screen persists after this, the problem
is NOT in any of these functions — it's something else entirely.
"""
import struct

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.prepatch_guide_v3"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES = [
    # ── GuideLayer display ──
    (0x48d9f2, "GuideLayer::hideMaskLayer"),
    (0x48da0e, "GuideLayer::showMaskLayer"),
    (0x48da2a, "GuideLayer::hideDialogNode"),
    (0x48da3a, "GuideLayer::showDialogNode"),
    (0x48d9ca, "GuideLayer::addObjectToContentNode"),
    (0x48d9e0, "GuideLayer::clearContentNode"),
    (0x48e246, "GuideLayer::initialize"),

    # ── SceneLayer ──
    (0x48635a, "SceneLayer::addGuideLayer"),
    (0x486398, "SceneLayer::removeGuideLayer"),
    (0x48654d, "SceneLayer::addEventSwallowLayer"),
    (0x48659d, "SceneLayer::removeEventSwallowLayer"),

    # ── EventSwallowLayer ──
    (0x43c00c, "EventSwallowLayer::ccTouchBegan"),

    # ── GameGuideManager framework ──
    (0x46e700, "GGM::processGuide"),
    (0x46e784, "GGM::goNextStep"),
    (0x46e7d0, "GGM::beginGuide"),
    (0x46e53c, "GGM::endGuide"),

    # ── ALL GameGuideManager step handlers ──
    (0x46e4f4, "GGM::guideSelectMainSprite"),
    (0x46fa6c, "GGM::guideSelectMainSpriteDialog"),
    (0x46f97c, "GGM::guideWalkToEva"),
    (0x46f92e, "GGM::guideTakeQuest"),
    (0x46f6ba, "GGM::guideSubmitQuest"),
    (0x46e8ca, "GGM::guideQuestCenterDialog"),
    (0x46e918, "GGM::guidePressQuestCenter"),
    (0x46e766, "GGM::guideTakeChangeSpriteStatusQuest"),
    (0x46e970, "GGM::guideSubmitChangeSpriteStatusQuest"),
    (0x46ed18, "GGM::guideTakeSettingQuest"),
    (0x46eb60, "GGM::guideSubmitSettingQuest"),
    (0x46f244, "GGM::guideTakeCultivateQuest"),
    (0x46eedc, "GGM::guideSubmitCultivateQuest"),
    (0x46f628, "GGM::guideTakeBuyGoodQuest"),
    (0x46f288, "GGM::guideSubmitBuyGoodQuest"),
    (0x46e7c0, "GGM::guideHideFunctionButtons"),
    (0x46f8de, "GGM::guideShowFunctionButtons"),
    (0x46e7c8, "GGM::guideShowPackDescription"),
    (0x46f74c, "GGM::guideElectricityHint"),
    (0x46f7ea, "GGM::guidePressMapButton"),
    (0x46f844, "GGM::guidePressAreaButton"),
    (0x46f89a, "GGM::guidePressWorldButton"),
    (0x46f5de, "GGM::guidePressShopButton"),
    (0x46f524, "GGM::guidePressShopTabButton"),
    (0x46f360, "GGM::guidePressGoldBeanButton"),
    (0x46f3e0, "GGM::guidePressPurchaseConfirmButton"),
    (0x46f45c, "GGM::guidePressPurchaseButton"),
    (0x46f2e0, "GGM::guidePressShopCloseButton"),
    (0x46ec3c, "GGM::guidePressSpinningTopSwitch"),
    (0x46ecb8, "GGM::guidePressSetting"),
    (0x46ebb8, "GGM::guideCloseSetting"),
    (0x46ef34, "GGM::guideClosePack"),
    (0x46efb4, "GGM::guideCloseStatusPage"),
    (0x46e9c8, "GGM::guidePressSetFirst"),
    (0x46ea54, "GGM::guidePressForBattle"),
    (0x46eae0, "GGM::guidePressToStorage"),
    (0x46edfc, "GGM::guidePressCaptureConfirmButton"),
    (0x46f0f8, "GGM::guidePressFeedButton"),
    (0x46f180, "GGM::guidePressSpriteButton"),
    (0x46f200, "GGM::guidePressSpritePackButton"),
    (0x46f708, "GGM::guidePressHomeButton"),
    (0x46f590, "GGM::guideShopDescription"),
    (0x46f4d0, "GGM::guideMoveScrollView"),
    (0x46ed70, "GGM::guideCaptureDoCapture"),
    (0x46edac, "GGM::guideCaptureMethod"),
    (0x46f680, "GGM::guideGainPrize"),
    (0x46f796, "GGM::guideSelectSkill"),
    (0x46fad8, "GGM::guideViewWorldSetting"),
    (0x46fb30, "GGM::guideStartBattle"),
    (0x46f03c, "GGM::guideWaitSpriteGrowthNotifyEnd"),
    (0x46f070, "GGM::guideSelectFood"),
    (0x46e878, "GGM::showDoctorEvaOnGuideLayer"),
    (0x46e88a, "GGM::showDoctorEvaOnMap"),
    (0x46ee78, "GGM::guidePressQuestQuickAid"),

    # ── GameOpenAssignFunctionManager ──
    (0x477254, "GOAF::beginGuide"),
    (0x477048, "GOAF::processGuide"),
    (0x476a30, "GOAF::endGuide"),
]
NEW_2 = bytes([0x70, 0x47])
RETURN_FALSE = bytes([0x00, 0x20, 0x70, 0x47])

def parse(data):
    e_phoff = struct.unpack_from("<I", data, 0x1c)[0]
    e_phentsz = struct.unpack_from("<H", data, 0x2a)[0]
    e_phnum = struct.unpack_from("<H", data, 0x2c)[0]
    phs = []
    for i in range(e_phnum):
        off = e_phoff + i * e_phentsz
        p_type, p_offset, p_vaddr, _, p_filesz, _, _, _ = \
            struct.unpack_from("<IIIIIIII", data, off)
        if p_type == 1: phs.append((p_vaddr, p_offset, p_filesz))
    return phs

def v2f(phs, vaddr):
    for v, o, sz in phs:
        if v <= vaddr < v + sz: return vaddr - v + o
    return None

with open(INPUT, "rb") as f:
    data = bytearray(f.read())
phs = parse(data)

for vaddr, name in PATCHES:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    if off is None: continue
    o = bytes(data[off:off+2])
    if name == "EventSwallowLayer::ccTouchBegan":
        data[off:off+4] = RETURN_FALSE
        print(f"[+] {name}: 4-byte -> return false")
    else:
        data[off:off+2] = NEW_2
        print(f"[+] {name}: {o.hex(' ')} -> 70 47")

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT} ({len(PATCHES)} patches)")
