import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Dump select_main_mon_out SerializeWithCachedSizesToArray
name = "_ZNK14ISeer20CSProto19select_main_mon_out31SerializeWithCachedSizesToArrayEPh"
ea = idc.get_name_ea(idaapi.BADADDR, name)
if ea != idaapi.BADADDR:
    print(f"\n[+] {name} at {ea:#x}")
    fn = idaapi.get_func(ea)
    cur = fn.start_ea
    for _ in range(30):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea:
            break
else:
    print(f"[-] {name} not found")

# Also dump mon_info_t SerializeWithCachedSizesToArray
name2 = "_ZNK11ISeer20Comm10mon_info_t31SerializeWithCachedSizesToArrayEPh"
ea2 = idc.get_name_ea(idaapi.BADADDR, name2)
if ea2 != idaapi.BADADDR:
    print(f"\n[+] {name2} at {ea2:#x}")
    fn = idaapi.get_func(ea2)
    cur = fn.start_ea
    for _ in range(80):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea:
            break
else:
    print(f"[-] {name2} not found")

# Also dump mon_basic_info_t SerializeWithCachedSizesToArray
name3 = "_ZNK11ISeer20Comm16mon_basic_info_t31SerializeWithCachedSizesToArrayEPh"
ea3 = idc.get_name_ea(idaapi.BADADDR, name3)
if ea3 != idaapi.BADADDR:
    print(f"\n[+] {name3} at {ea3:#x}")
    fn = idaapi.get_func(ea3)
    cur = fn.start_ea
    for _ in range(200):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea:
            break
else:
    print(f"[-] {name3} not found")

idaapi.qexit(0)
