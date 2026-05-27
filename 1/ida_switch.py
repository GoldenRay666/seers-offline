"""Decompile functional_switch_info_t Merge"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_switch.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "functional_switch_info_t" in name and "MergePartial" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(150):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    mnem = idc.print_insn_mnem(addr)
                    if "BL" in mnem:
                        tgt = idc.get_operand_value(addr, 0)
                        sym = idc.get_name(tgt)
                        if sym: f.write(f"     => {sym}\n")
                    # Show wire type checks
                    if "ANDS" in mnem and "R6" in insn:
                        f.write(f"     ;; WT check\n")
                    if "ADDS" in mnem and "#" in idc.print_operand(addr,2):
                        try:
                            off = idc.get_operand_value(addr, 2)
                            f.write(f"     ;; offset: +0x{off:x}\n")
                        except: pass
                    addr = idc.next_head(addr)
                f.write("\n")
                break
    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
