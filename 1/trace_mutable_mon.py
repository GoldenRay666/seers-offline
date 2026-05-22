import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Find who calls mutable_mon_info (0x5c91cc) - the key function to extract mon_info from select_main_mon_out
print("=== XREFs to select_main_mon_out::mutable_mon_info (0x5c91cc) ===")
ea = 0x5c91cc
for xr in idautils.XrefsTo(ea):
    fn = idaapi.get_func(xr.frm)
    fn_name = idc.get_func_name(xr.frm) if fn else "?"
    print(f"\n  Called from {xr.frm:#x} ({fn_name})")
    if fn:
        # Show context around the call
        cur = xr.frm
        # Go back 15 instructions
        for _ in range(15):
            cur = idc.prev_head(cur, fn.start_ea)
        for _ in range(30):
            line = idc.generate_disasm_line(cur, 0)
            print(f"    {cur:#x}: {line}")
            if "BL " in line or "BLX" in line:
                m = re.search(r'B(LX?)\s+(\S+)', line)
                if m:
                    t = m.group(2)
                    if not t.startswith('R') and not t.startswith('sub_'):
                        print(f"      -> {t}")
            cur = idc.next_head(cur, fn.end_ea)
            if cur >= fn.end_ea:
                break

# Also find who calls SceneLayer::getSpriteSeer (0x4862f2) - one of the callers
print("\n\n=== XREFs to SceneLayer::getSpriteSeer (0x4862f2) ===")
ea2 = 0x4862f2
for xr in idautils.XrefsTo(ea2):
    fn = idaapi.get_func(xr.frm)
    fn_name = idc.get_func_name(xr.frm) if fn else "?"
    print(f"  Called from {xr.frm:#x} ({fn_name})")
    if fn:
        cur = xr.frm
        for _ in range(8):
            cur = idc.prev_head(cur, fn.start_ea)
        for _ in range(16):
            line = idc.generate_disasm_line(cur, 0)
            print(f"    {cur:#x}: {line}")
            cur = idc.next_head(cur, fn.end_ea)
            if cur >= fn.end_ea:
                break

# Also find GameOpenAssignFunctionManager::initProgress (0x478ba2) - another caller
print("\n\n=== GameOpenAssignFunctionManager::initProgress (0x478ba2) ===")
ea3 = 0x478ba2
fn3 = idaapi.get_func(ea3)
if fn3:
    print(f"  Function: {fn3.start_ea:#x} - {fn3.end_ea:#x}")
    cur = fn3.start_ea
    for _ in range(30):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "BL " in line or "BLX" in line:
            m = re.search(r'B(LX?)\s+(\S+)', line)
            if m:
                t = m.group(2)
                if not t.startswith('R') and not t.startswith('sub_'):
                    print(f"    -> {t}")
        cur = idc.next_head(cur, fn3.end_ea)
        if cur >= fn3.end_ea:
            break

idaapi.qexit(0)
