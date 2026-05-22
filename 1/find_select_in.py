import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Find select_main_mon_in MergePartial
name = "_ZN14ISeer20CSProto18select_main_mon_in27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE"
ea = idc.get_name_ea(idaapi.BADADDR, name)
if ea != idaapi.BADADDR:
    print(f"[+] select_main_mon_in MergePartial at {ea:#x}")
    fn = idaapi.get_func(ea)
    cur = fn.start_ea
    insns = []
    while cur < fn.end_ea and len(insns) < 120:
        disasm = idc.generate_disasm_line(cur, 0)
        insns.append(f"  {cur:#x}: {disasm}")
        cur = idc.next_head(cur, fn.end_ea)
    for line in insns:
        print(line)
    
    # Parse field types
    current_field = 0
    for addr, disasm in insns:
        m = re.search(r'case (\d+)', disasm)
        if m:
            current_field = int(m.group(1))
            print(f"  >>> FIELD {current_field + 1} (case {current_field})")
        m = re.search(r'CMP\s+R\d+,\s*#(\d+)', disasm)
        if m and current_field >= 0:
            wt = int(m.group(1))
            if wt <= 5:
                print(f"      wire_type check: {wt}")
        m = re.search(r'BL\s+(\S+)', disasm)
        if m and current_field >= 0:
            fn_name = m.group(1)
            if 'ReadString' in fn_name:
                print(f"      ReadString")
            elif 'ReadVarint' in fn_name:
                print(f"      ReadVarint32")
            elif 'ReadMessage' in fn_name:
                print(f"      ReadMessage")
        
else:
    print("[-] select_main_mon_in MergePartial not found")

idaapi.qexit(0)
