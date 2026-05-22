import idaapi
import idc
import re

idaapi.auto_wait()

# Trace where R3 comes from before the BLX R3 at 0x632a98
print("=== Tracing R3 at dispatch point 0x632a98 ===")
fn = idaapi.get_func(0x6329fc)
if fn:
    # Show 30 instructions before the BLX
    cur = 0x632a98
    for _ in range(30):
        cur = idc.prev_head(cur, fn.start_ea)

    for _ in range(60):
        line = idc.generate_disasm_line(cur, 0)
        marker = " <-- BLX R3" if cur == 0x632a98 else ""
        print(f"  {cur:#x}: {line}{marker}")
        if "BL " in line or "BLX" in line:
            m = re.search(r'B(LX?)\s+(\S+)', line)
            if m:
                t = m.group(2)
                if not t.startswith('R'):
                    fn_name = idc.get_func_name(int(t, 16)) if t.startswith('0x') else t
                    print(f"    -> {t} ({fn_name})")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea:
            break

# Also dump the entire handleMessage function to find the handler lookup
print("\n\n=== Full handleMessage for handler lookup pattern ===")
fn2 = idaapi.get_func(0x6329fc)
if fn2:
    cur = fn2.start_ea
    count = 0
    while cur < fn2.end_ea and count < 2000:
        line = idc.generate_disasm_line(cur, 0)
        # Look for patterns like LDR Rx, [Ry, #offset] that load handler from a table
        # or BL that loads a function pointer
        if ('LDR' in line and 'R3' in line and '#' in line) or \
           ('find' in line.lower() or 'map' in line.lower()):
            # Show calls that might be map lookups
            if 'BL ' in line or 'BLX' in line:
                m = re.search(r'B(LX?)\s+(\S+)', line)
                if m:
                    t = m.group(2)
                    if not t.startswith('R'):
                        fn_name = idc.get_func_name(int(t, 16)) if t.startswith('0x') else t
                        if fn_name and ('find' in fn_name.lower() or 'map' in fn_name.lower() or 'handler' in fn_name.lower()):
                            print(f"  {cur:#x}: {line}")
                            print(f"    -> {fn_name}")
        cur = idc.next_head(cur, fn2.end_ea)
        count += 1
    print(f"  Total instructions scanned: {count}")

idaapi.qexit(0)
