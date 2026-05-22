"""Extract proto field info from IsInitialized + Serialize functions."""
import idaapi, idautils, idc, ida_bytes, re

idaapi.auto_wait()

# Key proto types we need to understand
targets = {
    # PVP data messages
    'pvp_data': [
        '_ZNK14ISeer20CSProto12get_pvp_data',
        '_ZNK14ISeer20CSProto13get_pvp_data',
    ],
    # Task messages
    'task': [
        '_ZNK14ISeer20CSProto12obtain_task',
        '_ZNK14ISeer20CSProto11finish_task',
        '_ZNK14ISeer20CSProto13get_task_list',
        '_ZNK14ISeer20CSProto12pb_cs_task',
    ],
    # Map events
    'map_event': [
        '_ZNK14ISeer20CSProto15submit_map_event',
    ],
    # NPC dialog / text msg
    'text_msg': [
        '_ZNK14ISeer20CSProto8text_msg',
        '_ZNK14ISeer20CSProto13notify_text_msg',
    ],
    # Functional switch (guide-related)
    'switch': [
        '_ZNK14ISeer20CSProto21functional_switch_info',
    ],
    # Player info
    'player_basic': [
        '_ZNK14ISeer20Comm17player_basic_info',
    ],
}

def analyze_related_functions(name_prefix):
    """Find and analyze all functions with given prefix."""
    results = []
    for ea in idautils.Names():
        name = idc.get_name(ea)
        if name and name_prefix in name:
            fn = idaapi.get_func(ea)
            if fn:
                results.append((name, fn))
    return results

def extract_mask_from_IsInitialized(fn_ea):
    """Extract the bitmask used in IsInitialized."""
    fn = idaapi.get_func(fn_ea)
    if not fn:
        return None
    cur = fn.start_ea
    end = fn.end_ea
    masks = []
    while cur < end:
        disasm = idc.generate_disasm_line(cur, 0)
        # Look for ANDS patterns: ANDS R0, R3 / ANDS R3, R0
        if 'ANDS' in disasm:
            m = re.search(r'ANDS\s+\w+,\s+#(0x[0-9A-Fa-f]+)', disasm)
            if m:
                masks.append(int(m.group(1), 16))
        cur = idc.next_head(cur, end)
    return masks

def analyze_serialize(fn_ea):
    """Extract field numbers and wire types from Serialize function."""
    fn = idaapi.get_func(fn_ea)
    if not fn:
        return []
    cur = fn.start_ea
    end = fn.end_ea
    fields = []
    current_tag = None

    while cur < end and len(fields) < 30:
        disasm = idc.generate_disasm_line(cur, 0)

        # Detect field tags from STRB
        if 'STRB' in disasm:
            # Look for preceding MOVS with the tag value
            # Pattern: MOVS R3, #0x0A ; STRB R3, [R5] => field 1 wire 2
            prev = idc.prev_head(cur)
            prev2 = idc.prev_head(prev)
            for p in [prev, prev2, idc.prev_head(prev2)]:
                pd = idc.generate_disasm_line(p, 0)
                m = re.search(r'MOVS\s+\w+,\s+#(0x[0-9A-F]+)', pd)
                if m:
                    tag = int(m.group(1), 16)
                    if 0x08 <= tag <= 0xFF:
                        fn = tag >> 3
                        wt = tag & 7
                        if fn <= 50 and wt <= 5:
                            # Also detect WriteVarint32 vs WriteVarint32SignExtended
                            has_signed = False
                            for look_ahead in range(1, 10):
                                la = idc.next_head(cur + look_ahead, end)
                                if la >= end:
                                    break
                                la_disasm = idc.generate_disasm_line(la, 0)
                                if 'WriteVarint32SignExtended' in la_disasm:
                                    has_signed = True
                                    break
                                if 'BL' in la_disasm or 'WriteVarint32ToArray' in la_disasm:
                                    break

                            wt_name = {0: 'VARINT', 2: 'LENGTH_DELIMITED', 5: 'FIXED32'}
                            fields.append({
                                'field': fn,
                                'wire': wt_name.get(wt, f'wire{wt}'),
                                'signed': has_signed
                            })
                            current_tag = fn
                            break

        cur = idc.next_head(cur, end)

    return fields

