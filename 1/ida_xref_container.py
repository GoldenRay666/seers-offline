import idaapi, idc, idautils, ida_xref
idaapi.auto_wait()

# Find all cross-references to the container symbol/address
container_offsets = [0xAC4158, 0xAC4157, 0xAC4156, 0xAC4155]  # bytes read by getItemBagDump

print("=== Cross-references to container area ===")
for offset in container_offsets:
    for seg_ea in idautils.Segments():
        seg = idaapi.getseg(seg_ea)
        if not seg: continue
        ea = seg.start_ea + offset
        if ea < seg.end_ea:
            print(f"\nAt 0x{ea:X}:")
            for xref in idautils.XrefsTo(ea):
                func = idc.get_func_name(xref.frm)
                print(f"  referenced from 0x{xref.frm:X} in {func}")

# Also find the symbol name at 0xAC4158
print(f"\n=== Symbol at 0xAC4158 ===")
name = idc.get_name(0xAC4158)
print(f"  {name}" if name else "  (unnamed)")

# Decompile the top-level UserData functions
print("\n=== UserData key functions ===")
targets = ["createNewData", "sharedManager", "getItemWithGridID",
           "updateItemInBag", "clearAllData", "saveToFile", "loadFromFile"]
for target in targets:
    for ea in idautils.Functions():
        name = idc.get_func_name(ea)
        if target in name and "UserData" in name:
            print(f"\n--- {name} @ 0x{ea:X} ---")
            try:
                cfunc = ida_hexrays.decompile(ea)
                if cfunc:
                    code = str(cfunc)
                    # Only show first 1500 chars
                    print(code[:1500])
            except: pass

print("\n[DONE]")
