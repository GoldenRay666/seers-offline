"""Patch v3 — unblock touch handling for NPCTalkLayer (Eva dialog).

Root cause: GuideLayer::ccTouchBegan intercepts ALL touches when guide is active.
Because showMaskLayer/hideMaskLayer/etc. are no-opped, the guide state machine
never advances, so ccTouchBegan stays in "consume all touches" mode forever.

Fixes:
1. GuideLayer::ccTouchBegan @ 0x48d1e4 → always return false (4-byte: MOVS R0,#0; BX LR)
   This passes ALL touches through to layers beneath.
2. NPCTalkLayer::showNextDialog @ 0x4e90d3 → tail-call to onDialogEnded (2-byte B)
   Any tap that tries to advance the dialog instead ends it immediately.
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

# 4-byte patches
RETURN_FALSE = bytes([0x00, 0x20, 0x70, 0x47])  # MOVS R0,#0; BX LR
RETURN_TRUE  = bytes([0x01, 0x20, 0x70, 0x47])  # MOVS R0,#1; BX LR
PATCHES_4 = [
    (0x48d1e4, "GuideLayer::ccTouchBegan → return false", RETURN_FALSE),
]

# showNextDialog → tail-call onDialogEnded (2-byte unconditional branch)
# onDialogEnded is at 0x4e89ed
# Thumb B encoding: E0 | ((offset_halfwords & 0x7FF) << 0) in bits [15:11]=11100, bits[10:0]=signed_offset11
on_dialog_ended = 0x4e89ed
show_next_vaddr = 0x4e90d3
halfword_offset = (on_dialog_ended - (show_next_vaddr + 4)) // 2
if not (-1024 <= halfword_offset < 1024):
    raise ValueError(f"B offset {halfword_offset} out of ±1024 range")
offset11 = halfword_offset & 0x7FF
b_instr = 0xE000 | offset11
B_TAILCALL = bytes([b_instr & 0xFF, (b_instr >> 8) & 0xFF])
PATCHES_2.append((show_next_vaddr, f"NPCTalkLayer::showNextDialog → B onDialogEnded (off={halfword_offset})"))

NEW_2 = bytes([0x70, 0x47])  # BX LR

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
    if off is None:
        print(f"[-] {name} @ 0x{addr:08x}: not in PT_LOAD; skip")
        continue
    orig = bytes(data[off:off+2])
    patch_bytes = NEW_2
    if "showNextDialog" in name:
        patch_bytes = B_TAILCALL
    print(f"[+] {name} @ 0x{addr:08x}: {orig.hex(' ')} -> {patch_bytes.hex(' ')}")
    data[off:off+len(patch_bytes)] = patch_bytes

# Apply 4-byte patches
for vaddr, name, new_bytes in PATCHES_4:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    if off is None:
        print(f"[-] {name} @ 0x{addr:08x}: not in PT_LOAD; skip")
        continue
    orig = bytes(data[off:off+4])
    print(f"[+] {name} @ 0x{addr:08x}: {orig.hex(' ')} -> {new_bytes.hex(' ')}")
    data[off:off+4] = new_bytes

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT} ({len(data)} bytes)")
print(f"\n# B-encoded: 0x{show_next_vaddr:08x} → 0x{on_dialog_ended:08x} offset={halfword_offset} halfwords")
print(f"# B instruction bytes: {B_TAILCALL.hex(' ')}")

# Verify
with open(OUTPUT, "rb") as f:
    vdata = f.read()
print("\n[*] Verification:")
for vaddr, name in PATCHES_2:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    byt = bytes(vdata[off:off+2])
    exp = NEW_2
    if "showNextDialog" in name:
        exp = B_TAILCALL
    ok = "OK" if byt == exp else f"FAIL (expected {exp.hex(' ')})"
    print(f"  {name}: {byt.hex(' ')} {ok}")
for vaddr, name, new_bytes in PATCHES_4:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    byt = bytes(vdata[off:off+4])
    ok = "OK" if byt == new_bytes else f"FAIL (expected {new_bytes.hex(' ')})"
    print(f"  {name}: {byt.hex(' ')} {ok}")