# Main analysis
out_path = 'C:/javatools/1/proto_field_analysis.txt'
with open(out_path, 'w') as f:
    # Focus on mon_basic_info_t first (we know it best)
    for ea in idautils.Names():
        name = idc.get_name(ea)
        if 'mon_basic_info_t' in name and 'IsInitialized' in name and 'BTL' not in name:
            fn = idaapi.get_func(ea)
            if fn:
                masks = extract_mask_from_IsInitialized(fn.start_ea)
                f.write(f"\n=== {name} IsInitialized masks: {[hex(m) for m in masks]} ===\n")
                for h in idautils.Heads(fn.start_ea, min(fn.start_ea + 0x80, fn.end_ea)):
                    f.write(f"  {h:#x}: {idc.generate_disasm_line(h, 0)}\n")

    # Find pvp_data IsInitialized
    for ea in idautils.Names():
        name = idc.get_name(ea)
        if 'pvp' in name and 'IsInitialized' in name:
            fn = idaapi.get_func(ea)
            if fn:
                f.write(f"\n=== {name} at {fn.start_ea:#x} ===\n")
                for h in idautils.Heads(fn.start_ea, min(fn.start_ea + 0x60, fn.end_ea)):
                    f.write(f"  {h:#x}: {idc.generate_disasm_line(h, 0)}\n")

    # Find functional_switch_info IsInitialized
    for ea in idautils.Names():
        name = idc.get_name(ea)
        if 'functional_switch' in name and 'IsInitialized' in name:
            fn = idaapi.get_func(ea)
            if fn:
                f.write(f"\n=== {name} at {fn.start_ea:#x} ===\n")
                for h in idautils.Heads(fn.start_ea, min(fn.start_ea + 0x60, fn.end_ea)):
                    f.write(f"  {h:#x}: {idc.generate_disasm_line(h, 0)}\n")

    # Find text_msg IsInitialized
    for ea in idautils.Names():
        name = idc.get_name(ea)
        if 'text_msg' in name and 'IsInitialized' in name:
            fn = idaapi.get_func(ea)
            if fn:
                f.write(f"\n=== {name} at {fn.start_ea:#x} ===\n")
                for h in idautils.Heads(fn.start_ea, min(fn.start_ea + 0x60, fn.end_ea)):
                    f.write(f"  {h:#x}: {idc.generate_disasm_line(h, 0)}\n")

    # Find all message handler entries
    f.write("\n=== Message Handler Analysis ===\n")
    handler_ea = idc.get_name_ea(idaapi.BADADDR, '_ZN14MessageHandler13handleMessageEP18NORMAL_MSG_PACKAGE')
    if handler_ea != idaapi.BADADDR:
        fn = idaapi.get_func(handler_ea)
        if fn:
            f.write(f"handleMessage(NORMAL_MSG_PACKAGE) at {fn.start_ea:#x} ({fn.end_ea - fn.start_ea} bytes)\n")
            # Extract string references for message type names
            cur = fn.start_ea
            seen_strings = set()
            while cur < fn.end_ea:
                disasm = idc.generate_disasm_line(cur, 0)
                s_match = re.search(r'"([^"]+)"', disasm)
                if s_match:
                    s = s_match.group(1)
                    if 'ISeer20CSProto' in s and 'in' in s:
                        seen_strings.add(s)
                cur = idc.next_head(cur, fn.end_ea)
            for s in sorted(seen_strings):
                f.write(f"  HANDLES: {s}\n")

    f.write("\n=== DONE ===\n")

idaapi.qexit(0)
