import idaapi
import idc
import idautils

idaapi.auto_wait()

# Find default_instance for select_main_mon_out
name = "_ZN14ISeer20CSProto19select_main_mon_out16default_instanceEv"
ea = idc.get_name_ea(idaapi.BADADDR, name)
if ea != idaapi.BADADDR:
    print(f"[+] default_instance() at {ea:#x}")
    fn = idaapi.get_func(ea)
    cur = fn.start_ea
    for _ in range(15):
        disasm = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {disasm}")
        # Look for LDR Rx, =(pointer) which loads default instance address
        if "LDR" in disasm and "=" in disasm:
            # Extract the pointer value
            import re
            m = re.search(r'=\s*(\S+)', disasm)
            if m:
                sym = m.group(1)
                addr = idc.get_name_ea(idaapi.BADADDR, sym)
                if addr != idaapi.BADADDR:
                    print(f"    -> {sym} at {addr:#x}")
                    # Read the default instance data
                    print(f"    Data at {addr:#x}:")
                    for i in range(32):
                        b = idc.get_wide_byte(addr + i)
                        print(f"      [{i:2d}] = {b:#04x} ({chr(b) if 32 <= b < 127 else '.'})")
        cur = idc.next_head(cur, fn.end_ea)

# Also find the default_instance pointer variable
print("\n=== Searching for default_instance symbols ===")
for seg in idautils.Segments():
    for head in idautils.Heads(seg, idc.get_segm_end(seg)):
        flags = idc.get_full_flags(head)
        if idc.is_strlit(flags):
            s = idc.get_strlit_contents(head)
            if s and b'select_main_mon_out' in s and b'default_instance' in s:
                # The variable is near this string
                print(f"  String at {head:#x}: {s.decode()}")
                # Search backwards for the data variable
                for offset in range(-20, 5):
                    addr = head + offset
                    val = idc.get_wide_dword(addr)
                    if val and 0x10000 < val < 0x200000:
                        print(f"    dword at {addr:#x} = {val:#x}")

idaapi.qexit(0)
