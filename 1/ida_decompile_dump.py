# Run in IDA: decompile getItemBagDump and find its data source
import idaapi
import idc
import ida_hexrays
import ida_funcs
import ida_name

# Wait for autoanalysis
idaapi.auto_wait()

# Find getItemBagDump
target = "getItemBagDump"
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if target in name and "ItemBagLayer" in name:
        print(f"\n=== {name} @ 0x{ea:X} ===")

        # Decompile
        try:
            cfunc = ida_hexrays.decompile(ea)
            if cfunc:
                print(str(cfunc))
        except Exception as e:
            print(f"Decompile failed: {e}")

        # Also dump disassembly
        print("\n--- Disassembly ---")
        func = ida_funcs.get_func(ea)
        if func:
            for head in idautils.Heads(func.start_ea, func.end_ea):
                disasm = idc.generate_disasm_line(head, 0)
                if disasm:
                    print(f"  0x{head:X}: {disasm}")

# Also decompile loadItemAll and loadItem
for target in ["loadItemAll", "loadItem", "getItemBagDump"]:
    for ea in idautils.Functions():
        name = idc.get_func_name(ea)
        if target in name and "ItemBagLayer" in name:
            print(f"\n=== {name} @ 0x{ea:X} ===")
            try:
                cfunc = ida_hexrays.decompile(ea)
                if cfunc:
                    print(str(cfunc)[:2000])  # First 2000 chars
            except Exception as e:
                print(f"Decompile failed: {e}")

print("\n[DONE]")
