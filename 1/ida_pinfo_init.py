"""Decompile player_info_t::IsInitialized"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_pinfo_init.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "player_info_t" in name and "IsInitialized" in name and "Comm" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(50):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")

        # Also dump ALL player_info_t Merge cases with wire type info
        f.write("\n// === player_info_t Merge: full case list ===\n")
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "player_info_t" in name and "MergePartial" in name and "Comm" in name:
                addr = ea
                for i in range(300):
                    insn = idc.generate_disasm_line(addr, 0)
                    # Annotate wire type checks
                    if "ANDS" in idc.print_insn_mnem(addr) and "R6" in insn:
                        f.write(f"  0x{addr:x}: {insn}  ;; wire type check\n")
                    elif "CMP" in idc.print_insn_mnem(addr) and ("R3" in insn or "R0" in insn):
                        f.write(f"  0x{addr:x}: {insn}  ;; compare\n")
                    else:
                        f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                break

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
