import idaapi
import idc

idaapi.auto_wait()

# Find kMonInfoFieldNumber
ea = idc.get_name_ea(idaapi.BADADDR, "_ZN14ISeer20CSProto19select_main_mon_out19kMonInfoFieldNumberE")
if ea != idaapi.BADADDR:
    print(f"[+] kMonInfoFieldNumber at {ea:#x}")
    val = idc.get_wide_dword(ea)
    print(f"[+] Field number = {val}")
else:
    print("[-] kMonInfoFieldNumber not found - searching alternatives")
    # Search for the string
    for seg in idautils.Segments():
        for head in idautils.Heads(seg, idc.get_segm_end(seg)):
            if idc.is_strlit(idc.get_full_flags(head)):
                s = idc.get_strlit_contents(head)
                if s and b'kMonInfo' in s:
                    print(f"  Found at {head:#x}: {s}")
                    # Read the value after the string (dword)
                    end = head + len(s) + 1
                    val = idc.get_wide_dword(end)
                    print(f"  Value at {end:#x}: {val}")

# Also find the descriptor pointer
# Look for the dword_* reference in the descriptor function
desc_ea = idc.get_name_ea(idaapi.BADADDR, "_ZN14ISeer20CSProto19select_main_mon_out11GetMetadataEv")
if desc_ea != idaapi.BADADDR:
    print(f"\n[+] GetMetadata at {desc_ea:#x}")
    fn = idaapi.get_func(desc_ea)
    if fn:
        cur = fn.start_ea
        for _ in range(20):
            insn = idc.generate_disasm_line(cur, 0)
            print(f"  {cur:#x}: {insn}")
            if "=" in insn or "dword" in insn or "LDR" in insn:
                # Check operand
                pass
            cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
