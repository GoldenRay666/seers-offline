import idaapi, idc, idautils
idaapi.auto_wait()
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if "SpriteMainPackListLayer" in name:
        sz = idc.get_func_attr(ea, idc.FUNCATTR_END) - ea
        if sz > 20:
            fn = idaapi.get_func(ea)
            print(f"\n{'='*60}")
            print(f"=== {name} @ {ea:#x} size={sz} ===")
            print(f"{'='*60}")
            cur = ea
            while cur < fn.end_ea:
                line = idc.generate_disasm_line(cur, 0)
                print(f"  {cur:#x}: {line}")
                cur = idc.next_head(cur, fn.end_ea)
idaapi.qexit(0)
