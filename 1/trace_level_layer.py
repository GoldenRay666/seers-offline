import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

# Step 1: Dump the 4 callers of getChildrenByTag
# These are LevelLayer methods that crash when this=NULL
print("=== Callers of getChildrenByTag ===")

callers = [
    (0x55fc2a, "LevelLayer::getFollowSprite"),
    (0x55fcb6, "LevelLayer::getSpriteSeer"),
    (0x55fe36, "LevelLayer::getWildSprites"),
    (0x55ffaa, "LevelLayer::getTranspoints"),
]

for addr, name in callers:
    fn = idaapi.get_func(addr)
    if fn:
        print(f"\n--- {name} ({fn.start_ea:#x} - {fn.end_ea:#x}) ---")
        # Show first 15 instructions to understand what the function does
        cur = fn.start_ea
        for _ in range(15):
            line = idc.generate_disasm_line(cur, 0)
            print(f"  {cur:#x}: {line}")
            if "BL " in line or "BLX" in line:
                m = re.search(r'B(LX?)\s+(\S+)', line)
                if m:
                    t = m.group(2)
                    if not t.startswith('R'):
                        print(f"    -> {t}")
            cur = idc.next_head(cur, fn.end_ea)
            if cur >= fn.end_ea:
                break

        # Find who calls THIS function
        print(f"  == Called by:")
        for xr in idautils.XrefsTo(fn.start_ea):
            caller_fn = idaapi.get_func(xr.frm)
            cname = idc.get_func_name(xr.frm) if caller_fn else "?"
            print(f"    {xr.frm:#x} ({cname})")

# Step 2: Search for MessageHandler functions that handle select_main_mon_out
# Look for functions near the handleAckMsgMon* functions (around 0x62b4a8-0x62b5d8)
print("\n\n=== MessageHandler functions in handler area (0x629000-0x633000) ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        if 0x629000 <= ea <= 0x633000:
            name = idc.get_func_name(ea)
            if 'handle' in name.lower() or 'Handle' in name:
                if 'mon' in name.lower() or 'select' in name.lower() or 'Ack' in name:
                    print(f"  {name} at {ea:#x}")

# Step 3: Look for select_main_mon_out specifically
# The handler might have a mangled name. Let me search.
print("\n\n=== Search for select_main_mon_out handler ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'MessageHandler' in name and ('select' in name.lower() or 'MainMon' in name):
            print(f"  {name} at {ea:#x}")

# Step 4: Find functions that create/load LevelLayer
print("\n\n=== Functions that reference LevelLayer ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'LevelLayer' in name and ('create' in name.lower() or 'init' in name.lower() or 'get' in name.lower() or 'scene' in name.lower()):
            print(f"  {name} at {ea:#x}")

idaapi.qexit(0)
