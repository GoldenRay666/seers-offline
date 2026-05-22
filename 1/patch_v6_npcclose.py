"""Patch v6 — plan B: NPCTalkLayer::ccTouchBegan auto-dismiss on any touch.

Touching NPCTalkLayer dialog → BL onCloseSelected → dialog closes → returns true.

Replaces first 8 bytes of NPCTalkLayer::ccTouchBegan @ 0x4e9110 (46 bytes) with:
  BL 0x4e7bee   ; call onCloseSelected (fe f7 b6 fa)  — 4 bytes
  MOVS R0, #1   ; return true          (01 20)         — 2 bytes
  BX LR          ;                      (70 47)         — 2 bytes
"""
import struct

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.prepatch_guide_v3"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

# 2-byte patches (v2 baseline: 4 GuideLayer functions)
PATCHES_2 = [
    (0x48d9f2, "GuideLayer::hideMaskLayer"),
    (0x48da0e, "GuideLayer::showMaskLayer"),
    (0x48da2a, "GuideLayer::hideDialogNode"),
    (0x48da3a, "GuideLayer::showDialogNode"),
]
NEW_2 = bytes([0x70, 0x47])

# NPCTalkLayer::ccTouchBegan @ 0x4e9110 — 8-byte replacement
NEW_NPCTOUCH = bytes([0xFE, 0xF7, 0xB6, 0xFA,   # BL 0x4e7bee (onCloseSelected)
                      0x01, 0x20,                # MOVS R0, #1
                      0x70, 0x47])               # BX LR

def parse(data):
    e_phoff   = struct.unpack_from("<I", data, 0x1c)[0]
    e_phentsz = struct.unpack_from("<H", data, 0x2a)[0]
    e_phnum   = struct.unpack_from("<H", data, 0x2c)[0]
    phs = []
    for i in range(e_phnum):
        off = e_phoff + i * e_phentsz
        p_type, p_offset, p_vaddr, _, p_filesz, _, _, _ = \
            struct.unpack_from("<IIIIIIII", data, off)
        if p_type == 1:
            phs.append((p_vaddr, p_offset, p_filesz))
    return phs

def v2f(phs, vaddr):
    for v, o, sz in phs:
        if v <= vaddr < v + sz:
            return vaddr - v + o
    return None

with open(INPUT, "rb") as f:
    data = bytearray(f.read())
phs = parse(data)

# Apply 2-byte patches
for vaddr, name in PATCHES_2:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    o = bytes(data[off:off+2])
    print(f"[+] {name} @ 0x{addr:08x}: {o.hex(' ')} -> 70 47")
    data[off:off+2] = NEW_2

# Apply 8-byte NPCTalkLayer ccTouchBegan patch
npct_vaddr = 0x4e9110
npct_off = v2f(phs, npct_vaddr)
o = bytes(data[npct_off:npct_off+8])
print(f"[+] NPCTalkLayer::ccTouchBegan @ 0x{npct_vaddr:08x}: {o.hex(' ')} -> {NEW_NPCTOUCH.hex(' ')}")
data[npct_off:npct_off+8] = NEW_NPCTOUCH

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT} ({len(data)} bytes)")

# Verify
with open(OUTPUT, "rb") as f:
    vdata = f.read()
for vaddr, name in PATCHES_2:
    off = v2f(phs, vaddr & ~1)
    byt = bytes(vdata[off:off+2])
    ok = "OK" if byt == NEW_2 else "FAIL"
    print(f"  verify {name}: {byt.hex(' ')} {ok}")
byt = bytes(vdata[npct_off:npct_off+8])
ok = "OK" if byt == NEW_NPCTOUCH else "FAIL"
print(f"  verify NPCTalkLayer::ccTouchBegan: {byt.hex(' ')} {ok}")
