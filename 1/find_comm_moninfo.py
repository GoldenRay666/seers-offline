import idaapi
import idc
import idautils

idaapi.auto_wait()

# Find IS eer20Comm::mon_info_t functions
print("=== Searching for ISeer20Comm::mon_info_t ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if "mon_info_t" in name and "ISeer20Comm" in name and "MergePartial" in name:
            print(f"\n[+] {name} at {ea:#x}")
            fn = idaapi.get_func(ea)
            cur = fn.start_ea
            insns = []
            while cur < fn.end_ea and len(insns) < 80:
                insns.append(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
                cur = idc.next_head(cur, fn.end_ea)
            for line in insns:
                print(line)

# Also find IsInitialized for mon_info_t
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if "mon_info_t" in name and "ISeer20Comm" in name and "IsInitialized" in name:
            print(f"\n[+] {name} at {ea:#x}")
            fn = idaapi.get_func(ea)
            cur = fn.start_ea
            for _ in range(25):
                print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
                cur = idc.next_head(cur, fn.end_ea)

# Find field number constants
print("\n=== Looking for k*FieldNumber ===")
for seg in idautils.Segments():
    for head in idautils.Heads(seg, idc.get_segm_end(seg)):
        if idc.is_strlit(idc.get_full_flags(head)):
            s = idc.get_strlit_contents(head)
            if s and b'mon_info_t' in s and b'k' in s and b'Field' in s:
                print(f"  {head:#x}: {s.decode('utf-8', errors='ignore')}")

idaapi.qexit(0)
