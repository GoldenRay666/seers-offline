import idaapi, idc, idautils, re
idaapi.auto_wait()

# SpriteSeerListener::HandleLayerDeactiveEvent (0x563444)
print("=== HandleLayerDeactiveEvent (0x563444) ===")
fn = idaapi.get_func(0x563444)
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
        if "CMP" in line or "CBZ" in line: print("      *** CHECK ***")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea: break

# SpriteOtherSeerListener::HandleLayerUpdateEvent (0x56308a)
print("\n=== HandleLayerUpdateEvent (SpriteOtherSeerListener) (0x56308a) ===")
fn2 = idaapi.get_func(0x56308a)
if fn2:
    cur = fn2.start_ea
    for _ in range(30):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "BL " in line:
            m = re.search(r'BL\s+(0x[0-9A-Fa-f]+)', line)
            if m:
                t = int(m.group(1), 16)
                tn = idc.get_func_name(t)
                if tn: print(f"    -> {tn}")
        cur = idc.next_head(cur, fn2.end_ea)
        if cur >= fn2.end_ea: break

# Also check: when is HandleLayerDeactiveEvent CALLED?
print("\n=== Who calls HandleLayerDeactiveEvent? ===")
for xr in idautils.XrefsTo(fn.start_ea):
    cfn = idaapi.get_func(xr.frm)
    cn = idc.get_func_name(xr.frm) if cfn else "?"
    print(f"  Called from {xr.frm:#x} ({cn})")

idaapi.qexit(0)
