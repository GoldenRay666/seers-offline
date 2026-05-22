import idaapi
import idc
import idautils
import struct

idaapi.auto_wait()

# Find all FieldNumber constants for mon_basic_info_t with their VALUES
print("=== mon_basic_info_t kFieldNumber values ===")
for seg in idautils.Segments():
    for head in idautils.Heads(seg, idc.get_segm_end(seg)):
        name = idc.get_name(head)
        if name and 'mon_basic_info_t' in name and 'FieldNumber' in name:
            # Read the actual value (it's typically at the address, stored as a dword in ARM literal pool)
            # For static const int in ARM, the value is usually in a literal pool nearby
            # Try reading the dword at this address
            val = idc.get_wide_dword(head)
            print(f"  {name} @ {head:#x}: raw_dword={val:#x} ({val})")
            # Also look for the actual constant in nearby data
            # Check if this is a pointer to a constant
            for i in range(-4, 20):
                b = idc.get_wide_byte(head + i)
                if i >= 0:
                    # Try reading a dword at head+i
                    dv = idc.get_wide_dword(head + i)
                    if 0 < dv < 100:
                        print(f"    possible field number at +{i}: {dv}")

print("\n=== mon_info_t kFieldNumber values ===")
for seg in idautils.Segments():
    for head in idautils.Heads(seg, idc.get_segm_end(seg)):
        name = idc.get_name(head)
        if name and 'mon_info_t' in name and 'FieldNumber' in name and 'battle_end' not in name:
            val = idc.get_wide_dword(head)
            print(f"  {name} @ {head:#x}: raw_dword={val:#x}")
            for i in range(0, 20):
                dv = idc.get_wide_dword(head + i)
                if 0 < dv < 100:
                    print(f"    possible field number at +{i}: {dv}")

# Find the descriptor table for select_main_mon_out
print("\n=== select_main_mon_out descriptor ===")
name = "_ZN14ISeer20CSProto19select_main_mon_out10descriptorEv"
ea = idc.get_name_ea(idaapi.BADADDR, name)
if ea != idaapi.BADADDR:
    fn = idaapi.get_func(ea)
    if fn:
        cur = fn.start_ea
        for _ in range(30):
            print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
            cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
