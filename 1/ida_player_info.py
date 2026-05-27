"""Decompile player_info_t MergePartialFromCodedStream"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_player_info_m.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "player_info_t" in name and "MergePartial" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                # Pseudocode
                try:
                    cfunc = ida_hexrays.decompile(ea)
                    if cfunc:
                        sv = cfunc.get_pseudocode()
                        lines = [sv[i].line for i in range(sv.size())]
                        f.write("\n".join(lines) + "\n")
                except: pass

                # Disassembly
                addr = ea
                for i in range(200):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    mnem = idc.print_insn_mnem(addr)
                    if "BL" in mnem:
                        target = idc.get_operand_value(addr, 0)
                        sym = idc.get_name(target)
                        if sym: f.write(f"     → {sym}\n")
                    # Mark field parsing
                    if mnem in ("CMP", "LDRB", "LDRH", "LDR", "ADDS") and "R3" in idc.print_operand(addr, 0):
                        pass
                    addr = idc.next_head(addr)
                f.write("\n")
                break

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
