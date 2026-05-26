import idaapi, idc, idautils
idaapi.auto_wait()
# Find BattleManager vtable
vt_name = "_ZTV13BattleManager"
ea = idc.get_name_ea_simple(vt_name)
if ea == idc.BADADDR:
    print(f"VTable {vt_name} not found")
else:
    print(f"VTable at {ea:#x}")
    # Read entries: vtable is an array of function pointers
    for i in range(0, 0x200, 4):
        ptr = idc.get_wide_dword(ea + i)
        if ptr and ptr > 0x1000:
            name = idc.get_func_name(ptr) or idc.get_name(ptr)
            if name:
                print(f"  +{i:#x}: {ptr:#x} {name}")

idaapi.qexit(0)
