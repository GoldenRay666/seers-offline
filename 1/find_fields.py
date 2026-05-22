import idaapi, idautils, idc
for ea in idautils.Names():
    name = idc.get_name(ea)
    if 'FieldNumber' in name and ('obtain_task' in name or 'player_enter_map' in name or 'submit_map' in name or 'mine_info' in name or 'task' in name):
        print(name)
idc.qexit(0)
