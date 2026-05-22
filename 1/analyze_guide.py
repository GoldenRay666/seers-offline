import idaapi, idautils, idc, ida_bytes

out = open('C:/javatools/1/guide_analysis.txt', 'w')

# 1. Find insertGuideFunc in .symtab
out.write("=== insertGuideFunc symbols ===\n")
for i, ea in enumerate(idautils.Names()):
    name = idc.get_name(ea)
    if 'insertGuideFunc' in name:
        out.write(f"{name} at {ea:#x}\n")
        fn = idaapi.get_func(ea)
        if fn:
            out.write(f"  Function: {fn.start_ea:#x} - {fn.end_ea:#x}\n")
            for h in idautils.Heads(fn.start_ea, min(fn.start_ea + 0x30, fn.end_ea)):
                out.write(f"  {h:#x}: {idc.generate_disasm_line(h, 0)}\n")

# 2. Find all guide step names (methods with 'guide' in them)
out.write("\n=== GameGuideManager methods ===\n")
for i, ea in enumerate(idautils.Names()):
    name = idc.get_name(ea)
    if 'GameGuideManager' in name and ('guide' in name.lower() or 'Guide' in name):
        fn = idaapi.get_func(ea)
        size = idc.get_func_attr(ea, idc.FUNCATTR_END) - idc.get_func_attr(ea, idc.FUNCATTR_START) if fn else 0
        out.write(f"{name} at {ea:#x} size={size}\n")

# 3. Find who calls insertGuideFunc (xrefs)
out.write("\n=== insertGuideFunc xrefs ===\n")
for ea in idautils.Names():
    name = idc.get_name(ea)
    if 'insertGuideFunc' in name and not 'FieldNumber' in name:
        fn = idaapi.get_func(ea)
        if fn:
            for xref in idautils.XrefsTo(fn.start_ea):
                out.write(f"Called from {xref.frm:#x}: {idc.generate_disasm_line(xref.frm, 0)}\n")
                caller = idaapi.get_func(xref.frm)
                if caller:
                    out.write(f"  In function: {idc.get_name(caller.start_ea)} at {caller.start_ea:#x}\n")

out.close()
idc.qexit(0)
