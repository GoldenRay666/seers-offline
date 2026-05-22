import idaapi, idautils, idc
for ea in idautils.Names():
    name = idc.get_name(ea)
    if 'isNeedUnlock' in name:
        print(f'isNeedUnlock symbol at {ea:#x}')
        # Find where this function is implemented
        fn = idaapi.get_func(ea)
        if fn:
            print(f'  Function: {fn.start_ea:#x} - {fn.end_ea:#x}')
            # Disassemble first few instructions
            for h in idautils.Heads(fn.start_ea, min(fn.start_ea + 0x20, fn.end_ea)):
                print(f'  {h:#x}: {idc.generate_disasm_line(h, 0)}')
idc.qexit(0)
