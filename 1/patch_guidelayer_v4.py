"""Patch v4 — surgical fix for Eva dialog touch blockage.

Root cause: ccTouchBegan @ 0x48d276 unconditionally branches to "return true"
(MOVS R4,#1 at 0x48d3c6) when the GuideLayer dialog node doesn't exist.
Since showDialogNode is no-opped, the dialog node IS always absent,
so ALL touches get swallowed — NPCTalkLayer never receives them.

Fix: redirect the branch from 0x48d3c6 (return true) to 0x48d3c2 (return false).
Single byte change: 0xA6 → 0xA4 (Thumb B unconditional branch offset).

Pet selection is unaffected because during pet selection, the dialog node
DOES exist (pet selection uses GuideLayer's own dialog, not NPCTalkLayer),
so the code takes BNE at 0x48d274 into the dialog-handling path instead.
"""
import struct, os, shutil

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.prepatch_guide_v3"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

# 2-byte patches (BX LR)
PATCHES_2 = [
    (0x48d9f2, "GuideLayer::hideMaskLayer"),
    (0x48da0e, "GuideLayer::showMaskLayer"),
    (0x48da2a, "GuideLayer::hideDialogNode"),
    (0x48da3a, "GuideLayer::showDialogNode"),
]
NEW_2 = bytes([0x70, 0x47])

# 1-byte patch: ccTouchBegan branch target
# 0x48d276: B 0x48d3c6 → B 0x48d3c2
# Current: A6 E0 → change first byte to A4
PATCH_BYTE = (0x48d276, 0xA4, "ccTouchBegan: B return-true → B return-false")

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

# 2-byte patches
for vaddr, name in PATCHES_2:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    o = bytes(data[off:off+2])
    print(f"[+] {name} @ 0x{addr:08x}: {o.hex(' ')} -> {NEW_2.hex(' ')}")
    data[off:off+2] = NEW_2

# 1-byte branch patch
vaddr, new_byte, name = PATCH_BYTE
off = v2f(phs, vaddr)
old = data[off]
print(f"[+] {name} @ 0x{vaddr:08x}: 0x{old:02x} -> 0x{new_byte:02x}")
data[off] = new_byte

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT} ({len(data)} bytes)")

# Verify
with open(OUTPUT, "rb") as f:
    vdata = f.read()
for vaddr, name in PATCHES_2:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    byt = bytes(vdata[off:off+2])
    ok = "OK" if byt == NEW_2 else f"FAIL"
    print(f"  verify {name}: {byt.hex(' ')} {ok}")

vaddr = PATCH_BYTE[0]
off = v2f(phs, vaddr)
byt = vdata[off]
exp = PATCH_BYTE[1]
print(f"  verify {name}: 0x{byt:02x} {'OK' if byt==exp else 'FAIL (expected 0x%02x)'%exp}")
