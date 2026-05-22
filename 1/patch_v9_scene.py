"""Patch v9 — SceneLayer::addGuideLayer @ 0x48635a → BX LR.

Prevents GuideLayer from being added to the scene tree after map entry.
GuideLayer object is still created (from CCBI) but never displayed.
No visible dialog, no touch interception, no Eva blocking.

Different from deleting GuideLayer.ccbi (which crashed because CCBReader returned NULL).
Different from patching beginGuide (which broke role creation).
"""
import struct

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.prepatch_guide_v3"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES_2 = [
    (0x48d9f2, "GuideLayer::hideMaskLayer"),
    (0x48da0e, "GuideLayer::showMaskLayer"),
    (0x48da2a, "GuideLayer::hideDialogNode"),
    (0x48da3a, "GuideLayer::showDialogNode"),
    (0x48635a, "SceneLayer::addGuideLayer"),
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
for vaddr, name in PATCHES_2:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    o = bytes(data[off:off+2])
    print(f"[+] {name} @ 0x{addr:08x}: {o.hex(' ')} -> 70 47")
    data[off:off+2] = NEW_2
with open(OUTPUT, "wb") as f:
    f.write(data)
# Verify
with open(OUTPUT, "rb") as f:
    vdata = f.read()
for vaddr, name in PATCHES_2:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    byt = bytes(vdata[off:off+2])
    ok = "OK" if byt == NEW_2 else "FAIL"
    print(f"  verify {name}: {byt.hex(' ')} {ok}")
print(f"[+] wrote {OUTPUT}")
