import idautils, idc
out = open('C:/javatools/1/ida_out.txt', 'w')
count = 0
for ea in idautils.Names():
    name = idc.get_name(ea)
    if 'isNeed' in name or 'beginGuide' in name:
        out.write(f'{ea:#x}: {name}\n')
        count += 1
out.write(f'Total: {count}\n')
out.close()
idc.qexit(0)
