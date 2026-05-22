"""Patch ARM: ONLY quest-related guide functions."""
import struct

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.arm_working"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES = [
    (0x46f97c, "guideWalkToEva"),
    (0x46f92e, "guideTakeQuest"),
    (0x46f6ba, "guideSubmitQuest"),
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
for vaddr, name in PATCHES:
    addr = vaddr & ~1
    off = v2f(phs, addr)
    o = bytes(data[off:off+2])
    print(f"[+] {name} @ 0x{addr:08x}: {o.hex(' ')} -> 70 47")
    data[off:off+2] = NEW_2
with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT}")
