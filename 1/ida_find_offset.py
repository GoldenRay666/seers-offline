import idaapi
import idc
import idautils

idaapi.auto_wait()

# Search for all instructions that access offset 0x198 from a register
# Pattern: LDR/STR with #0x198 immediate
print("=== Instructions accessing offset 0x198 ===")
for seg_ea in idautils.Segments():
    seg = idaapi.getseg(seg_ea)
    if not seg: continue
    for head in idautils.Heads(seg.start_ea, seg.end_ea):
        disasm = idc.generate_disasm_line(head, 0)
        if disasm and '#0x198' in disasm:
            func_name = idc.get_func_name(head)
            print(f"  0x{head:X} in {func_name}: {disasm}")

# Find what type/struct has a member at offset 0x198
print("\n=== Structure definitions with 0x198 offset ===")
for i in range(idaapi.get_struc_qty()):
    sid = idaapi.get_struc_by_idx(i)
    sname = idaapi.get_struc_name(sid)
    if sname:
        for member in idautils.StructMembers(sid):
            if member.offset == 0x198:
                print(f"  {sname}::{member.name} @ 0x198 (size {member.size})")

# Also check: what type is ItemBagLayer?
print("\n=== ItemBagLayer related structures ===")
for i in range(idaapi.get_struc_qty()):
    sid = idaapi.get_struc_by_idx(i)
    sname = idaapi.get_struc_name(sid)
    if sname and ('ItemBag' in sname or 'BagLayer' in sname):
        size = idaapi.get_struc_size(sid)
        print(f"  {sname} size=0x{size:X}")

print("\n[DONE]")
