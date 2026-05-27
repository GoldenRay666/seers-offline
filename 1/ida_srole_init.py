"""Find server_role_t::IsInitialized"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_srole_init.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "server_role_t" in name and "IsInitialized" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(30):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")

        # Also find server_info_t::IsInitialized
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "server_info_t" in name and "IsInitialized" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(30):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
