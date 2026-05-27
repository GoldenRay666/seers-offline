"""Dump ReadMessageNoVirtual<ISeer20Comm::player_info_t> at 0x59f45c"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_rmnv.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        ea = 0x59f45c
        func = idaapi.get_func(ea)
        if func:
            addr = func.start_ea
            end = func.start_ea + func.size()
            f.write(f"// size={func.size()} bytes\n\n")
            while addr < end:
                insn = idc.generate_disasm_line(addr, 0)
                f.write(f"  0x{addr:x}: {insn}\n")
                mnem = idc.print_insn_mnem(addr)
                if "BL" in mnem:
                    tgt = idc.get_operand_value(addr, 0)
                    sym = idc.get_name(tgt)
                    if sym: f.write(f"     => {sym}\n")
                # Highlight conditional branches
                if mnem in ("BEQ", "BNE", "BCC", "BCS", "BMI", "BPL"):
                    tgt = idc.get_operand_value(addr, 0)
                    f.write(f"     !! BRANCH to 0x{tgt:x}\n")
                addr = idc.next_head(addr)
        else:
            f.write("NOT A FUNCTION\n")

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
