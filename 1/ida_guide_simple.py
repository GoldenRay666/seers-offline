import idaapi, idautils, idc, ida_bytes

f = open('c:/javatools/1/ida_guide_out.txt', 'w')

# 1. disasm showMaskLayer
ea = 0x597784
fn = idaapi.get_func(ea)
if fn:
    f.write(f"=== showMaskLayer {fn.start_ea:#x}-{fn.end_ea:#x} ===\n")
    for h in idautils.Heads(fn.start_ea, fn.end_ea):
        f.write(f"  {h:#x}: {idc.generate_disasm_line(h, 0)}\n")
    f.write("\nXrefs to showMaskLayer:\n")
    for xr in idautils.XrefsTo(fn.start_ea):
        cf = idaapi.get_func(xr.frm)
        cn = idc.get_name(cf.start_ea) if cf else '?'
        f.write(f"  from {xr.frm:#x} in {cn}\n")

# 2. disasm beginGuide
ea = 0x5818d4
fn = idaapi.get_func(ea)
if fn:
    f.write(f"\n=== beginGuide {fn.start_ea:#x}-{fn.end_ea:#x} ===\n")
    for h in idautils.Heads(fn.start_ea, fn.end_ea):
        f.write(f"  {h:#x}: {idc.generate_disasm_line(h, 0)}\n")

# 3. Find GameGuideManager and related classes
f.write("\n=== Guide symbols ===\n")
for ea, name in idautils.Names():
    if 'Guide' in name and ('Mask' in name or 'mask' in name or 'Layer' in name or 'Manager' in name or 'Step' in name or 'Arrow' in name or 'Touch' in name or 'Dialog' in name or 'Window' in name or 'Finger' in name):
        fn = idaapi.get_func(ea)
        sz = fn.end_ea - fn.start_ea if fn else 0
        f.write(f"  {name} at {ea:#x} size={sz}\n")

# 4. Find CCLayerColor::setOpacity
f.write("\n=== CCLayerColor members ===\n")
for ea, name in idautils.Names():
    if 'CCLayerColor' in name:
        f.write(f"  {name} at {ea:#x}\n")

f.write("\nDone.\n")
f.close()
idc.qexit(0)
