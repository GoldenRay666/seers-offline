import idaapi
import idc
import idautils

idaapi.auto_wait()

TARGETS = ["BattleManager", "Battle", "BattleScene", "BattleLayer", "battle", "Btl"]

found = []
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    for t in TARGETS:
        if t in name and len(name) < 80:
            sz = idc.get_func_attr(ea, idc.FUNCATTR_END) - ea
            if sz > 10:
                found.append((name, ea, sz))
            break

# Sort by size (largest = likely handler)
found.sort(key=lambda x: -x[2])
for name, ea, sz in found:
    print(f"{sz:6d}  {ea:#08x}  {name}")

idaapi.qexit(0)
