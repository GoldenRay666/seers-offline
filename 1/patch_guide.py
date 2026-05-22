import idaapi, idautils, idc, ida_bytes
import struct

# Find isNeedUnlock
for ea in idautils.Names():
    name = idc.get_name(ea)
    if name == '_ZN29GameOpenAssignFunctionManager12isNeedUnlockEv':
        print(f'Found isNeedUnlock at {ea:#x}')
        fn = idaapi.get_func(ea)
        if fn:
            print(f'Function: {fn.start_ea:#x} - {fn.end_ea:#x}')
            # Read first 16 bytes
            data = ida_bytes.get_bytes(fn.start_ea, 16)
            print(f'First 16 bytes: {data.hex()}')
            # Disassemble
            for h in idautils.Heads(fn.start_ea, min(fn.start_ea + 20, fn.end_ea)):
                print(f'  {h:#x}: {idc.generate_disasm_line(h, 0)}')
        break

idc.qexit(0)
