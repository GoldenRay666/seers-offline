import idaapi, idc, idautils, re
idaapi.auto_wait()

# SceneLayer::getSpriteSeer — does it check for NULL this?
print("=== SceneLayer::getSpriteSeer (0x4862f2 area) ===")
fn = idaapi.get_func(0x4862f2)
if fn:
    cur = fn.start_ea
    for _ in range(25):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea: break
    print(f"  XREFs:")
    for xr in idautils.XrefsTo(fn.start_ea):
        cfn = idaapi.get_func(xr.frm)
        cn = idc.get_func_name(xr.frm) if cfn else "?"
        print(f"    {xr.frm:#x} ({cn})")

# What calls LevelManager::getCurrentLevelLayer?
print("\n=== Who calls LevelManager::getCurrentLevelLayer? ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'getCurrentLevelLayer' in name:
            print(f"  {name} at {ea:#x}")
            for xr in idautils.XrefsTo(ea):
                cfn = idaapi.get_func(xr.frm)
                cn = idc.get_func_name(xr.frm) if cfn else "?"
                print(f"    Called from {xr.frm:#x} ({cn})")

# What is called RIGHT AFTER the select_main_mon_out handler dispatch?
# Look at what functions are near the BLX R3 dispatch point
print("\n=== Flow after BLX R3 dispatch ===")
# At 0x632a98 the handler is called, then 0x632a9c postHandleMsg
# What triggers the scene transition?
# Search for GameManager/SceneLayer functions called from handlers
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'LevelManager' in name and 'Scene' in name:
            print(f"  {name} at {ea:#x}")
        if 'changeMap' in name.lower() or 'enterMap' in name.lower() or 'enterWorld' in name.lower() or 'startGame' in name.lower():
            print(f"  {name} at {ea:#x}")

# Find the select_main_mon handler by checking ALL MessageHandler::handle* functions
print("\n=== Searching for any select_main_mon handler ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'MessageHandler' in name and 'handle' in name.lower():
            # Dump the first few instructions to see if they access mon_info
            fn = idaapi.get_func(ea)
            cur = fn.start_ea
            bl_targets = []
            for _ in range(30):
                line = idc.generate_disasm_line(cur, 0)
                if 'BL ' in line:
                    m = re.search(r'BL\s+(0x[0-9A-Fa-f]+)', line)
                    if m:
                        t = int(m.group(1), 16)
                        tn = idc.get_func_name(t)
                        if tn and 'mon_info' in tn.lower():
                            print(f"\n  {name} at {ea:#x} references mon_info!")
                            bl_targets.append(tn)
                cur = idc.next_head(cur, fn.end_ea)
                if cur >= fn.end_ea: break
            if bl_targets:
                print(f"    mon_info calls: {bl_targets}")

idaapi.qexit(0)
