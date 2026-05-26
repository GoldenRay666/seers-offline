import idaapi, idc, ida_hexrays, idautils
idaapi.auto_wait()

# 1. Decompile getItemWithGridID, updateItemInBag
targets = ["getItemWithGridID", "updateItemInBag", "getItemWithItemID",
           "getTotalItemCount", "getItemCountWithItemID", "swapItemInBag",
           "reduceItem", "createNewData", "afterUpdateItem"]

for target in targets:
    for ea in idautils.Functions():
        name = idc.get_func_name(ea)
        if target in name and "UserData" in name:
            print(f"\n=== {name} @ 0x{ea:X} ===")
            try:
                cfunc = ida_hexrays.decompile(ea)
                if cfunc: print(str(cfunc)[:3000])
            except Exception as e:
                print(f"Decompile failed: {e}")

# 2. Find all UserData static data members
print("\n=== UserData data members ===")
for seg_ea in idautils.Segments():
    seg = idaapi.getseg(seg_ea)
    if not seg: continue
    seg_name = idc.get_segm_name(seg_ea)
    if '.bss' in seg_name or '.data' in seg_name:
        for head in idautils.Heads(seg.start_ea, seg.end_ea):
            name = idc.get_name(head)
            if name and 'UserData' in name and 'm_' in name:
                print(f"  {name} @ 0x{head:X}")

# 3. Search for UserData class size
print("\n=== UserData structures ===")
for i in range(idaapi.get_struc_qty()):
    sid = idaapi.get_struc_by_idx(i)
    sname = idaapi.get_struc_name(sid)
    if sname and 'UserData' in sname:
        size = idaapi.get_struc_size(sid)
        print(f"  {sname} size=0x{size:X}")
        # Dump members
        for m in idautils.StructMembers(sid):
            print(f"    +0x{m.offset:X}: {m.name} (size={m.size})")

print("\n[DONE]")
