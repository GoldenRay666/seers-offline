"""Strip 哈哈哈 placeholder from dialog.plist (and the .ccbi guide layouts).

dialog.plist is mostly GBK-encoded but has 23 UTF-8 '哈哈哈' (e5 93 88 x3) sequences
inserted as placeholders. Replacing each with empty bytes leaves valid GBK around them.

For the .ccbi files, we replace each 哈哈哈 (9 bytes) with 9 zero bytes — CCBI is a
binary format with length-prefixed strings, so we keep the length-fields intact and
just blank the content.
"""
import os, shutil

TARGETS = [
    r"C:\javatools\1\assets\Data\dialog.plist",
    r"C:\javatools\1\assets\UI\ccbi\GuideLayer.ccbi",
    r"C:\javatools\1\assets\UI\ccbi\NPCTalkLayer.ccbi",
]

PLACEHOLDER = "哈哈哈".encode("utf-8")  # 9 bytes: e5 93 88 e5 93 88 e5 93 88

for path in TARGETS:
    if not os.path.exists(path):
        print(f"[-] missing: {path}")
        continue
    with open(path, "rb") as f:
        data = f.read()
    cnt = data.count(PLACEHOLDER)
    if cnt == 0:
        print(f"[=] no '哈哈哈' in {path}")
        continue
    # backup once
    bk = path + ".pre_haha_clean"
    if not os.path.exists(bk):
        shutil.copy2(path, bk)
        print(f"[+] backup: {bk}")
    if path.endswith(".plist"):
        # XML — replacing with empty bytes shrinks file but XML is fine
        new = data.replace(PLACEHOLDER, b"")
    else:
        # CCBI binary — preserve length, replace bytes with NUL (or space). Use space (0x20) so
        # rendering shows blank instead of zero-byte breaking the string parser.
        new = data.replace(PLACEHOLDER, b" " * 9)
    with open(path, "wb") as f:
        f.write(new)
    print(f"[+] {path}: replaced {cnt}x '哈哈哈' "
          f"(orig {len(data)} -> {len(new)} bytes)")
print("\n[*] Done. Push assets to device or rebuild APK as needed.")
print("[*] Note: assets are inside the APK — for runtime testing, push to:")
print("    /data/data/com.taomee.seers/files/  OR rebuild APK")
