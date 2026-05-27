"""Find ISeer20Comm::player_info_t::MergePartialFromCodedStream"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_player_info_comm.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        f.write("// Searching for player_info_t Merge functions...\n")
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "player_info_t" in name and "MergePartial" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")

                # Disasm
                addr = ea
                for i in range(150):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    mnem = idc.print_insn_mnem(addr)
                    if "BL" in mnem:
                        target = idc.get_operand_value(addr, 0)
                        sym = idc.get_name(target)
                        if sym: f.write(f"     → {sym}\n")
                    addr = idc.next_head(addr)
                f.write("\n\n")

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
