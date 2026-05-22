"""Patch v5 — auto-dismiss NPCTalkLayer on any tap (keep v2 baseline).

v4's 1-byte ccTouchBegan patch didn't work — my disassembly analysis was wrong
about which code path executes during Eva dialog. Instead of further guesswork
on GuideLayer touch routing, go directly to NPCTalkLayer:

Patch NPCTalkLayer::showNextDialog @ 0x4e90d3 to tail-call onDialogEnded @ 0x4e89ed.
Any tap on the dialog → showNextDialog → B onDialogEnded → dialog closes.

If this STILL breaks pet selection: redo with NPCTalkLayer::ccTouchBegan patched
to immediately call onDialogEnded + return true (only when touched).
"""
import struct

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.prepatch_guide_v3"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

# 2-byte patches
PATCHES_2 = [
    (0x48d9f2, "GuideLayer::hideMaskLayer"),
    (0x48da0e, "GuideLayer::showMaskLayer"),
    (0x48da2a, "GuideLayer::hideDialogNode"),
    (0x48da3a, "GuideLayer::showDialogNode"),
]
NEW_2 = bytes([0x70, 0x47])

# showNextDialog → tail-call onDialogEnded (2-byte Thumb B)
on_dialog_ended = 0x4e89ed
show_next_vaddr = 0x4e90d3
halfword_offset = (on_dialog_ended - (show_next_vaddr + 4)) // 2
if not (-1024 <= halfword_offset < 1024):
    raise ValueError(f"B offset {halfword_offset} out of range")
b_instr = 0xE000 | (halfword_offset & 0x7FF)
B_TAILCALL = bytes([b_instr & 0xFF, (b_instr >> 8) & 0xFF])
PATCHES_2.append((show_next_vaddr, f"NPCTalkLayer::showNextDialog → B onDialogEnded (off={halfword_offset})"))

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

for vaddr, name in PATCHES_2:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    if off is None:
        print(f"[-] {name}: not in PT_LOAD"); continue
    patch_bytes = NEW_2
    if "showNextDialog" in name:
        patch_bytes = B_TAILCALL
    o = bytes(data[off:off+len(patch_bytes)])
    print(f"[+] {name} @ 0x{addr:08x}: {o.hex(' ')} -> {patch_bytes.hex(' ')}")
    data[off:off+len(patch_bytes)] = patch_bytes

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT} ({len(data)} bytes)")

# Verify
with open(OUTPUT, "rb") as f:
    vdata = f.read()
for vaddr, name in PATCHES_2:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    exp = NEW_2
    if "showNextDialog" in name:
        exp = B_TAILCALL
    byt = bytes(vdata[off:off+len(exp)])
    ok = "OK" if byt == exp else f"FAIL (exp {exp.hex(' ')})"
    print(f"  verify {name}: {byt.hex(' ')} {ok}")
