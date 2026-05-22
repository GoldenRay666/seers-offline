"""Patch ARM: make processGuide tail-call to endGuide, skipping ALL guide steps.

GameGuideManager::processGuide @ 0x46e700 → B endGuide (0x46e53c)
This ends any guide sequence immediately after it starts.
Keep existing walkToEva + quest patches as well.
"""
import struct

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.arm_quest"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES_2 = [
    (0x46f97c, "guideWalkToEva"),
    (0x46f92e, "guideTakeQuest"),
    (0x46e8ca, "guideQuestCenterDialog"),
    (0x46e918, "guidePressQuestCenter"),
]
NEW_2 = bytes([0x70, 0x47])

# processGuide @ 0x46e700 → B endGuide @ 0x46e53c
# offset = (0x46e53c - (0x46e700 + 4)) / 2 = -0xE4
# B encoding: 0xE000 | (-0xE4 & 0x7FF) = 0xE71C → bytes 1C E7
PROCESS_TO_END = bytes([0x1C, 0xE7])

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

pg_addr = 0x46e700
pg_off = v2f(phs, pg_addr)
o = bytes(data[pg_off:pg_off+2])
print(f"[+] processGuide @ 0x{pg_addr:08x}: {o.hex(' ')} -> {PROCESS_TO_END.hex(' ')} (B endGuide)")
data[pg_off:pg_off+2] = PROCESS_TO_END

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT}")
