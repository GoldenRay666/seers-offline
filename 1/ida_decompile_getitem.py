import idaapi
import idc
import ida_hexrays
import idautils

idaapi.auto_wait()

# Find getItemBagDump
target = "getItemBagDump"
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if target in name and "ItemBagLayer" in name:
        print(f"\n=== {name} @ 0x{ea:X} ===")
        try:
            cfunc = ida_hexrays.decompile(ea)
            if cfunc:
                print(str(cfunc))
        except Exception as e:
            print(f"Decompile failed: {e}")

        # Also dump key assembly with comments
        print("\n--- Key instructions ---")
        func = idaapi.get_func(ea)
        for head in idautils.Heads(func.start_ea, func.end_ea):
            disasm = idc.generate_disasm_line(head, 0)
            if disasm and any(x in disasm for x in ['LDR','STR','BL','BLX','0x198','0xcc']):
                cmt = idc.get_cmt(head, 0) or ''
                print(f"  0x{head:X}: {disasm}" + (f" ; {cmt}" if cmt else ""))

# Also find what's at address 0xc11c8ae0 and 0xc1278ff0 (called from getItemBagDump)
print("\n=== Functions called from getItemBagDump ===")
for addr in [0xc11c8ae0, 0xc1278ff0, 0xc0e84f9c, 0xc0e84f80, 0xc0f98ac0]:
    name = idc.get_func_name(addr)
    print(f"  0x{addr:X}: {name}")

print("\n[DONE]")
