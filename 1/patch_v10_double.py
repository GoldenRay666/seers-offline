"""Patch v10 — GuideLayer::ccTouchBegan + EventSwallowLayer::ccTouchBegan both → return false.

Theory: two separate touch-handling layers consume touches before they reach NPCTalkLayer.
Patching only one at a time (v3/v4 for GuideLayer, v8 for EventSwallowLayer) wasn't enough.
"""
import struct

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.prepatch_guide_v3"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES_2 = [
    (0x48d9f2, "GuideLayer::hideMaskLayer"),
    (0x48da0e, "GuideLayer::showMaskLayer"),
    (0x48da2a, "GuideLayer::hideDialogNode"),
    (0x48da3a, "GuideLayer::showDialogNode"),
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

for vaddr, name in PATCHES_2:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    o = bytes(data[off:off+2])
    print(f"[+] {name} @ 0x{addr:08x}: {o.hex(' ')} -> 70 47")
    data[off:off+2] = NEW_2

# GuideLayer::ccTouchBegan → return false (4 bytes)
gl_addr = 0x48d1e4
gl_off = v2f(phs, gl_addr)
o = bytes(data[gl_off:gl_off+4])
print(f"[+] GuideLayer::ccTouchBegan @ 0x{gl_addr:08x}: {o.hex(' ')} -> {RETURN_FALSE.hex(' ')}")
data[gl_off:gl_off+4] = RETURN_FALSE

# EventSwallowLayer::ccTouchBegan → return false (4 bytes)
ev_addr = 0x43c00c
ev_off = v2f(phs, ev_addr)
o = bytes(data[ev_off:ev_off+4])
print(f"[+] EventSwallowLayer::ccTouchBegan @ 0x{ev_addr:08x}: {o.hex(' ')} -> {RETURN_FALSE.hex(' ')}")
data[ev_off:ev_off+4] = RETURN_FALSE

with open(OUTPUT, "wb") as f:
    f.write(data)

# Verify
with open(OUTPUT, "rb") as f:
    vdata = f.read()
for vaddr, name in PATCHES_2:
    off = v2f(phs, vaddr & ~1)
    byt = bytes(vdata[off:off+2])
    print(f"  verify {name}: {byt.hex(' ')} {'OK' if byt==NEW_2 else 'FAIL'}")
for addr, name in [(gl_addr, "GuideLayer::ccTouchBegan"), (ev_addr, "EventSwallowLayer::ccTouchBegan")]:
    off = v2f(phs, addr)
    byt = bytes(vdata[off:off+4])
    print(f"  verify {name}: {byt.hex(' ')} {'OK' if byt==RETURN_FALSE else 'FAIL'}")
print(f"[+] wrote {OUTPUT}")
