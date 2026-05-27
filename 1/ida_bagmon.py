"""Find get_bag_mon_out Merge and its fields"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_bagmon.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "get_bag_mon" in name and "MergePartial" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(120):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    mnem = idc.print_insn_mnem(addr)
                    if "BL" in mnem:
                        tgt = idc.get_operand_value(addr, 0)
                        sym = idc.get_name(tgt)
                        if sym: f.write(f"     => {sym}\n")
                    if "ADDS" in mnem and "#" in idc.print_operand(addr,2):
                        try:
                            off = idc.get_operand_value(addr, 2)
                            if off < 0x100:
                                f.write(f"     ;; offset +0x{off:x}\n")
                        except: pass
                    addr = idc.next_head(addr)
                f.write("\n")
                break

        # Also find get_bag_mon_out handler
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "get_bag_mon" in name and "handle" in name.lower():
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(60):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")
                break

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
