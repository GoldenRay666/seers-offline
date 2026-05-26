import idaapi
import idc
import ida_hexrays
import idautils

idaapi.auto_wait()

targets = [
    "createItemCategoryNode",
    "onItemSelected",
    "loadItemInfo",
    "loadMaterialItemInfo",
    "createItemScrollPage",
    "onCloseSelected",
]

for target in targets:
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

print("\n[DONE]")
