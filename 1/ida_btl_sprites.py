import idaapi, idc, idautils
idaapi.auto_wait()
# Find ALL BattleManager functions that might be involved in sprite setup
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if "BattleManager" in name and ("Sprite" in name or "sprite" in name or "Mon" in name or "Npc" in name or "npc" in name or "Target" in name or "Waiting" in name or "Attackee" in name):
        sz = idc.get_func_attr(ea, idc.FUNCATTR_END) - ea
        if sz > 5:
            fn = idaapi.get_func(ea)
            print(f"{sz:6d}  {ea:#08x}  {name}")
idaapi.qexit(0)
