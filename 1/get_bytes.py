import idaapi
import idc

idaapi.auto_wait()

# Dump raw bytes at getChildrenByTag (0x55fba0)
ea = 0x55fba0
print(f"=== Bytes at getChildrenByTag ({ea:#x}) ===")
for i in range(16):
    b = idc.get_wide_byte(ea + i)
    print(f"  +{i:#x}: {b:#04x}")

# Also dump the function that calls getChildrenByTag
# Check what's near the crash point
print(f"\n=== Disassembly around crash ===")
for i in range(-2, 12):
    addr = ea + i * 2  # Thumb instructions are 2 bytes
    if addr < ea: continue
    line = idc.generate_disasm_line(addr, 0)
    print(f"  {addr:#x}: {line}")

# Find xrefs to getChildrenByTag
print(f"\n=== XREFs to getChildrenByTag ===")
for xr in idautils.XrefsTo(ea):
    fn = idaapi.get_func(xr.frm)
    fn_name = idc.get_func_name(xr.frm) if fn else "?"
    print(f"  Called from {xr.frm:#x} ({fn_name})")

idaapi.qexit(0)
