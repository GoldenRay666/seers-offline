"""Final patch v2 — adds showDialogNode to the no-op list.

Adds patch for GuideLayer::showDialogNode @ 0x48da3a so Eva's dialog never appears.
Without showDialogNode, the dialog node is never added to the scene → no touch blocker →
guide auto-progresses (or hangs harmlessly without blocking input).

If this still hangs, also try patching:
  - 0x48d9e0 GuideLayer::clearContentNode
  - 0x48d9ca GuideLayer::addObjectToContentNode
  - 0x48da4c GuideLayer::moveDialogNodeToTop
  - 0x48dab8 GuideLayer::moveDialogNodeToCenter
  - 0x48db22 GuideLayer::moveDialogNodeToBottom
"""
import struct, os, shutil

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.prepatch_guide_v3"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES = [
    (0x48d9f2, "GuideLayer::hideMaskLayer"),
    (0x48da0e, "GuideLayer::showMaskLayer"),
    (0x48da2a, "GuideLayer::hideDialogNode"),
    (0x48da3a, "GuideLayer::showDialogNode"),  # NEW: skip Eva dialog entirely
]
NEW = bytes([0x70, 0x47])

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
for vaddr, name in PATCHES:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    orig = bytes(data[off:off+2])
    print(f"[+] {name} @ 0x{addr:08x}: {orig.hex(' ')} -> 70 47")
    data[off+0] = NEW[0]; data[off+1] = NEW[1]
with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT}")
