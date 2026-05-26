import idaapi, idc, idautils
idaapi.auto_wait()

# Search for "get_bag_mon" string in the binary
target = "get_bag_mon"
print(f"=== Searching for '{target}' ===")

# Search in data segments
for seg in idautils.Segments():
    segname = idc.get_segm_name(seg)
    if "rodata" in segname or "data" in segname:
        seg_end = idc.get_segm_end(seg)
        ea = seg
        while ea < seg_end:
            # Read a string at this address
            s = idc.get_strlit_contents(ea, -1, idc.STRTYPE_C)
            if s and target in s.decode('utf-8', errors='ignore'):
                print(f"  Found at {ea:#x} in {segname}: '{s.decode('utf-8', errors='ignore')}'")
                # Show XREFs to this string
                for xref in idautils.XrefsTo(ea):
                    fn = idc.get_func_name(xref.frm)
                    print(f"    XREF from: {fn} @ {xref.frm:#x}")
            ea = idc.next_head(ea, seg_end)
            if ea == idc.BADADDR:
                break
idaapi.qexit(0)
