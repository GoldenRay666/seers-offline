import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Dump postHandleMsg (at or near the call site)
# The BL target at 0x632a9c
print("=== Looking for postHandleMsg implementation ===")
# Find the function
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'postHandleMsg' in name:
            print(f"  Found: {name} at {ea:#x}")
            fn = idaapi.get_func(ea)
            cur = fn.start_ea
            for _ in range(60):
                line = idc.generate_disasm_line(cur, 0)
                print(f"    {cur:#x}: {line}")
                if "BL " in line or "BLX" in line:
                    m = re.search(r'B(LX?)\s+(\S+)', line)
                    if m:
                        t = m.group(2)
                        if not t.startswith('R'):
                            fn_name = idc.get_func_name(int(t, 16)) if t.startswith('0x') else t
                            print(f"      -> {t} ({fn_name})")
                cur = idc.next_head(cur, fn.end_ea)
                if cur >= fn.end_ea:
                    break

# Also dump SpriteSeerListener::HandleObjectMoveEvent (0x563322)
# which calls getFollowSprite and getWildSprites
print("\n\n=== SpriteSeerListener::HandleObjectMoveEvent (0x563322) ===")
fn2 = idaapi.get_func(0x563322)
if fn2:
    cur = fn2.start_ea
    for _ in range(40):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "BL " in line or "BLX" in line:
            m = re.search(r'B(LX?)\s+(\S+)', line)
            if m:
                t = m.group(2)
                if not t.startswith('R'):
                    fn_name = idc.get_func_name(int(t, 16)) if t.startswith('0x') else t
                    if fn_name:
                        print(f"    -> {fn_name}")
        cur = idc.next_head(cur, fn2.end_ea)
        if cur >= fn2.end_ea:
            break

# Also check GameOpenAssignFunctionManager::initProgress (0x478ba2)
print("\n\n=== GameOpenAssignFunctionManager::initProgress (0x478ba2) ===")
fn3 = idaapi.get_func(0x478ba2)
if fn3:
    cur = fn3.start_ea
    for _ in range(50):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "BL " in line or "BLX" in line:
            m = re.search(r'B(LX?)\s+(\S+)', line)
            if m:
                t = m.group(2)
                if not t.startswith('R'):
                    fn_name = idc.get_func_name(int(t, 16)) if t.startswith('0x') else t
                    if fn_name:
                        print(f"    -> {fn_name}")
        cur = idc.next_head(cur, fn3.end_ea)
        if cur >= fn3.end_ea:
            break

idaapi.qexit(0)
