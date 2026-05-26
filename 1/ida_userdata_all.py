import idaapi, idc, idautils
idaapi.auto_wait()
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if "UserData" in name and len(name) < 100:
        sz = idc.get_func_attr(ea, idc.FUNCATTR_END) - ea
        if sz > 10:
            # Only show functions that SET/ADD/UPDATE data
            if any(x in name for x in ["set","Set","add","Add","update","Update","init","Init","receive","Receive","store","Store","save","Save"]):
                print(f"{sz:6d}  {ea:#08x}  {name}")
idaapi.qexit(0)
