"""Decompile cli_check_session_out MergePartialFromCodedStream"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_cs_merge.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "cli_check_session_out" in name and "MergePartial" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(200):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    # Annotate key calls
                    mnem = idc.print_insn_mnem(addr)
                    if "BL" in mnem:
                        target = idc.get_operand_value(addr, 0)
                        sym = idc.get_name(target)
                        if sym: f.write(f"     → {sym}\n")
                    addr = idc.next_head(addr)
                f.write("\n")
    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
