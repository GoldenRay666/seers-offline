import idaapi, idc, idautils, re
idaapi.auto_wait()

# The handler dispatch at 0x632a98 calls the handler via BLX R3
# After that, postHandleMsg is called
# The handler accesses the parsed message stored in MessageHandler
# Let me look at what's stored at what offsets in MessageHandler
# 
# In the dispatch code:
# - this+8 = handler map (std::map)
# - this+0xC = handler map end
# The parsed message is probably at some fixed offset
#
# Let me check what OFFSET in MessageHandler stores the parsed response
# by looking at MergePartialFromCodedStream callers

# Search for patterns where MessageHandler accesses parsed message data
print("=== Looking for MessageHandler fields that hold parsed messages ===")
# The dispatch flow:
# 1. Game receives raw data
# 2. Parses header proto -> gets cmd string
# 3. Looks up handler in map via cmd
# 4. Parses BODY proto into appropriate message type (stored somewhere in MessageHandler)
# 5. Calls handler (which accesses the parsed message)

# Find where the body proto is parsed
# Look for calls to MergePartialFromCodedStream from MessageHandler::handleMessage
fn = idaapi.get_func(0x6329fc)
if fn:
    cur = fn.start_ea
    for _ in range(150):
        line = idc.generate_disasm_line(cur, 0)
        if 'BL ' in line and ('read' in line.lower() or 'parse' in line.lower() or 'Merge' in line or 'ReadMessage' in line):
            m = re.search(r'BL\s+(0x[0-9A-Fa-f]+)', line)
            if m:
                t = int(m.group(1), 16)
                tn = idc.get_func_name(t)
                print(f"  {cur:#x}: {line}")
                print(f"    -> {tn}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea: break

# Also look for Lua-related activity after select_main_mon
# Game might use Lua for scene management
print("\n=== Lua calls in handleMessage area ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if 'GameDataManager4Lua' in name and 'get' in name:
            print(f"  {name} at {ea:#x}")

# Check what DATA the game needs: look for get_player_info, get_player_data, etc.
print("\n=== Messages related to player/role data ===")
# Search strings for these message types
for seg in idautils.Segments():
    seg_name = idc.get_segm_name(seg)
    if 'data' in seg_name.lower() or 'rodata' in seg_name.lower():
        for head in idautils.Heads(seg, idc.get_segm_end(seg)):
            if idc.is_strlit(idc.get_full_flags(head)):
                s = idc.get_strlit_contents(head)
                if s and b'get_player' in s:
                    print(f"  String at {head:#x}: {s}")

idaapi.qexit(0)
