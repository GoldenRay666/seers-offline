import idaapi
import idc
import idautils

idaapi.auto_wait()

# Get the descriptor() function and extract the field descriptor table
descriptor_ea = idc.get_name_ea(idaapi.BADADDR, "_ZN14ISeer20CSProto19select_main_mon_out10descriptorEv")
print(f"descriptor() at {descriptor_ea:#x}")

if descriptor_ea != idaapi.BADADDR:
    fn = idaapi.get_func(descriptor_ea)
    if fn:
        cur = fn.start_ea
        for _ in range(25):
            disasm = idc.generate_disasm_line(cur, 0)
            print(f"  {cur:#x}: {disasm}")
            # Look for ADR or LDR instructions that load the descriptor pointer
            if "LDR" in disasm and "=" in disasm:
                print(f"    ^^^ POINTER reference!")
            cur = idc.next_head(cur, fn.end_ea)

# Also look at the vtable for select_main_mon_out at 0x224fa4
vtable = 0x224fa4
print(f"\n=== VTable at {vtable:#x} ===")
# Read 30 entries from vtable
for i in range(30):
    addr = vtable + i * 4
    val = idc.get_wide_dword(addr)
    name = idc.get_name(val) or ""
    print(f"  [{i:2d}] {addr:#x}: {val:#010x} {name}")

# Now find the field descriptor table - search for a data structure
# that has: name ptr, field number 1, type, label, message type ptr
# near the descriptor data

# Protobuf's internal::FieldDescriptor has this layout in memory:
# offset 0: name_ (const char*)
# offset 4: number_ (int) 
# offset 8: type_ (FieldDescriptor::Type)
# offset 12: label_ (FieldDescriptor::Label)
# ... more fields

# Search for data that matches field_number = 1
print("\n=== Searching for field descriptor with number=1 ===")
# Look at the default_instance area around 0x25c5a7
default_ea = idc.get_name_ea(idaapi.BADADDR, "_ZN14ISeer20CSProto19select_main_mon_out16default_instanceEv")
if default_ea != idaapi.BADADDR:
    print(f"default_instance at {default_ea:#x}")
    fn = idaapi.get_func(default_ea)
    if fn:
        cur = fn.start_ea
        for _ in range(20):
            print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
            cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
