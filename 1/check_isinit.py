import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Dump select_main_mon_out::IsInitialized
ea = 0x5b2bd0
fn = idaapi.get_func(ea)
if fn:
    print(f"=== select_main_mon_out::IsInitialized ({ea:#x}) ===")
    cur = fn.start_ea
    for _ in range(25):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "LDR" in line and "#" in line:
            m = re.search(r'#0x[0-9A-Fa-f]+', line)
            if m:
                print(f"      *** CONST {m.group(0)} ***")
        cur = idc.next_head(cur, fn.end_ea)

# Also dump the message handler to see how it validates
print("\n=== MessageHandler::handleMessage ===")
ea2 = 0x6329fc
fn2 = idaapi.get_func(ea2)
if fn2:
    cur = fn2.start_ea
    for _ in range(40):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        cur = idc.next_head(cur, fn2.end_ea)
        if cur >= fn2.end_ea:
            break

idaapi.qexit(0)
