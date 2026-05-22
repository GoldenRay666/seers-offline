"""Patch ARM v2 — only kill GameOpenAssignFunctionManager::processGuide.

processGuide @ 0x477048 → B endGuide (0x476a30)
Keeps GameGuideManager::processGuide intact for character creation.
"""
import struct

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.arm_working"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES_2 = [
    (0x46f97c, "GameGuideManager::guideWalkToEva"),
]
NEW_2 = bytes([0x70, 0x47])

# GameOpenAssignFunctionManager::processGuide → B endGuide
# offset = (0x476a30 - (0x477048 + 4)) / 2 = -0x30E = -782
# B = 0xE000 | 0x4F2 = 0xE4F2 → bytes F2 E4
GOAF_PROCESS_TO_END = bytes([0xF2, 0xE4])

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

pg_addr = 0x477048
pg_off = v2f(phs, pg_addr)
o = bytes(data[pg_off:pg_off+2])
print(f"[+] GOAF::processGuide @ 0x{pg_addr:08x}: {o.hex(' ')} -> f2 e4 (B endGuide)")
data[pg_off:pg_off+2] = GOAF_PROCESS_TO_END

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT}")
