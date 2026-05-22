import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Find all BLX indirect calls in handleMessage that could be handler dispatches
print("=== Handler dispatches in handleMessage (0x6329fc) ===")
fn = idaapi.get_func(0x6329fc)
if fn:
    cur = fn.start_ea
    count = 0
    while cur < fn.end_ea and count < 800:
        line = idc.generate_disasm_line(cur, 0)
        if 'BLX' in line:
            m = re.search(r'BLX\s+(R\d+)', line)
            if m:
                reg = m.group(1)
                # Show context
                ctx = cur
                for _ in range(8):
                    ctx = idc.prev_head(ctx, fn.start_ea)
                print(f"\n  Possible dispatch at {cur:#x} via {reg}:")
                for _ in range(16):
                    l = idc.generate_disasm_line(ctx, 0)
                    marker = " <-- DISPATCH" if ctx == cur else ""
                    print(f"    {ctx:#x}: {l}{marker}")
                    if "BL " in l or "BLX" in l:
                        m2 = re.search(r'B(LX?)\s+(\S+)', l)
                        if m2:
                            t = m2.group(2)
                            if not t.startswith('R'):
                                fn_name = idc.get_func_name(int(t, 16)) if t.startswith('0x') else t
                                print(f"      -> {t} ({fn_name})")
                    ctx = idc.next_head(ctx, fn.end_ea)
                    if ctx >= fn.end_ea:
                        break
        cur = idc.next_head(cur, fn.end_ea)
        count += 1

# Also look at what happens right after mutable_mon_info returns
# The handler should access mon_info and do something with it
print("\n\n=== Functions that reference both mon_info and scene/level ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'MessageHandler' in name and 'handle' in name.lower():
            # Check if this function contains interesting strings
            fn = idaapi.get_func(ea)
            if fn and fn.end_ea - fn.start_ea > 200:  # non-trivial handlers
                # Look for interesting names called from this handler
                pass  # too slow to check all

# Key approach: find the handler by looking at the map insertion
# In registerMessageHandlerFunction, handler funcs are inserted into a map
print("\n\n=== Register handler: looking at 0x637514 area ===")
for cur in range(0x637500, 0x637600, 2):
    line = idc.generate_disasm_line(cur, 0)
    if 'BL ' in line or 'BLX' in line:
        m = re.search(r'B(LX?)\s+(0x[0-9A-Fa-f]+)', line)
        if m:
            target = int(m.group(2), 16)
            fn_name = idc.get_func_name(target)
            if fn_name and 'Handler' in fn_name:
                print(f"  {cur:#x}: {line} -> {fn_name}")

idaapi.qexit(0)
