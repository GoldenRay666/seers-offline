"""Final minimal patch — only the 3 confirmed Houdini-crashing GuideLayer functions.

Reverts the beginGuide patches because they break role creation flow.
With ONLY these 3 patches:
  - The Houdini SIGSEGV in showMaskLayer/hideMaskLayer/hideDialogNode is bypassed
  - The guide system still runs (begins normally)
  - showDialogNode/setDialog/etc. remain intact so Dr. Eva dialog can render
  - Role creation should work again

If Dr. Eva dialog is still stuck/un-clickable, that's a separate issue
(GuideLayer touch handling, not Houdini crash).
"""
import struct, os, shutil

INPUT  = r"C:\javatools\1\lib\armeabi\libgame_logic.so.prepatch_guide_v3"  # original snapshot
OUTPUT = r"C:\javatools\1\lib\armeabi\libgame_logic.so.guidepatch"

PATCHES = [
    (0x48d9f2, "GuideLayer::hideMaskLayer"),
    (0x48da0e, "GuideLayer::showMaskLayer"),
    (0x48da2a, "GuideLayer::hideDialogNode"),
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
print(f"[*] base: {INPUT}")

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
print(f"\n# Push to device:")
print(f"  adb -s 127.0.0.1:7555 push {OUTPUT} /data/local/tmp/libgame_logic.so.guidepatch")
print(f"  adb -s 127.0.0.1:7555 shell 'cp /data/local/tmp/libgame_logic.so.guidepatch /data/app/com.taomee.seers-1/lib/arm/libgame_logic.so'")
print(f"  adb -s 127.0.0.1:7555 shell 'am force-stop com.taomee.seers; am start -n com.taomee.seers/com.taomee.seer2.seer2'")
