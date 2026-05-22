import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# First, find select_main_mon_in MergePartial by searching function names
targets = []
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'select_main_mon_in' in name and 'MergePartial' in name:
            targets.append(name)

targets += [
    "_ZNK11ISeer20Comm16mon_basic_info_t13IsInitializedEv",
    "_ZN11ISeer20Comm13mon_ev_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE",
    "_ZN11ISeer20Comm20mon_character_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE",
    "_ZN11ISeer20Comm15mon_grow_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE",
    "_ZN11ISeer20Comm16mon_moves_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE",
    "_ZNK11ISeer20Comm20mon_character_info_t13IsInitializedEv",
    "_ZNK11ISeer20Comm15mon_grow_info_t13IsInitializedEv",
    "_ZNK11ISeer20Comm16mon_moves_info_t13IsInitializedEv",
]

for target in targets:
    ea = idc.get_name_ea(idaapi.BADADDR, target)
    if ea == idaapi.BADADDR:
        print(f"[-] {target} NOT FOUND")
        continue

    fn = idaapi.get_func(ea)
    if not fn:
        print(f"[-] {target} at {ea:#x} - no function")
        continue

    fn_start = fn.start_ea
    fn_end = fn.end_ea

    print(f"\n=== {target} at {ea:#x} ({fn_start:#x} - {fn_end:#x}, {fn_end - fn_start} bytes) ===")

    cur = fn_start
    count = 0
    while cur < fn_end and count < 400:
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")

        # Detect switch/case info
        if "SUBS" in line and re.search(r'#\d+', line):
            m = re.search(r'SUBS\s+\w+,\s+#(\d+)', line)
            if m:
                cases = int(m.group(1)) + 1
                print(f"      *** SWITCH with {cases} cases ***")

        if "CMP" in line and "#0x" in line:
            m = re.search(r'#(0x[0-9A-Fa-f]+)', line)
            if m:
                val = int(m.group(1), 16)
                wire = val & 7
                fn = val >> 3
                if 1 <= fn <= 30:
                    print(f"      *** TAG: field={fn} wire_type={wire} ***")

        # Highlight calls
        if "BL " in line or "BLX" in line:
            m = re.search(r'B(LX?)\s+(\S+)', line)
            if m:
                call_target = m.group(2)
                if any(k in call_target for k in ['mutable', 'ReadMessage', 'ReadVarint', 'ReadString', 'MergePartial', 'IsInitialized', 'ReadLittleEndian']):
                    print(f"      -> {call_target}")

        # Constants
        if "LDR" in line and "#0x" in line:
            m = re.search(r'#(0x[0-9A-Fa-f]+)', line)
            if m:
                const = int(m.group(1), 16)
                if const < 0x200:
                    print(f"      *** CONST {m.group(0)} (bits: {bin(const)}) ***")

        cur = idc.next_head(cur, fn_end)
        count += 1

    if count >= 400:
        print(f"  ... TRUNCATED at {count} instructions")

idaapi.qexit(0)
