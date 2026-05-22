import idaapi
import idc

idaapi.auto_wait()

ea = 0x55fba0

# Check bytes before the function
print(f"=== Bytes before getChildrenByTag ===")
for i in range(-8, 0):
    b = idc.get_wide_byte(ea + i)
    print(f"  +{i}: {b:#04x}")

# Check bytes after the function
fn = idaapi.get_func(ea)
if fn:
    print(f"\n=== Function: {fn.start_ea:#x} - {fn.end_ea:#x} ===")
    # Check bytes at the end of the function
    end = fn.end_ea
    for i in range(0, 8):
        b = idc.get_wide_byte(end + i)
        print(f"  end+{i}: {b:#04x}")

# Find empty/nop space near the function
print(f"\n=== Looking for empty space near {ea:#x} ===")
for offset in range(-0x100, 0x200, 2):
    addr = ea + offset
    if addr < 0x550000: continue
    b = idc.get_wide_byte(addr)
    b2 = idc.get_wide_byte(addr+1)
    # Check for 0x0000 (padding) or 0xBF00 (NOP)
    if b == 0x00 and b2 == 0x00 and idc.get_wide_byte(addr+2) == 0x00 and idc.get_wide_byte(addr+3) == 0x00:
        # Found 4 bytes of zeros - could be padding
        # Check if it's not in the middle of a function
        fn2 = idaapi.get_func(addr)
        if not fn2:
            print(f"  Empty bytes at {addr:#x}: {b:#04x} {b2:#04x} {idc.get_wide_byte(addr+2):#04x} {idc.get_wide_byte(addr+3):#04x}")
            break

# Find functions that call getChildrenByTag
print(f"\n=== XREFs to getChildrenByTag ===")
import idautils
for xr in idautils.XrefsTo(ea):
    fn = idaapi.get_func(xr.frm)
    fn_name = idc.get_func_name(xr.frm) if fn else "?"
    print(f"  Called from {xr.frm:#x} ({fn_name})")

idaapi.qexit(0)
