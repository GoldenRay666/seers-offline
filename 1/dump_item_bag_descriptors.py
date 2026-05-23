import idaapi
import idc
import idautils

idaapi.auto_wait()

TYPE_NAMES = {
    1: "DOUBLE", 2: "FLOAT", 3: "INT64", 4: "UINT64",
    5: "INT32", 6: "FIXED64", 7: "FIXED32", 8: "BOOL",
    9: "STRING", 10: "GROUP", 11: "MESSAGE", 12: "BYTES",
    13: "UINT32", 14: "ENUM", 15: "SFIXED32", 16: "SFIXED64",
    17: "SINT32", 18: "SINT64"
}
LABEL_NAMES = {1: "OPTIONAL", 2: "REQUIRED", 3: "REPEATED"}

def dump_descriptor(name, ea):
    """Dump a proto descriptor by reading the Descriptor* object at ea"""
    fn = idaapi.get_func(ea)
    if not fn:
        print(f"  No function at {ea:#x}")
        return

    # Disassemble the descriptor function to find the Descriptor* reference
    cur = fn.start_ea
    for _ in range(20):
        line = idc.generate_disasm_line(cur, 0)
        print(f"    {cur:#x}: {line}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur == idaapi.BADADDR:
            break

    # Try to find the Descriptor* by looking at LDR Rd, =ptr patterns
    # The descriptor() function typically loads a pointer from the literal pool
    print(f"\n  Looking for Descriptor* references in {name}...")
    cur = fn.start_ea
    while cur < fn.end_ea:
        mnem = idc.print_insn_mnem(cur)
        if mnem == 'LDR':
            # Check if it loads from a literal pool (PC-relative)
            ops = idc.print_operand(cur, 1)
            if '=' in ops:
                # Extract the literal address
                try:
                    lit_str = ops.split('=')[1].strip()
                    lit_addr = int(lit_str, 16)
                    desc_ptr = idc.get_wide_dword(lit_addr)
                    if desc_ptr and desc_ptr != 0xFFFFFFFF:
                        # Check if this looks like a Descriptor* (has a vtable ptr)
                        vtable = idc.get_wide_dword(desc_ptr)
                        if vtable and vtable != 0xFFFFFFFF and vtable > 0x1000:
                            # Try to read the name field
                            name_ptr = idc.get_wide_dword(desc_ptr + 4)
                            if name_ptr and name_ptr != 0xFFFFFFFF:
                                try:
                                    desc_name = idc.get_strlit_contents(name_ptr + 1, 64, idc.STRTYPE_C)
                                    if desc_name:
                                        print(f"  Descriptor* found at {desc_ptr:#x}, name={desc_name}")
                                        dump_descriptor_fields(desc_ptr, desc_name.decode('utf-8', errors='replace'))
                                        return
                                except:
                                    pass
                except:
                    pass
        cur = idc.next_head(cur, fn.end_ea)

    # Alternative: search for all Descriptor objects in the data section
    print(f"  Could not find Descriptor* from function, searching data section...")

def dump_descriptor_fields(desc_ptr, name):
    """Dump fields from a protobuf Descriptor object"""
    # Protobuf 2.x Descriptor layout (approximate):
    # +0: vtable
    # +4: name_ (string*)
    # +8: full_name_ (string*)
    # +12: file_ (FileDescriptor*)
    # +16: containing_type_ (Descriptor*)
    # +20: fields_ (FieldDescriptor**)
    # +24: fields_count
    # +28: fields_capacity
    # +32: ...
    # +36: oneof_decls_
    # etc.

    # Read full_name
    full_name_ptr = idc.get_wide_dword(desc_ptr + 8)
    if full_name_ptr and full_name_ptr != 0xFFFFFFFF:
        fn = idc.get_strlit_contents(full_name_ptr + 1, 128, idc.STRTYPE_C)
        if fn:
            print(f"  Full name: {fn.decode('utf-8', errors='replace')}")

    # Read fields vector
    fields_ptr = idc.get_wide_dword(desc_ptr + 20)
    field_count = idc.get_wide_dword(desc_ptr + 24)
    print(f"  Fields vector at {fields_ptr:#x}, count={field_count}")

    if not fields_ptr or fields_ptr == 0xFFFFFFFF or field_count == 0 or field_count > 200:
        print(f"  Invalid fields vector, skipping")
        return

    for i in range(field_count):
        fd = idc.get_wide_dword(fields_ptr + i * 4)
        if not fd or fd == 0xFFFFFFFF:
            continue

        # FieldDescriptor layout (protobuf 2.x):
        # +0: vtable
        # +4: name_ (string*)
        # +8: full_name_ (string*)
        # +12: file_ (FileDescriptor*)
        # +16: containing_type_ (Descriptor*)
        # +20: message_type_ (Descriptor*, for message fields)
        # +24: enum_type_ (EnumDescriptor*, for enum fields)
        # +28: index_
        # +32: number_
        # +36: type_
        # +40: label_
        # +44: default_value_*

        fd_name_ptr = idc.get_wide_dword(fd + 4)
        fd_number = idc.get_wide_dword(fd + 32)
        fd_type = idc.get_wide_dword(fd + 36)
        fd_label = idc.get_wide_dword(fd + 40)

        if fd_name_ptr and fd_name_ptr != 0xFFFFFFFF:
            fd_name = idc.get_strlit_contents(fd_name_ptr + 1, 64, idc.STRTYPE_C)
            fd_name_str = fd_name.decode('utf-8', errors='replace') if fd_name else "?"
        else:
            fd_name_str = "?"

        type_str = TYPE_NAMES.get(fd_type, f"UNKNOWN({fd_type})")
        label_str = LABEL_NAMES.get(fd_label, f"UNKNOWN({fd_label})")

        # For message types, get the message type name
        msg_info = ""
        if fd_type == 11:  # TYPE_MESSAGE
            msg_desc = idc.get_wide_dword(fd + 20)
            if msg_desc and msg_desc != 0xFFFFFFFF:
                msg_name_ptr = idc.get_wide_dword(msg_desc + 4)
                if msg_name_ptr and msg_name_ptr != 0xFFFFFFFF:
                    msg_name = idc.get_strlit_contents(msg_name_ptr + 1, 64, idc.STRTYPE_C)
                    if msg_name:
                        msg_info = f" -> {msg_name.decode('utf-8', errors='replace')}"

        print(f"  Field #{fd_number}: {fd_name_str} type={type_str} label={label_str}{msg_info}")


# Search for key descriptor functions
TARGETS = [
    "cli_get_item",
    "notify_item_bag",
    "SaveItem",
    "one_t",
    "UserData"
]

found = set()

for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    for t in TARGETS:
        if t.lower() in name.lower() and 'descriptor' in name.lower():
            if name not in found:
                found.add(name)
                print(f"\n=== {name} @ {ea:#x} ===")
                dump_descriptor(name, ea)
                break

# Also search for FieldNumber constants related to item/bag
print("\n\n=== FieldNumber constants for item/bag ===")
for ea, name in idautils.Names():
    if 'FieldNumber' in name and ('item' in name.lower() or 'bag' in name.lower() or 'one_t' in name.lower() or 'save' in name.lower() or 'capacity' in name.lower()):
        val = idc.get_wide_dword(ea)
        print(f"  {name} @ {ea:#x}: raw={val:#x} ({val})")
        # Look for actual field number values nearby
        for off in range(0, 16):
            v = idc.get_wide_dword(ea + off)
            if 0 < v < 100:
                print(f"    off +{off}: {v}")

# Also check Names (not just Functions) for descriptor symbols
print("\n\n=== Named descriptor entries in data ===")
for ea, name in idautils.Names():
    for t in TARGETS:
        if t.lower() in name.lower() and 'descriptor' in name.lower() and not idc.get_func_name(ea):
            print(f"  {name} @ {ea:#x}")

idaapi.qexit(0)
