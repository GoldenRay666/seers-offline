"""Patch GuideLayer::showMaskLayer in libgame_logic.so to immediately return (BX LR).

Thumb-mode entry virtual address: 0x48da0e (from frida_spawn_v2.py & matches tombstone showMaskLayer+9 @ 0x0448da18).
Replace the 2 bytes at file offset corresponding to 0x48da0e with 0x70 0x47 (BX LR in Thumb).

Verifies original bytes look like a function prologue first.
"""
import struct, sys, os, shutil

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so"
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"
TARGET_VADDR = 0x48da0e   # Thumb entry
NEW_BYTES = bytes([0x70, 0x47])  # BX LR (Thumb)

# ---- Parse ELF to compute file offset for vaddr ----
def parse_elf32_program_headers(data):
    if data[:4] != b"\x7fELF":
        raise ValueError("not ELF")
    ei_class = data[4]
    if ei_class != 1:
        raise ValueError(f"Not ELF32 (class={ei_class})")
    e_phoff   = struct.unpack_from("<I", data, 0x1c)[0]
    e_phentsz = struct.unpack_from("<H", data, 0x2a)[0]
    e_phnum   = struct.unpack_from("<H", data, 0x2c)[0]
    phs = []
    for i in range(e_phnum):
        off = e_phoff + i * e_phentsz
        p_type, p_offset, p_vaddr, p_paddr, p_filesz, p_memsz, p_flags, p_align = \
            struct.unpack_from("<IIIIIIII", data, off)
        phs.append({"type": p_type, "offset": p_offset, "vaddr": p_vaddr,
                    "filesz": p_filesz, "flags": p_flags})
    return phs

def vaddr_to_file_offset(phs, vaddr):
    for ph in phs:
        if ph["type"] != 1:  # PT_LOAD
            continue
        if ph["vaddr"] <= vaddr < ph["vaddr"] + ph["filesz"]:
            return vaddr - ph["vaddr"] + ph["offset"]
    return None

with open(INPUT, "rb") as f:
    data = bytearray(f.read())

phs = parse_elf32_program_headers(data)
print(f"[*] PT_LOAD segments:")
for ph in phs:
    if ph["type"] == 1:
        print(f"    vaddr=0x{ph['vaddr']:08x} offset=0x{ph['offset']:08x} "
              f"size=0x{ph['filesz']:x} flags=0x{ph['flags']:x}")

# 0x48da0e is Thumb (LSB set) — physical instruction at 0x48da0e (clear bit 0)
phys_vaddr = TARGET_VADDR & ~1
file_off = vaddr_to_file_offset(phs, phys_vaddr)
if file_off is None:
    print(f"[-] Could not find PT_LOAD covering 0x{phys_vaddr:08x}")
    sys.exit(1)

orig = bytes(data[file_off:file_off+8])
print(f"[*] vaddr 0x{phys_vaddr:08x} -> file offset 0x{file_off:08x}")
print(f"[*] original 8 bytes at offset: {orig.hex(' ')}")

if data[file_off:file_off+2] == NEW_BYTES:
    print("[!] Already patched (first 2 bytes are BX LR). Aborting.")
    sys.exit(0)

# Verify it looks like a function prologue (Thumb push of LR + saved regs is common)
# Common Thumb prologue: B5 ?? (PUSH {..., LR})
if data[file_off+1] == 0xB5:
    print(f"[+] Looks like a Thumb function prologue (PUSH ..LR), good")
elif data[file_off+1] == 0xB0 or data[file_off+1] == 0x4F:
    print(f"[+] Looks like Thumb prologue variant, good")
else:
    print(f"[!] First instruction byte 0x{data[file_off+1]:02x} not a typical Thumb prologue")
    print(f"[!] Continuing anyway — known target from KNOWN_INFO + tombstone.")

# Backup if not exists
if not os.path.exists(INPUT + ".prepatch_guide"):
    shutil.copy2(INPUT, INPUT + ".prepatch_guide")
    print(f"[+] backup saved: {INPUT}.prepatch_guide")

# Apply patch
data[file_off+0] = NEW_BYTES[0]
data[file_off+1] = NEW_BYTES[1]
print(f"[+] patched bytes -> {NEW_BYTES.hex(' ')} (BX LR)")

with open(OUTPUT, "wb") as f:
    f.write(data)
print(f"[+] wrote {OUTPUT} ({len(data)} bytes)")

# Verify
with open(OUTPUT, "rb") as f:
    f.seek(file_off)
    chk = f.read(2)
print(f"[*] verification: bytes at offset 0x{file_off:08x} = {chk.hex(' ')} {'OK' if chk == NEW_BYTES else 'FAIL'}")
