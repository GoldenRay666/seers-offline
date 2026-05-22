"""Patch v8 — EventSwallowLayer::ccTouchBegan @ 0x43c00d → return false.

EventSwallowLayer is added by SceneLayer during guide transitions to prevent
accidental interaction. If the guide gets stuck (because showDialogNode is no-op),
EventSwallowLayer is never removed, permanently blocking all touches.
Making its touch handler return false allows touches to pass through.
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

# EventSwallowLayer::ccTouchBegan → MOVS R0,#0; BX LR (return false, 4 bytes)
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

ev_addr = 0x43c00c  # 0x43c00d with Thumb LSB cleared
ev_off = v2f(phs, ev_addr)
o = bytes(data[ev_off:ev_off+4])
print(f"[+] EventSwallowLayer::ccTouchBegan @ 0x{ev_addr:08x}: {o.hex(' ')} -> {RETURN_FALSE.hex(' ')}")
data[ev_off:ev_off+4] = RETURN_FALSE

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT}")
