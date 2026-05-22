import idaapi
import idc
import idautils

idaapi.auto_wait()

names = [
    "_ZNK14ISeer20CSProto19select_main_mon_out13IsInitializedEv",
    "_ZN14ISeer20CSProto19select_main_mon_out9MergeFromERKS1_",
    "_ZN14ISeer20CSProto19select_main_mon_out8CopyFromERKS1_",
]

for name in names:
    ea = idc.get_name_ea(idaapi.BADADDR, name)
    if ea == idaapi.BADADDR:
        print(f"[-] {name} not found")
    else:
        print(f"\n[+] {name} at {ea:#x}")
        fn = idaapi.get_func(ea)
        if fn:
            cur = fn.start_ea
            end = fn.end_ea
            instructions = []
            while cur < end and len(instructions) < 50:
                instructions.append(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
                cur = idc.next_head(cur, end)
            print('\n'.join(instructions))

# Also find references to the message descriptor (field definitions)
print("\n[+] Searching for field descriptor references...")
# Look for data references near the select_main_mon_out string
for seg in idautils.Segments():
    for head in idautils.Heads(seg, idc.get_segm_end(seg)):
        if idc.is_strlit(idc.get_full_flags(head)):
            s = idc.get_strlit_contents(head).decode('utf-8', errors='ignore')
            if s and 'main_mon_out' in s:
                print(f"  String at {head:#x}: {s}")

# Search for the message descriptor (protobuf reflection data)
# Look for data xrefs to the class
class_name = "_ZN14ISeer20CSProto19select_main_mon_out"
class_ea = idc.get_name_ea(idaapi.BADADDR, class_name + "D0Ev")  # destructor
if class_ea != idaapi.BADADDR:
    print(f"\n[+] Class dtor at {class_ea:#x}")

idaapi.qexit(0)
