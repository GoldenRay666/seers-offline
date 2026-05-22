import idaapi
import idc
import idautils

idaapi.auto_wait()

# Find mon_info_t IsInitialized
name = "_ZNK11ISeer20Comm10mon_info_t13IsInitializedEv"
ea = idc.get_name_ea(idaapi.BADADDR, name)
if ea != idaapi.BADADDR:
    print(f"[+] {name} at {ea:#x}")
    fn = idaapi.get_func(ea)
    cur = fn.start_ea
    for _ in range(30):
        print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
        cur = idc.next_head(cur, fn.end_ea)
else:
    print(f"[-] {name} not found!")

# Also find mon_btl_attr_t IsInitialized
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if "mon_btl_attr_t" in name and "IsInitialized" in name:
            print(f"\n[+] {name} at {ea:#x}")
            fn = idaapi.get_func(ea)
            cur = fn.start_ea
            for _ in range(20):
                print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
                cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
