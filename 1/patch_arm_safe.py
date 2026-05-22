"""Patch ARM: all guide steps EXCEPT char creation + framework."""
import struct

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.arm_working"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

# All guide step handlers except: selectMainSprite, selectMainSpriteDialog,
# pressSetFirst, pressForBattle, pressToStorage, showDoctorEvaOnGuideLayer
PATCHES = [
    (0x46f97c, "guideWalkToEva"),
    (0x46f92e, "guideTakeQuest"),
    (0x46f6ba, "guideSubmitQuest"),
    (0x46e8ca, "guideQuestCenterDialog"),
    (0x46e918, "guidePressQuestCenter"),
    (0x46ee78, "guidePressQuestQuickAid"),
    (0x46e766, "guideTakeChangeSpriteStatusQuest"),
    (0x46e970, "guideSubmitChangeSpriteStatusQuest"),
    (0x46ed18, "guideTakeSettingQuest"),
    (0x46eb60, "guideSubmitSettingQuest"),
    (0x46f244, "guideTakeCultivateQuest"),
    (0x46eedc, "guideSubmitCultivateQuest"),
    (0x46f628, "guideTakeBuyGoodQuest"),
    (0x46f288, "guideSubmitBuyGoodQuest"),
    (0x46e7c0, "guideHideFunctionButtons"),
    (0x46f8de, "guideShowFunctionButtons"),
    (0x46f74c, "guideElectricityHint"),
    (0x46f7ea, "guidePressMapButton"),
    (0x46f844, "guidePressAreaButton"),
    (0x46f89a, "guidePressWorldButton"),
    (0x46f5de, "guidePressShopButton"),
    (0x46f524, "guidePressShopTabButton"),
    (0x46f360, "guidePressGoldBeanButton"),
    (0x46f3e0, "guidePressPurchaseConfirmButton"),
    (0x46f45c, "guidePressPurchaseButton"),
    (0x46f2e0, "guidePressShopCloseButton"),
    (0x46ec3c, "guidePressSpinningTopSwitch"),
    (0x46ecb8, "guidePressSetting"),
    (0x46ebb8, "guideCloseSetting"),
    (0x46ef34, "guideClosePack"),
    (0x46efb4, "guideCloseStatusPage"),
    (0x46edfc, "guidePressCaptureConfirmButton"),
    (0x46f0f8, "guidePressFeedButton"),
    (0x46f180, "guidePressSpriteButton"),
    (0x46f200, "guidePressSpritePackButton"),
    (0x46f708, "guidePressHomeButton"),
    (0x46f590, "guideShopDescription"),
    (0x46f4d0, "guideMoveScrollView"),
    (0x46ed70, "guideCaptureDoCapture"),
    (0x46edac, "guideCaptureMethod"),
    (0x46f680, "guideGainPrize"),
    (0x46f796, "guideSelectSkill"),
    (0x46fad8, "guideViewWorldSetting"),
    (0x46fb30, "guideStartBattle"),
    (0x46e7c8, "guideShowPackDescription"),
    (0x46f03c, "guideWaitSpriteGrowthNotifyEnd"),
    (0x46f070, "guideSelectFood"),
]
NEW_2 = bytes([0x70, 0x47])

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
    print(f"[+] {name}: {o.hex(' ')} -> 70 47")
    data[off:off+2] = NEW_2
with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT}")
