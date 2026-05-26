import idaapi, idc, idautils
idaapi.auto_wait()
# The descriptor for select_main_mon_in
target_funcs = [
    "_ZN14ISeer20CSProto18select_main_mon_in10descriptorEv",
]
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if name in target_funcs:
        fn = idaapi.get_func(ea)
        print(f"\n=== XREFs to {name} @ {ea:#x} ===")
        for xref in idautils.XrefsTo(ea):
            fname = idc.get_func_name(xref.frm)
            print(f"  Called from: {fname} @ {xref.frm:#x}")
idaapi.qexit(0)
