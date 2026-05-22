import idaapi
import idc
import idautils

idaapi.auto_wait()

# Decompile the descriptor initializer called by select_main_mon_out::descriptor()
# The descriptor function calls sub_5AE230
init_ea = 0x5AE230
fn = idaapi.get_func(init_ea)
if fn:
    print(f"=== Descriptor initializer sub_5AE230 ({fn.start_ea:#x} - {fn.end_ea:#x}) ===")
    cur = fn.start_ea
    for _ in range(100):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea:
            break

# Also check what's at dword_AC6B84 (the descriptor data pointer for select_main_mon_out)
print("\n=== Data at AC6B84 ===")
for offset in range(0, 0x20, 4):
    addr = 0xAC6B84 + offset
    val = idc.get_wide_dword(addr)
    print(f"  {addr:#x}: {val:#x} ({val})")

# And for mon_info_t at AC6200
print("\n=== Data at AC6200 ===")
for offset in range(0, 0x60, 4):
    addr = 0xAC6200 + offset
    val = idc.get_wide_dword(addr)
    print(f"  {addr:#x}: {val:#x} ({val})")

idaapi.qexit(0)
