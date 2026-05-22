import idaapi
import idc
import idautils

idaapi.auto_wait()

# Get FULL disassembly of mon_basic_info_t::MergePartialFromCodedStream
name = "_ZN11ISeer20Comm16mon_basic_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE"
ea = idc.get_name_ea(idaapi.BADADDR, name)
print(f"[+] {name} at {ea:#x}")
fn = idaapi.get_func(ea)
cur = fn.start_ea
insns = []
while cur < fn.end_ea and len(insns) < 200:
    disasm = idc.generate_disasm_line(cur, 0)
    insns.append(f"  {cur:#x}: {disasm}")
    cur = idc.next_head(cur, fn.end_ea)
for line in insns:
    print(line)

# Also find all field number constants
print("\n=== kFieldNumber constants ===")
for seg in idautils.Segments():
    for head in idautils.Heads(seg, idc.get_segm_end(seg)):
        if idc.is_strlit(idc.get_full_flags(head)):
            s = idc.get_strlit_contents(head)
            if s and b'mon_basic_info_t' in s and b'k' in s and b'Field' in s:
                val_addr = head + len(s) + 1
                val = idc.get_wide_dword(val_addr)
                name_str = s.decode('utf-8', errors='ignore')
                print(f"  {head:#x}: {name_str} = {val}")

idaapi.qexit(0)
