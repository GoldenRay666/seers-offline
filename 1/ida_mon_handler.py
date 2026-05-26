import idaapi, idc, idautils
idaapi.auto_wait()
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    # Search for handler/callback for select_main_mon and mon-related functions
    if ("select_main_mon" in name or "handleMon" in name or "onMon" in name or
        "updateMonBag" in name or "setMainMon" in name or "addToParty" in name or
        "receiveMon" in name or "processMon" in name):
        sz = idc.get_func_attr(ea, idc.FUNCATTR_END) - ea
        if sz > 10:
            print(f"\n{'='*60}")
            print(f"=== {name} @ {ea:#x} ===")
            print(f"{'='*60}")
            cur = ea
            while cur < idc.get_func_attr(ea, idc.FUNCATTR_END):
                line = idc.generate_disasm_line(cur, 0)
                print(f"  {cur:#x}: {line}")
                cur = idc.next_head(cur, idc.get_func_attr(ea, idc.FUNCATTR_END))
idaapi.qexit(0)
