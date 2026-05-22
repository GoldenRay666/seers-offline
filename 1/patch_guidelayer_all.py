"""Comprehensive patch: BX LR all GuideLayer side-effect methods that trigger Houdini SIGSEGV.

These all crash inside libhoudini's ARM-to-x86 translator when their virtual-call
patterns are encountered. Skip constructor/destructor/CCB callbacks/touch handlers
which the game framework needs to function.

All addresses from ida_guide_out.txt (libgame_logic.so).
"""
import struct, os, shutil

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

# (vaddr, name) — all from IDA listing, all Thumb functions
# Patching to BX LR (70 47) makes them no-ops.
PATCHES = [
    (0x48d9f2, "hideMaskLayer"),
    (0x48da0e, "showMaskLayer"),
    (0x48da2a, "hideDialogNode"),
    (0x48da3a, "showDialogNode"),
    (0x48da4c, "moveDialogNodeToTop"),
    (0x48dab8, "moveDialogNodeToCenter"),
    (0x48db22, "moveDialogNodeToBottom"),
    (0x48db8c, "addGuideArrow"),
    (0x48de24, "addMoveScrollViewGudieHand"),
    (0x48e010, "addCaptureGuideHand"),
    (0x48e234, "setDialog"),
    (0x48d9e0, "clearContentNode"),
    (0x48d9ca, "addObjectToContentNode"),
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

if not os.path.exists(INPUT + ".prepatch_guide_v3"):
    shutil.copy2(INPUT, INPUT + ".prepatch_guide_v3")
    print(f"[+] backup: {INPUT}.prepatch_guide_v3")

for vaddr, name in PATCHES:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    if off is None:
        print(f"[-] {name} @ 0x{addr:08x}: not in PT_LOAD; skip")
        continue
    orig = bytes(data[off:off+2])
    if orig == NEW:
        print(f"[=] {name} @ 0x{addr:08x}: already 70 47")
        continue
    print(f"[+] {name} @ 0x{addr:08x} (file 0x{off:08x}): {orig.hex(' ')} -> 70 47")
    data[off+0] = NEW[0]
    data[off+1] = NEW[1]

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT} ({len(data)} bytes)")
