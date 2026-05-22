import idaapi
import idc
import idautils

idaapi.auto_wait()

# Find mon_basic_info_t IsInitialized
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if "mon_basic_info_t" in name and "ISeer20Comm" in name:
            if "IsInitialized" in name or "MergePartial" in name:
                print(f"\n[+] {name} at {ea:#x}")
                fn = idaapi.get_func(ea)
                cur = fn.start_ea
                for _ in range(40):
                    print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
                    cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
