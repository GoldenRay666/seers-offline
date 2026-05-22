import idaapi, idc, idautils, re
idaapi.auto_wait()

# Find the select_main_mon_out handler by looking at what the handler map entry contains
# The handler is registered in registerMessageHandlerFunction
# Let me dump the function and look for where select_main_mon_out is paired with a handler
print("=== registration around select_main_mon_out string ===")
# String is at 0x9a3519, XREF from 0x637574
# The pair construction is at 0x637596
# Let's see what function pointer is passed
ea = 0x637560
fn = idaapi.get_func(ea)
if fn:
    cur = 0x637550
    for _ in range(40):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        if "LDR" in line and "=" in line:
            m = re.search(r'=\s*(0x[0-9A-Fa-f]+)', line)
            if m:
                val = int(m.group(1), 16)
                if 0x620000 <= val <= 0x640000:
                    nm = idc.get_func_name(val)
                    print(f"      *** GOT value {val:#x} -> {nm}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea: break

# Alternative: search ALL MessageHandler::handle* functions for those 
# that contain mon_info or mutable_mon_info references
print("\n=== MessageHandler functions with mon_info references ===")
for seg in idautils.Segments():
    for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
        name = idc.get_func_name(ea)
        if not ('MessageHandler' in name and 'handle' in name.lower()):
            continue
        fn = idaapi.get_func(ea)
        if fn.end_ea - fn.start_ea < 50: continue  # too small
        # Check if function calls any mon_info-related function
        cur = fn.start_ea
        found = False
        for _ in range(100):
            line = idc.generate_disasm_line(cur, 0)
            if 'BL ' in line:
                m = re.search(r'BL\s+(0x[0-9A-Fa-f]+)', line)
                if m:
                    t = int(m.group(1), 16)
                    tn = idc.get_func_name(t)
                    if tn and ('mon_info' in tn.lower() or 'mutable_mon' in tn.lower()):
                        found = True
                        break
            cur = idc.next_head(cur, fn.end_ea)
            if cur >= fn.end_ea: break
        if found:
            print(f"  {name} at {ea:#x}")
            # Also check for LevelManager/getCurrentLevelLayer calls
            cur = fn.start_ea
            for _ in range(100):
                line = idc.generate_disasm_line(cur, 0)
                if 'BL ' in line:
                    m = re.search(r'BL\s+(0x[0-9A-Fa-f]+)', line)
                    if m:
                        t = int(m.group(1), 16)
                        tn = idc.get_func_name(t)
                        if tn and ('getSpriteSeer' in tn or 'getCurrentLevel' in tn or 'SceneLayer' in tn):
                            print(f"      Also calls: {tn}")
                cur = idc.next_head(cur, fn.end_ea)
                if cur >= fn.end_ea: break

idaapi.qexit(0)
