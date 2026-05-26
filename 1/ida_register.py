import idaapi, idc, idautils
idaapi.auto_wait()
# Decompile registerMessageHandlerFunction
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if "registerMessageHandlerFunction" in name:
        fn = idaapi.get_func(ea)
        if fn:
            print(f"\n{'='*60}")
            print(f"=== {name} @ {ea:#x} ===")
            print(f"{'='*60}")
            cur = ea
            while cur < fn.end_ea:
                line = idc.generate_disasm_line(cur, 0)
                print(f"  {cur:#x}: {line}")
                cur = idc.next_head(cur, fn.end_ea)

# Also decompile sendGetPackSpriteListMessage
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if "sendGetPackSpriteListMessage" in name:
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
