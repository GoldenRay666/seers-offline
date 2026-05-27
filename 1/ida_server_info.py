"""Decompile server_info_t MergePartial"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_server_info_m.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "server_info_t" in name and "MergePartial" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(150):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    mnem = idc.print_insn_mnem(addr)
                    if "BL" in mnem:
                        target = idc.get_operand_value(addr, 0)
                        sym = idc.get_name(target)
                        if sym: f.write(f"     → {sym}\n")
                    # Extract field mapping info
                    if "ADDS" in mnem and "R1" in idc.print_operand(addr, 0):
                        try:
                            imm = idc.get_operand_value(addr, 2)
                            if imm and imm < 0x200:
                                f.write(f"     ;; target offset: +0x{imm:x}\n")
                        except: pass
                    addr = idc.next_head(addr)
                f.write("\n")
                break
    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
