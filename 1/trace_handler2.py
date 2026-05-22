import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Step 1: Find the handler function for select_main_mon_out
# Look at the registration: registerMessageHandlerFunction at 0x6374xx
# The function pointer is extracted from the pair construction
print("=== Step 1: Find select_main_mon_out handler function ===")

# From the earlier output, the handler is registered around 0x637574
# Let me look at 0x637580 where the function pointer is loaded
ea = 0x637580
for i in range(10):
    line = idc.generate_disasm_line(ea, 0)
    print(f"  {ea:#x}: {line}")
    ea = idc.next_head(ea, 0x640000)

# Step 2: Dump the MessageHandler vtable or handler table
# The handler at 0x637580 loads a value from [R4,R3] where R3=0xFFFFE544
# This is a GOT-relative load. Let me try a different approach.

# Find all functions that call getChildrenByTag
print("\n=== Step 2: Find all callers of getChildrenByTag ===")
gct_eax = 0x55fba0
callers = []
for xr in idautils.XrefsTo(gct_eax):
    caller_fn = idaapi.get_func(xr.frm)
    fn_name = idc.get_func_name(xr.frm) if caller_fn else "?"
    callers.append((xr.frm, fn_name))
    print(f"  Called from {xr.frm:#x} ({fn_name})")

# Step 3: Look for the specific handler function
# Search for functions named like "handleSelectMainMon" or "handle*select*main*mon"
print("\n=== Step 3: Search for select_main_mon handler by name ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'select_main_mon' in name.lower() or ('mon' in name.lower() and 'handler' in name.lower()):
            print(f"  {name} at {ea:#x}")
        if 'Handle' in name and 'Mon' in name:
            print(f"  {name} at {ea:#x}")

# Step 4: Look at the dispatch loop in MessageHandler::handleMessage
# Focus on how it finds and calls the handler for select_main_mon_out
print("\n=== Step 4: Look at MessageHandler dispatch (0x6329fc) for handler lookup ===")
fn = idaapi.get_func(0x6329fc)
if fn:
    # Look for the part that calls the handler function pointer
    # Usually this involves loading from a map or table
    cur = fn.start_ea
    blx_count = 0
    while cur < fn.end_ea and blx_count < 10:
        line = idc.generate_disasm_line(cur, 0)
        if 'BLX' in line or 'BL ' in line:
            m = re.search(r'B(LX?)\s+(\S+)', line)
            if m:
                target = m.group(2)
                if target.startswith('R') or target == 'R3' or target == 'R4' or target == 'R5' or target == 'R6':
                    # Indirect call - this is likely the handler dispatch
                    blx_count += 1
                    print(f"\n  BLX {target} at {cur:#x} (possible handler dispatch #{blx_count})")
                    # Show surrounding code
                    ctx_start = idc.prev_head(cur, fn.start_ea)
                    for _ in range(10):
                        ctx_start = idc.prev_head(ctx_start, fn.start_ea)
                    ctx_cur = ctx_start
                    for _ in range(20):
                        l2 = idc.generate_disasm_line(ctx_cur, 0)
                        print(f"    {ctx_cur:#x}: {l2}")
                        ctx_cur = idc.next_head(ctx_cur, fn.end_ea)
                        if ctx_cur >= fn.end_ea:
                            break
        cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
