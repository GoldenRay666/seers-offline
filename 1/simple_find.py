import idaapi, idautils, idc
import sys

# Write to a file since stdout might not work
out = open('/c/javatools/1/ida_fields.txt', 'w')

for ea in idautils.Names():
    name = idc.get_name(ea)
    if 'FieldNumber' in name:
        # Find xrefs to get the actual field number value
        out.write(f'{name}\n')

out.close()
idc.qexit(0)
