import idaapi
import idc
import idautils

idaapi.auto_wait()

# Find all UserData related functions and data symbols
print("=== UserData functions ===")
for ea, name in idautils.Names():
    if 'UserData' in name and len(name) < 100:
        addr = ea
        if idc.get_func_name(ea):
            pass  # function
        print(f"  {name} @ {ea:#x}")

# Also search for ItemBagLayer capacity related
print("\n=== ItemBagLayer related ===")
for ea, name in idautils.Names():
    if 'ItemBag' in name and len(name) < 100:
        print(f"  {name} @ {ea:#x}")

# Search for capacity in function names
print("\n=== Capacity/BagSize in names ===")
for ea, name in idautils.Names():
    if ('capacity' in name.lower() or 'bagcap' in name.lower() or 'bagsize' in name.lower() or 'bag_size' in name.lower() or 'bag_cap' in name.lower()) and len(name) < 100:
        print(f"  {name} @ {ea:#x}")

# Search data symbols for UserData static members
print("\n=== UserData data symbols ===")
for ea, name in idautils.Names():
    if 'UserData' in name and not idc.get_func_name(ea) and len(name) < 100:
        # It's a data symbol
        val = idc.get_wide_dword(ea)
        print(f"  DATA {name} @ {ea:#x} = {val:#x}")

idaapi.qexit(0)
