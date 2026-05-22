import idaapi
import idc
import idautils

idaapi.auto_wait()

# Find kMonInfoFieldNumber
ea = idc.get_name_ea(idaapi.BADADDR, "_ZN14ISeer20CSProto19select_main_mon_out19kMonInfoFieldNumberE")
if ea != idaapi.BADADDR:
    print(f"kMonInfoFieldNumber at {ea:#x}")
    # Read the value (it's a static const int)
    val = idc.get_wide_dword(ea)
    print(f"Value (raw): {val}")
    # Try reading as dword
    print(f"Dword: {idc.get_wide_dword(ea)}")
    # Check what's at this address
    for i in range(20):
        b = idc.get_wide_byte(ea + i)
        print(f"  byte[{i}] = {b}")

# Find the descriptor data for select_main_mon_out
# Look for "mon_info" string
for seg in idautils.Segments():
    for head in idautils.Heads(seg, idc.get_segm_end(seg)):
        if idc.is_strlit(idc.get_full_flags(head)):
            s = idc.get_strlit_contents(head)
            if s and b'mon_info' in s:
                print(f"\n  String at {head:#x}: {s.decode('utf-8', errors='ignore')}")

# Search for the field descriptor table
# The descriptor() method at 0x2250be (from the dtor list) returns the descriptor
descriptor_ea = idc.get_name_ea(idaapi.BADADDR, "_ZN14ISeer20CSProto19select_main_mon_out10descriptorEv")
if descriptor_ea != idaapi.BADADDR:
    print(f"\n[+] descriptor() at {descriptor_ea:#x}")
    # Disassemble it
    fn = idaapi.get_func(descriptor_ea)
    if fn:
        cur = fn.start_ea
        for _ in range(20):
            print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
            cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
