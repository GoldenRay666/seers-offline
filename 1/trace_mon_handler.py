import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Find where select_main_mon_out string is used
# Look for the string reference in the message handler
print("=== Searching for select_main_mon_out usage ===")
for seg in idautils.Segments():
    seg_name = idc.get_segm_name(seg)
    if 'data' in seg_name.lower() or 'rodata' in seg_name.lower():
        for head in idautils.Heads(seg, idc.get_segm_end(seg)):
            if idc.is_strlit(idc.get_full_flags(head)):
                s = idc.get_strlit_contents(head)
                if s and b'select_main_mon_out' in s:
                    print(f"  String at {head:#x}: {s}")
                    for xr in idautils.XrefsTo(head):
                        fn = idaapi.get_func(xr.frm)
                        fn_name = idc.get_func_name(xr.frm) if fn else "?"
                        print(f"    XREF from {xr.frm:#x} ({fn_name})")
                        # Dump context around the XREF
                        if fn:
                            cur = xr.frm
                            # Go back 10 instructions
                            for _ in range(10):
                                cur = idc.prev_head(cur, fn.start_ea)
                            for _ in range(40):
                                line = idc.generate_disasm_line(cur, 0)
                                print(f"      {cur:#x}: {line}")
                                if "BL " in line or "BLX" in line:
                                    m = re.search(r'B(LX?)\s+(\S+)', line)
                                    if m:
                                        print(f"        -> {m.group(2)}")
                                cur = idc.next_head(cur, fn.end_ea)
                                if cur >= fn.end_ea:
                                    break
                            print("      ---")

# Also dump what happens in MessageHandler::handleMessage (0x6329fc)
# Specifically around the select_main_mon case
print("\n=== MessageHandler::handleMessage (NORMAL_MSG_PACKAGE) at 0x6329fc ===")
fn_ea = 0x6329fc
fn = idaapi.get_func(fn_ea)
if fn:
    cur = fn.start_ea
    count = 0
    while cur < fn.end_ea and count < 500:
        line = idc.generate_disasm_line(cur, 0)
        # Look for references to select_main_mon or key game functions
        if "BL " in line:
            m = re.search(r'B(LX?)\s+(\S+)', line)
            if m:
                target = m.group(2)
                # Only print interesting calls
                if any(k in target for k in ['startGame', 'GameManager', 'Layer', 'Scene', 'select_main', 'Player', 'Inventory', 'changeMap', 'Menu']):
                    print(f"  {cur:#x}: {line}")
                    print(f"    -> {target}")
        cur = idc.next_head(cur, fn.end_ea)
        count += 1
    print(f"  Total: {count} instructions (function size: {fn.end_ea - fn.start_ea} bytes)")

idaapi.qexit(0)
