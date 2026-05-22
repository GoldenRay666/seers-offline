import idaapi
import idc
import idautils

idaapi.auto_wait()

merge_ea = idc.get_name_ea(idaapi.BADADDR,
    "_ZN14ISeer20CSProto19select_main_mon_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE")
if merge_ea != idaapi.BADADDR:
    print(f"[+] MergePartialFromCodedStream at {merge_ea:#x}")
    fn = idaapi.get_func(merge_ea)
    if fn:
        cur = fn.start_ea
        insns = []
        while cur < fn.end_ea and len(insns) < 100:
            disasm = idc.generate_disasm_line(cur, 0)
            insns.append(f"  {cur:#x}: {disasm}")
            cur = idc.next_head(cur, fn.end_ea)
        for line in insns:
            print(line)
else:
    print("[-] MergePartialFromCodedStream not found")
    # Try searching
    for seg in idautils.Segments():
        for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
            name = idc.get_func_name(ea)
            if "MergePartial" in name and "select_main_mon" in name:
                print(f"  Found: {name} at {ea:#x}")

# Also try to find the mutable_mon_info function
mon_info_ea = idc.get_name_ea(idaapi.BADADDR,
    "_ZN14ISeer20CSProto19select_main_mon_out16mutable_mon_infoEv")
if mon_info_ea != idaapi.BADADDR:
    print(f"\n[+] mutable_mon_info at {mon_info_ea:#x}")
    fn = idaapi.get_func(mon_info_ea)
    if fn:
        cur = fn.start_ea
        for _ in range(15):
            print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
            cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
