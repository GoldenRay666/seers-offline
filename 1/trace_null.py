import idaapi, idc, idautils, re
idaapi.auto_wait()

# Check HandleLayerActiveEvent (0x562ba0) - does it check NULL?
print("=== SpriteElfListener::HandleLayerActiveEvent (around 0x562ba0) ===")
fn = idaapi.get_func(0x562ba0)
if fn:
    cur = fn.start_ea
    for _ in range(40):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "BL " in line:
            m = re.search(r'BL\s+(0x[0-9A-Fa-f]+)', line)
            if m:
                t = int(m.group(1), 16)
                tn = idc.get_func_name(t)
                if tn: print(f"    -> {tn}")
        if "CMP" in line and "#0" in line: print("      *** NULL CHECK ***")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea: break

# Check GameOpenAssignFunctionManager::initProgress - where's the getSpriteSeer call?
print("\n=== initProgress around getSpriteSeer call (0x478b90 area) ===")
fn2 = idaapi.get_func(0x478ba2)
if fn2:
    cur = 0x478b70  # Start a bit before
    for _ in range(40):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "BL " in line:
            m = re.search(r'BL\s+(0x[0-9A-Fa-f]+)', line)
            if m:
                t = int(m.group(1), 16)
                tn = idc.get_func_name(t)
                if tn: print(f"    -> {tn}")
        if "CMP" in line and "#0" in line: print("      *** NULL CHECK ***")
        cur = idc.next_head(cur, fn2.end_ea)
        if cur >= fn2.end_ea: break

# Check HandleLayerUpdateEvent (0x562b16, 0x562eca, 0x56308a, 0x5633e8) 
print("\n=== SpriteElfListener::HandleLayerUpdateEvent (0x562b16) ===")
fn3 = idaapi.get_func(0x562b16)
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

# KEY: find all functions called from select_main_mon handler dispatch area
# that DON'T check for NULL LevelLayer
print("\n=== Functions that call LevelLayer::getTranspoints ===")
for xr in idautils.XrefsTo(0x55ffaa):
    cfn = idaapi.get_func(xr.frm)
    cn = idc.get_func_name(xr.frm) if cfn else "?"
    print(f"  {xr.frm:#x} ({cn})")
    if cfn:
        # Show the call context
        c = idc.prev_head(xr.frm, cfn.start_ea)
        for _ in range(5):
            c = idc.prev_head(c, cfn.start_ea)
        for _ in range(10):
            line = idc.generate_disasm_line(c, 0)
            print(f"    {c:#x}: {line}")
            c = idc.next_head(c, cfn.end_ea)
            if c >= cfn.end_ea: break

idaapi.qexit(0)
