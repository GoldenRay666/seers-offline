import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Look for the string "ISeer20CSProto.select_main_mon_out" in the binary
# and find where it's used for message dispatch

# First, try to find the string in the rdata section
print("=== Searching for select_main_mon_out string ===")
for seg in idautils.Segments():
    seg_name = idc.get_segm_name(seg)
    if 'data' in seg_name.lower() or 'rodata' in seg_name.lower():
        for head in idautils.Heads(seg, idc.get_segm_end(seg)):
            if idc.is_strlit(idc.get_full_flags(head)):
                s = idc.get_strlit_contents(head)
                if s and b'select_main_mon_out' in s:
                    print(f"  Found at {head:#x}: {s}")
                    # Show xrefs
                    for xr in idautils.XrefsTo(head):
                        caller_fn = idaapi.get_func(xr.frm)
                        fn_name = idc.get_func_name(xr.frm) if caller_fn else "?"
                        print(f"    xref from {xr.frm:#x} ({fn_name})")

# Also search for the MessageHandler registration
print("\n=== MessageHandler dispatch tables ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'MessageHandler' in name or 'MessageDispatcher' in name or 'MsgHandle' in name:
            fn = idaapi.get_func(ea)
            cur = fn.start_ea
            lines = []
            for _ in range(80):
                lines.append(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
                cur = idc.next_head(cur, fn.end_ea)
                if cur >= fn.end_ea:
                    break
            print(f"\n  {name} at {ea:#x}:")
            for l in lines:
                print(l)

idaapi.qexit(0)
