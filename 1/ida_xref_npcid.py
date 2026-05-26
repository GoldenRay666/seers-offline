import idaapi, idc, idautils
idaapi.auto_wait()
# Find XREFs to getTargetNPCID
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if "getTargetNPCID" in name:
        print(f"=== XREFs to {name} @ {ea:#x} ===")
        for xref in idautils.XrefsTo(ea):
            fn = idc.get_func_name(xref.frm)
            print(f"  From: {fn} @ {xref.frm:#x}")
            # Also show the calling code
            ffn = idaapi.get_func(xref.frm)
            if ffn:
                start = max(ffn.start_ea, xref.frm - 8)
                cur = start
                while cur < min(ffn.end_ea, xref.frm + 12):
                    line = idc.generate_disasm_line(cur, 0)
                    mark = " <--" if cur == xref.frm else ""
                    print(f"    {cur:#x}: {line}{mark}")
                    cur = idc.next_head(cur, min(ffn.end_ea, xref.frm + 12))
idaapi.qexit(0)
