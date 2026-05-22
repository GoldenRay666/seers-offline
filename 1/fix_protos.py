import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

targets = [
    "get_unlocked_map_id_list",
    "get_pvp_data",
    "get_mail_head_list",
]

for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        for t in targets:
            if t in name and "MergePartial" in name:
                print(f"\n[+] {name} at {ea:#x}")
                fn = idaapi.get_func(ea)
                cur = fn.start_ea
                for _ in range(60):
                    line = idc.generate_disasm_line(cur, 0)
                    print(f"  {cur:#x}: {line}")
                    # Show BL calls
                    if "BL " in line or "BLX" in line:
                        m = re.search(r'B(LX?)\s+(\S+)', line)
                        if m:
                            print(f"      -> {m.group(2)}")
                    # Show switch/case
                    if "case" in line.lower() or "jumptable" in line:
                        print(f"      *** CASE ***")
                    # Show field number
                    if "SUBS" in line and "CMP" in line:
                        print(f"      *** FIELD CHECK ***")
                    cur = idc.next_head(cur, fn.end_ea)
                    if cur >= fn.end_ea:
                        break

idaapi.qexit(0)
