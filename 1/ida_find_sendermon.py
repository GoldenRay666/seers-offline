import idaapi, idc, idautils
idaapi.auto_wait()
# Find where select_main_mon_in is SENT (not the proto methods)
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    # Look for UI/menu functions that send this request
    if ("MainMenu" in name or "PetUI" in name or "MonBag" in name or "BagMon" in name or
        "Party" in name or "Elf" in name or "SpriteBag" in name or "MonsterList" in name):
        sz = idc.get_func_attr(ea, idc.FUNCATTR_END) - ea
        if sz > 50:  # only non-trivial functions
            print(f"{sz:6d}  {ea:#08x}  {name}")
idaapi.qexit(0)
