import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Find IsInitialized and MergePartial for mon_info_t's sub-messages
targets = [
    "ev_info",
    "character_info",
    "grow_info",
    "moves_info"
]

# Search for all functions with these names
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        for t in targets:
            if t in name and ("IsInitialized" in name or "MergePartial" in name):
                print(f"\n[+] {name} at {ea:#x}")
                fn = idaapi.get_func(ea)
                cur = fn.start_ea
                for _ in range(30):
                    line = idc.generate_disasm_line(cur, 0)
                    print(f"  {cur:#x}: {line}")
                    # Check for mask values
                    if "LDR" in line and "=" in line:
                        m = re.search(r'#0x[0-9A-Fa-f]+', line)
                        if m:
                            val = m.group(0)
                            if int(val, 16) > 0xFF:
                                print(f"      *** MASK: {val}")
                    cur = idc.next_head(cur, fn.end_ea)

# Also fully dump mon_info_t MergePartial to see cases 4-7
name = "_ZN11ISeer20Comm10mon_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE"
ea = idc.get_name_ea(idaapi.BADADDR, name)
if ea != idaapi.BADADDR:
    print(f"\n\n=== FULL mon_info_t MergePartial ===")
    fn = idaapi.get_func(ea)
    cur = fn.start_ea
    case_num = 0
    for _ in range(200):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        # Track jump table cases
        if "jumptable" in line:
            print(f"      *** CASE DETECTED ***")
        if "BL" in line:
            fn_name = re.search(r'BL\s+(\S+)', line)
            if fn_name:
                print(f"      -> {fn_name.group(1)}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur == fn.end_ea:
            break

idaapi.qexit(0)
