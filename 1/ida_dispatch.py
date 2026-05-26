import idaapi, idc, idautils
idaapi.auto_wait()
# Search for dispatch/handler functions
for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    if ("handleResponse" in name or "onResponse" in name or "dispatch" in name or
        "processMsg" in name or "handleMsg" in name or "MessageHandler" in name or
        "onRecv" in name or "onReceive" in name or "handleCMD" in name or
        "onNetworkMsg" in name or "processPacket" in name or "handlePacket" in name):
        sz = idc.get_func_attr(ea, idc.FUNCATTR_END) - ea
        if 100 < sz < 5000:  # medium-large functions
            print(f"{sz:6d}  {ea:#08x}  {name}")
idaapi.qexit(0)
