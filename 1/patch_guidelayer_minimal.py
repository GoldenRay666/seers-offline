"""Minimal GuideLayer crash bypass + skip guide trigger.

Strategy:
- Revert v3 over-patch (which broke setDialog/showDialogNode/etc.)
- Patch ONLY the 3 confirmed Houdini-crash functions:
  - hideMaskLayer @ 0x48d9f2
  - showMaskLayer @ 0x48da0e
  - hideDialogNode @ 0x48da2a
- Also patch `GameGuideManager::beginGuide` @ 0x46e7d0 so guide never starts
  (avoids the entire showDialogNode chain that user is now stuck in)
- And `GameOpenAssignFunctionManager::beginGuide` @ 0x477254 (variant)

Builds from the ORIGINAL unpatched .so each time so we control the patch set.
"""
import struct, os, shutil

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.prepatch_guide_v3"  # original snapshot
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES = [
    (0x48d9f2, "GuideLayer::hideMaskLayer"),
    (0x48da0e, "GuideLayer::showMaskLayer"),
    (0x48da2a, "GuideLayer::hideDialogNode"),
    (0x46e7d0, "GameGuideManager::beginGuide"),
    (0x477254, "GameOpenAssignFunctionManager::beginGuide"),
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
print(f"[*] base from: {INPUT}")
print(f"[*] size: {len(data)} bytes")

for vaddr, name in PATCHES:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    if off is None:
        print(f"[-] {name} @ 0x{addr:08x}: not in PT_LOAD; skip")
        continue
    orig = bytes(data[off:off+2])
    print(f"[+] {name} @ 0x{addr:08x} (file 0x{off:08x}): {orig.hex(' ')} -> 70 47")
    data[off+0] = NEW[0]
    data[off+1] = NEW[1]

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT} ({len(data)} bytes)")
