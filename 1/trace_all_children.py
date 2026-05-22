import idaapi, idc, idautils, re
idaapi.auto_wait()

# ALL references to getChildrenByTag (0x55fba0) - code AND data
print("=== ALL XREFs to getChildrenByTag (0x55fba0) ===")
for xr in idautils.XrefsTo(0x55fba0):
    t = "DATA" if xr.type != 0 else "CODE"
    cfn = idaapi.get_func(xr.frm)
    cn = idc.get_func_name(xr.frm) if cfn else "?"
    print(f"  {t} xref from {xr.frm:#x} ({cn})")

# Also check: is getChildrenByTag a VIRTUAL function? (in vtable)
print("\n=== Is getChildrenByTag virtual? ===")
# Look for its address in the data sections (vtable entries)
for seg in idautils.Segments():
    seg_name = idc.get_segm_name(seg)
    if 'data' in seg_name.lower() or 'const' in seg_name.lower():
        for head in idautils.Heads(seg, idc.get_segm_end(seg)):
            if idc.get_wide_dword(head) == 0x55fba1:  # Thumb address (+1 for Thumb bit)
                print(f"  Found vtable entry at {head:#x}")
                # What function does this vtable belong to?
                for vxr in idautils.XrefsTo(head):
                    print(f"    Referenced from {vxr.frm:#x}")

# Find what calls LevelManager::getCurrentLevelLayer WITHOUT checking NULL
# These are the dangerous callers
print("\n=== Dangerous patterns: getCurrentLevelLayer callers without proper NULL check ===")
for xr in idautils.XrefsTo(0x560574):  # getCurrentLevelLayer
    cfn = idaapi.get_func(xr.frm)
    cn = idc.get_func_name(xr.frm) if cfn else "?"
    if cfn:
        # Check instructions following the BL for NULL check
        cur = xr.frm
        has_null_check = False
        for _ in range(5):
            cur = idc.next_head(cur, cfn.end_ea)
            if cur >= cfn.end_ea: break
            line = idc.generate_disasm_line(cur, 0)
            if ('CMP' in line or 'SUBS' in line or 'CBZ' in line or 'CBNZ' in line) and ('#0' in line or 'R0' in line):
                has_null_check = True
                break
        if not has_null_check:
            print(f"  NO NULL CHECK: {cn} at {xr.frm:#x}")

idaapi.qexit(0)
