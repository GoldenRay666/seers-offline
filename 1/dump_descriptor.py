import idaapi
import idc
import idautils

idaapi.auto_wait()

# The descriptor function loads descriptor from dword_AC6B88
# Let's read the descriptor data at that address
addr = 0xAC6B88
print(f"Reading descriptor pointer at {addr:#x}")
ptr = idc.get_wide_dword(addr)
print(f"Descriptor pointer: {ptr:#x}")

# Read the protobuf descriptor (it's a google::protobuf::Descriptor* object)
# In old protobuf, Descriptor has:
# +0: vtable
# +4: name_ (string*)
# +8: full_name_ (string*)
# +0xC: file_ (FileDescriptor*)
# +0x10: containing_type_ (Descriptor*)
# +0x14: fields_ (vector of FieldDescriptor*)
# +0x1C: fields_.size
# etc.

# Read name
name_ptr = idc.get_wide_dword(ptr + 4)
if name_ptr and name_ptr != 0xFFFFFFFF:
    try:
        name_len = idc.get_wide_byte(name_ptr + 4)
        name = idc.get_strlit_contents(name_ptr + 5, name_len)
        print(f"Descriptor name: {name}")
    except:
        print(f"Could not read name at {name_ptr:#x}")

# Read fields vector
fields_ptr = idc.get_wide_dword(ptr + 0x14)
field_count = idc.get_wide_dword(ptr + 0x1C)
print(f"Fields vector at: {fields_ptr:#x}, count: {field_count}")

# Iterate over fields
if fields_ptr and field_count < 50:
    for i in range(field_count):
        fd = idc.get_wide_dword(fields_ptr + i * 4)
        if fd:
            # FieldDescriptor layout:
            # +0: vtable
            # +4: name_ (string*)
            # +8: full_name_
            # +0xC: containing_type_ (Descriptor*)
            # +0x10: message_type_ (Descriptor* for message fields)
            # +0x14: index_
            # +0x18: number_
            # +0x1C: type_ (FieldDescriptor::Type enum)
            # +0x20: label_

            fd_name_ptr = idc.get_wide_dword(fd + 4)
            fd_number = idc.get_wide_dword(fd + 0x18)
            fd_type = idc.get_wide_dword(fd + 0x1C)
            fd_label = idc.get_wide_dword(fd + 0x20)

            # Type mapping (protobuf 2.x FieldDescriptor::Type)
            type_names = {
                1: "TYPE_DOUBLE", 2: "TYPE_FLOAT", 3: "TYPE_INT64",
                4: "TYPE_UINT64", 5: "TYPE_INT32", 6: "TYPE_FIXED64",
                7: "TYPE_FIXED32", 8: "TYPE_BOOL", 9: "TYPE_STRING",
                10: "TYPE_GROUP", 11: "TYPE_MESSAGE", 12: "TYPE_BYTES",
                13: "TYPE_UINT32", 14: "TYPE_ENUM", 15: "TYPE_SFIXED32",
                16: "TYPE_SFIXED64", 17: "TYPE_SINT32", 18: "TYPE_SINT64"
            }
            label_names = {
                1: "LABEL_OPTIONAL", 2: "LABEL_REQUIRED", 3: "LABEL_REPEATED"
            }

            type_str = type_names.get(fd_type, f"UNKNOWN({fd_type})")
            label_str = label_names.get(fd_label, f"UNKNOWN({fd_label})")

            if fd_name_ptr:
                name = idc.get_strlit_contents(fd_name_ptr + 1, 64)
            else:
                name = b"?"

            # For message types, also get the message type name
            msg_type_info = ""
            if fd_type == 11:  # TYPE_MESSAGE
                msg_desc = idc.get_wide_dword(fd + 0x10)
                if msg_desc:
                    msg_name_ptr = idc.get_wide_dword(msg_desc + 4)
                    if msg_name_ptr:
                        msg_name = idc.get_strlit_contents(msg_name_ptr + 1, 64)
                        msg_type_info = f" -> message: {msg_name}"

            print(f"  Field #{fd_number}: {name} type={type_str} label={label_str}{msg_type_info}")

# Now also find the mon_info_t descriptor
print("\n\n=== Looking for mon_info_t descriptor ===")
mon_info_desc_name = "_ZN11ISeer20Comm10mon_info_t10descriptorEv"
mon_ea = idc.get_name_ea(idaapi.BADADDR, mon_info_desc_name)
if mon_ea != idaapi.BADADDR:
    print(f"Found mon_info_t::descriptor at {mon_ea:#x}")
    fn = idaapi.get_func(mon_ea)
    if fn:
        cur = fn.start_ea
        for _ in range(15):
            print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
            cur = idc.next_head(cur, fn.end_ea)
else:
    print("mon_info_t::descriptor not found by exact name")
    # Search for it
    for seg in idautils.Segments():
        for ea in idautils.Functions(seg, idc.get_segm_end(seg)):
            name = idc.get_func_name(ea)
            if 'mon_info_t' in name and 'descriptor' in name:
                print(f"  Found: {name} at {ea:#x}")

idaapi.qexit(0)
