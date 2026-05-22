import idaapi, idautils, idc, ida_bytes, ida_xref

out = open('C:/javatools/1/ida_guide_deep.txt', 'w')

# Known addresses from prior analysis
KNOWN = {
    'showMaskLayer': 0x597784,
    'beginGuide': 0x5818d4,
    'GameOpenAssignFunctionManager_ctor': 0x5974fc,
}

out.write("=== Guide Deep Analysis ===\n\n")

# 1. Look for all symbols with guide/Guide/guide in name
out.write("=== Guide-related symbols ===\n")
found_guide = []
for i, (ea, name) in enumerate(idautils.Names()):
    if any(kw in name for kw in ['guide', 'Guide', 'GuideLayer', 'GuideManager',
                                   'maskLayer', 'MaskLayer', 'beginGuide',
                                   'GameOpenAssign', 'OpenFunction',
                                   'isNeedUnlock', 'showGuide', 'guideStep',
                                   'm_mask', 'setOpacity']):
        fn = idaapi.get_func(ea)
        size = idc.get_func_attr(ea, idc.FUNCATTR_END) - idc.get_func_attr(ea, idc.FUNCATTR_START) if fn else 0
        found_guide.append((name, ea, size))
        out.write(f"  {name} at {ea:#x} size={size}\n")

out.write(f"\nTotal guide-related symbols: {len(found_guide)}\n\n")

# 2. Analyze showMaskLayer at 0x597784
out.write("=== showMaskLayer (0x597784) ===\n")
fn = idaapi.get_func(0x597784)
if fn:
    out.write(f"Function: {fn.start_ea:#x} - {fn.end_ea:#x} ({fn.end_ea - fn.start_ea} bytes)\n")
    for h in idautils.Heads(fn.start_ea, min(fn.start_ea + 0x60, fn.end_ea)):
        out.write(f"  {h:#x}: {idc.generate_disasm_line(h, 0)}\n")

    # Find xrefs (who calls this)
    out.write("\nXrefs to showMaskLayer:\n")
    for xref in idautils.XrefsTo(fn.start_ea):
        caller = idaapi.get_func(xref.frm)
        cname = idc.get_name(caller.start_ea) if caller else 'unknown'
        out.write(f"  Called from {xref.frm:#x} in {cname}\n")

    # Find calls from this function
    out.write("\nCalls from showMaskLayer:\n")
    for h in idautils.Heads(fn.start_ea, fn.end_ea):
        for xref in idautils.XrefsFrom(h):
            tgt_name = idc.get_name(xref.to)
            if tgt_name:
                out.write(f"  {h:#x}: calls {tgt_name} ({xref.to:#x})\n")

# 3. Analyze beginGuide function
out.write("\n=== beginGuide (0x5818d4) ===\n")
fn = idaapi.get_func(0x5818d4)
if fn:
    out.write(f"Function: {fn.start_ea:#x} - {fn.end_ea:#x}\n")
    for h in idautils.Heads(fn.start_ea, min(fn.start_ea + 0x60, fn.end_ea)):
        out.write(f"  {h:#x}: {idc.generate_disasm_line(h, 0)}\n")

    out.write("\nXrefs to beginGuide:\n")
    for xref in idautils.XrefsTo(fn.start_ea):
        caller = idaapi.get_func(xref.frm)
        cname = idc.get_name(caller.start_ea) if caller else 'unknown'
        out.write(f"  Called from {xref.frm:#x} in {cname}\n")

# 4. Look for CCBI loading functions (GuideLayer.ccbi)
out.write("\n=== CCBI/GuideLayer loading ===\n")
for i, (ea, name) in enumerate(idautils.Names()):
    if 'CCB' in name or 'ccbi' in name:
        if 'Guide' in name or 'guide' in name or 'Layer' in name:
            out.write(f"  {name} at {ea:#x}\n")

# 5. Look for cocos2d layer creation - CCLayerColor init/setOpacity
out.write("\n=== CCLayerColor functions ===\n")
for i, (ea, name) in enumerate(idautils.Names()):
    if 'CCLayerColor' in name:
        fn = idaapi.get_func(ea)
        size = idc.get_func_attr(ea, idc.FUNCATTR_END) - idc.get_func_attr(ea, idc.FUNCATTR_START) if fn else 0
        out.write(f"  {name} at {ea:#x} size={size}\n")

# 6. Search for the string "GuideLayer" or similar
out.write("\n=== String search ===\n")
for seg in idautils.Segments():
    segname = idc.get_segm_name(seg)
    if 'rodata' in segname or 'data' in segname:
        seg_start = idc.get_segm_start(seg)
        seg_end = idc.get_segm_end(seg)
        out.write(f"Scanning {segname}: {seg_start:#x} - {seg_end:#x}\n")
        # Search for common guide-related strings
        for s in ['GuideLayer', 'guide', 'mask', 'Mask', 'Guide']:
            ea = ida_bytes.bin_search(seg_start, seg_end, s.encode() + b'\x00',
                                       ida_bytes.BIN_SEARCH_FORWARD,
                                       ida_bytes.BIN_SEARCH_CASE_SENSITIVE)
            if ea != idaapi.BADADDR:
                out.write(f"  Found '{s}' at {ea:#x}\n")
                # Check xrefs to this string
                for xref in idautils.XrefsTo(ea):
                    fn = idaapi.get_func(xref.frm)
                    if fn:
                        out.write(f"    Referenced from {xref.frm:#x} in {idc.get_name(fn.start_ea)} ({fn.start_ea:#x})\n")

out.close()
idc.qexit(0)
