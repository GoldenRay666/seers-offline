"""Patch BOTH GuideLayer::showMaskLayer AND hideMaskLayer to immediately return (BX LR).

Discovered via tombstones:
- showMaskLayer @ 0x48da0e (Thumb)  — patched in patch_showmask.py
- hideMaskLayer @ 0x48d9fc (Thumb)  — newly discovered crash in same Houdini bug pattern

Both replaced with `70 47` (BX LR Thumb) so they no-op.
"""
import struct, os, shutil

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES = [
    {"name": "showMaskLayer", "vaddr": 0x48da0e},
    {"name": "hideMaskLayer", "vaddr": 0x48d9fc},
]
NEW_BYTES = bytes([0x70, 0x47])  # Thumb: BX LR

def parse_elf32_program_headers(data):
    if data[:4] != b"\x7fELF":
        raise ValueError("not ELF")
    e_phoff   = struct.unpack_from("<I", data, 0x1c)[0]
    e_phentsz = struct.unpack_from("<H", data, 0x2a)[0]
    e_phnum   = struct.unpack_from("<H", data, 0x2c)[0]
    phs = []
    for i in range(e_phnum):
        off = e_phoff + i * e_phentsz
        p_type, p_offset, p_vaddr, p_paddr, p_filesz, p_memsz, p_flags, p_align = \
            struct.unpack_from("<IIIIIIII", data, off)
        if p_type == 1:
            phs.append({"offset": p_offset, "vaddr": p_vaddr, "filesz": p_filesz})
    return phs

def vaddr_to_file_offset(phs, vaddr):
    for ph in phs:
        if ph["vaddr"] <= vaddr < ph["vaddr"] + ph["filesz"]:
            return vaddr - ph["vaddr"] + ph["offset"]
    return None

with open(INPUT, "rb") as f:
    data = bytearray(f.read())

phs = parse_elf32_program_headers(data)

# Backup if not yet
if not os.path.exists(INPUT + ".prepatch_guide_v2"):
    shutil.copy2(INPUT, INPUT + ".prepatch_guide_v2")
    print(f"[+] backup: {INPUT}.prepatch_guide_v2")

for p in PATCHES:
    vaddr = p["vaddr"] & ~1
    off = vaddr_to_file_offset(phs, vaddr)
    if off is None:
        print(f"[-] {p['name']} vaddr 0x{vaddr:08x} not in any PT_LOAD; skipped")
        continue
    orig = bytes(data[off:off+2])
    if orig == NEW_BYTES:
        print(f"[=] {p['name']} @ 0x{vaddr:08x} already patched (70 47)")
        continue
    print(f"[+] {p['name']} @ 0x{vaddr:08x} (file 0x{off:08x}): {orig.hex(' ')} -> 70 47")
    data[off+0] = NEW_BYTES[0]
    data[off+1] = NEW_BYTES[1]

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT} ({len(data)} bytes)")

# Verify
for p in PATCHES:
    vaddr = p["vaddr"] & ~1
    off = vaddr_to_file_offset(phs, vaddr)
    with open(OUTPUT, "rb") as f:
        f.seek(off)
        chk = f.read(2)
    print(f"[*] {p['name']} verify: {chk.hex(' ')} {'OK' if chk == NEW_BYTES else 'FAIL'}")
