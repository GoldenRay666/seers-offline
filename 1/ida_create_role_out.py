"""Decompile cli_create_role_out Merge"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_create_role_merge.txt"

def main():
    idaapi.auto_wait()
    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "cli_create_role_out" in name and "Merge" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                for i in range(300):
                    insn = idc.generate_disasm_line(ea, 0)
                    f.write(f"  0x{ea:x}: {insn}\n")
                    ea = idc.next_head(ea)
                f.write("\n")
    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
