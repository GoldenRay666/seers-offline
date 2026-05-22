import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Find mon_basic_info_t MergePartialFromCodedStream
target = "_ZN11ISeer20Comm16mon_basic_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE"
ea = idc.get_name_ea(idaapi.BADADDR, target)
if ea != idaapi.BADADDR:
    fn = idaapi.get_func(ea)
    print(f"\n=== {target} at {ea:#x} ===")
    cur = fn.start_ea
    count = 0
    while cur < fn.end_ea:
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        # Highlight switch cases and field tags
        if "SUBS" in line and "#1" in line and "switch" not in line.lower():
            m = re.search(r'SUBS\s+R\d+,\s+#(\d+)', line)
            if m:
                print(f"      *** switch with {int(m.group(1))+1} cases ***")
        if "CMP" in line and "#0x" in line:
            m = re.search(r'#(0x[0-9A-Fa-f]+)', line)
            if m:
                val = int(m.group(1), 16)
                wire_type = val & 7
                field_num = val >> 3
                if wire_type in [0, 2] and 1 <= field_num <= 50:
                    print(f"      *** field {field_num}, wire_type {wire_type} ***")
        if "BL " in line or "BLX" in line:
            m = re.search(r'B(LX?)\s+(\S+)', line)
            if m:
                target_name = m.group(2)
                if 'mutable' in target_name or 'ReadMessage' in target_name or 'ReadVarint' in target_name:
                    print(f"      -> {target_name}")
        cur = idc.next_head(cur, fn.end_ea)
        count += 1
    print(f"  Total instructions: {count}")
else:
    print(f"[-] {target} not found")

# Also dump mon_info_t IsInitialized
target2 = "_ZNK11ISeer20Comm10mon_info_t13IsInitializedEv"
ea2 = idc.get_name_ea(idaapi.BADADDR, target2)
if ea2 != idaapi.BADADDR:
    fn2 = idaapi.get_func(ea2)
    print(f"\n=== {target2} at {ea2:#x} ===")
    cur = fn2.start_ea
    while cur < fn2.end_ea:
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "LDR" in line and "#" in line:
            m = re.search(r'#(0x[0-9A-Fa-f]+)', line)
            if m:
                print(f"      *** CONST {m.group(0)} ***")
        cur = idc.next_head(cur, fn2.end_ea)
else:
    print(f"[-] {target2} not found")

idaapi.qexit(0)
