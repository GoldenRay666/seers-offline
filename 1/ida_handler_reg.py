import idaapi, idc, idautils
idaapi.auto_wait()
# Find XREFs to handleAckMsgGetPackSpriteList
target_ea = idc.get_name_ea_simple("_ZN14MessageHandler29handleAckMsgGetPackSpriteListEv")
if target_ea == idc.BADADDR:
    print("Function not found by name")
else:
    print(f"=== XREFs to handleAckMsgGetPackSpriteList @ {target_ea:#x} ===")
    for xref in idautils.XrefsTo(target_ea):
        fname = idc.get_func_name(xref.frm)
        print(f"  From: {fname} @ {xref.frm:#x}")

        # Also disassemble around the reference
        fn = idaapi.get_func(xref.frm)
        if fn:
            print(f"  Function: {fname}, size={fn.end_ea - fn.start_ea}")
            # Show a few lines around the reference
            start = max(fn.start_ea, xref.frm - 8)
            end = min(fn.end_ea, xref.frm + 16)
            cur = start
            while cur < end:
                line = idc.generate_disasm_line(cur, 0)
                marker = " <-- REF" if cur == xref.frm else ""
                print(f"    {cur:#x}: {line}{marker}")
                cur = idc.next_head(cur, end)
idaapi.qexit(0)
