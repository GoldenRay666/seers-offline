import idaapi
import idc
import idautils

idaapi.auto_wait()

# Find the pointer variable
ptr_name = "_ZN14ISeer20CSProto19select_main_mon_out17default_instance_E_ptr"
ea = idc.get_name_ea(idaapi.BADADDR, ptr_name)
if ea != idaapi.BADADDR:
    print(f"[+] default_instance_E_ptr at {ea:#x}")
    # Read the pointer value
    ptr_val = idc.get_wide_dword(ea)
    print(f"  Pointer value: {ptr_val:#x}")
    
    # Follow the pointer to the default_instance address
    default_addr = idc.get_wide_dword(ptr_val)
    print(f"  default_instance at: {default_addr:#x}")
    
    # Read the default instance data (ISeer20CSProto::select_main_mon_out object)
    # It's 12 bytes (vtable + mon_info ptr + has_bits)
    print(f"\n  Object data:")
    for i in range(12):
        b = idc.get_wide_byte(default_addr + i)
        print(f"    [{i:2d}] = {b:#04x}")
    
    # The mon_info pointer is at offset 8
    mon_info_ptr = idc.get_wide_dword(default_addr + 8)
    print(f"\n  mon_info pointer: {mon_info_ptr:#x}")
    
    if mon_info_ptr:
        # Read mon_info object (44 bytes)
        print(f"\n  mon_info object data:")
        for i in range(44):
            b = idc.get_wide_byte(mon_info_ptr + i)
            print(f"    [{i:2d}] = {b:#04x}")
        
        # basic_info at offset 8
        basic_info_ptr = idc.get_wide_dword(mon_info_ptr + 8)
        print(f"\n  basic_info pointer: {basic_info_ptr:#x}")
        if basic_info_ptr:
            print(f"  basic_info data (first 120 bytes):")
            for i in range(120):
                b = idc.get_wide_byte(basic_info_ptr + i)
                print(f"    [{i:3d}] = {b:#04x}")
else:
    print(f"[-] {ptr_name} not found")
    # Try other name patterns
    for seg in idautils.Segments():
        for head in idautils.Heads(seg, idc.get_segm_end(seg)):
            flags = idc.get_full_flags(head)
            if idc.is_strlit(flags):
                s = idc.get_strlit_contents(head)
                if s and b'default_instance_E' in s and b'select_main_mon' in s:
                    print(f"  String at {head:#x}: {s.decode()}")

idaapi.qexit(0)
