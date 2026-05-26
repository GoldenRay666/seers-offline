import idaapi, idc, idautils
idaapi.auto_wait()
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if "SpriteMainLayer" in name and ("loadData" in name or "updateView" in name or "select" in name or "setMain" in name):
        fn = idaapi.get_func(ea)
        if fn:
            print(f"\n{'='*60}")
            print(f"=== {name} @ {ea:#x} size={fn.end_ea - ea} ===")
            print(f"{'='*60}")
            cur = ea
            while cur < fn.end_ea:
                line = idc.generate_disasm_line(cur, 0)
                print(f"  {cur:#x}: {line}")
                cur = idc.next_head(cur, fn.end_ea)
idaapi.qexit(0)
