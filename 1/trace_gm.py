import idaapi, idc, idautils, re
idaapi.auto_wait()

# GameManager::getSpriteSeer (0x473022) - does it check for NULL SceneLayer?
print("=== GameManager::getSpriteSeer (around 0x473022) ===")
fn = idaapi.get_func(0x473022)
if fn:
    cur = fn.start_ea
    for _ in range(25):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "CMP" in line and "#0" in line: print("      *** NULL CHECK ***")
        if "BL " in line:
            m = re.search(r'BL\s+(0x[0-9A-Fa-f]+)', line)
            if m:
                t = int(m.group(1), 16)
                tn = idc.get_func_name(t)
                if tn: print(f"    -> {tn}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea: break
    print(f"  XREFs:")
    for xr in idautils.XrefsTo(fn.start_ea):
        cfn = idaapi.get_func(xr.frm)
        cn = idc.get_func_name(xr.frm) if cfn else "?"
        print(f"    {xr.frm:#x} ({cn})")

# GameManager::pauseCurrentScene (0x47303e) - also calls SceneLayer::getSpriteSeer
print("\n=== GameManager::pauseCurrentScene (around 0x47303e) ===")
fn2 = idaapi.get_func(0x47303e)
if fn2:
    cur = fn2.start_ea
    for _ in range(25):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "CMP" in line and "#0" in line: print("      *** NULL CHECK ***")
        cur = idc.next_head(cur, fn2.end_ea)
        if cur >= fn2.end_ea: break

# handleAckMsgGetMapUnlockedList (0x631416) - calls getTranspoints
print("\n=== handleAckMsgGetMapUnlockedList (around 0x631416) ===")
fn3 = idaapi.get_func(0x631416)
if fn3:
    cur = fn3.start_ea
    for _ in range(30):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "BL " in line:
            m = re.search(r'BL\s+(0x[0-9A-Fa-f]+)', line)
            if m:
                t = int(m.group(1), 16)
                tn = idc.get_func_name(t)
                if tn: print(f"    -> {tn}")
        if "CMP" in line and "#0" in line: print("      *** NULL CHECK ***")
        cur = idc.next_head(cur, fn3.end_ea)
        if cur >= fn3.end_ea: break

# Look for MessageHandler functions that call getSpriteSeer or involve scene transition
# Search for functions that reference both MessageHandler and LevelLayer
print("\n=== Functions referencing SceneLayer::getSpriteSeer from MessageHandler area ===")
for xr in idautils.XrefsTo(0x4862e8):  # SceneLayer::getSpriteSeer
    cfn = idaapi.get_func(xr.frm)
    cn = idc.get_func_name(xr.frm) if cfn else "?"
    if 'MessageHandler' in cn and 'handle' in cn.lower():
        print(f"  Handler: {cn} at {cfn.start_ea:#x}")

idaapi.qexit(0)
