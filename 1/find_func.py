import idaapi, idautils, idc, ida_funcs

# Write to the IDA log file instead of a separate file
print("=== STARTING ANALYSIS ===")

# Find all GameOpenAssignFunctionManager methods
for ea in idautils.Names():
    name = idc.get_name(ea)
    if name and 'GameOpenAssignFunctionManager' in name:
        fn = idaapi.get_func(ea)
        if fn:
            print(f"FUNC: {name} at {fn.start_ea:#x} size {fn.end_ea - fn.start_ea}")
        else:
            print(f"SYM: {name} at {ea:#x}")

print("=== DONE ===")
idc.qexit(0)
