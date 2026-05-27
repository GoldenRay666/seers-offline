"""Decompile ReadMessageNoVirtual<player_info_t> template instance"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_read_msg.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        # Search for the template instantiation
        target = None
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "ReadMessageNoVirtual" in name and "player_info_t" in name:
                target = ea
                f.write(f"// {name} @ 0x{ea:x}\n")
                break

        if target:
            func = idaapi.get_func(target)
            addr = func.start_ea
            end = func.start_ea + func.size()
            f.write(f"// size={func.size()}\n\n")
            while addr < end:
                insn = idc.generate_disasm_line(addr, 0)
                f.write(f"  0x{addr:x}: {insn}\n")
                mnem = idc.print_insn_mnem(addr)
                if "BL" in mnem:
                    tgt = idc.get_operand_value(addr, 0)
                    sym = idc.get_name(tgt)
                    if sym: f.write(f"     → {sym}\n")
                addr = idc.next_head(addr)

            # Also decompile
            try:
                cfunc = ida_hexrays.decompile(target)
                if cfunc:
                    sv = cfunc.get_pseudocode()
                    lines = [sv[i].line for i in range(sv.size())]
                    f.write("\n// === PSEUDOCODE ===\n")
                    f.write("\n".join(lines))
            except: pass

        # Also find ALL ReadMessageNoVirtual instances
        f.write("\n\n// === ALL ReadMessageNoVirtual instances ===\n")
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "ReadMessageNoVirtual" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
