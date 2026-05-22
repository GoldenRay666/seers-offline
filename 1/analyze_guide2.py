import idaapi, idautils, idc, ida_bytes
import sys

out = open('C:/javatools/1/guide_analysis2.txt', 'w')

# Try to find ALL symbols first
name_count = sum(1 for _ in idautils.Names())
out.write(f"Total named items: {name_count}\n")

# Search for any symbol containing "insert" or "GuideFunc"
for ea in idautils.Names():
    name = idc.get_name(ea)
    if 'insert' in name.lower() or 'GuideFunc' in name:
        out.write(f"{name} at {ea:#x}\n")

# Also try to read from the IDB directly
# Search for the string in memory
out.write("\n=== Searching for insertGuideFunc string ===\n")
seg = idaapi.get_segm_by_name('.text')
if seg:
    out.write(f".text: {seg.start_ea:#x} - {seg.end_ea:#x}\n")

out.close()
idc.qexit(0)
