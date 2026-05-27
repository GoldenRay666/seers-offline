"""Decompile handleAckMsgRecheckSession"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_recheck.txt"

def main():
    idaapi.auto_wait()

    # Find the handler
    ea = 0  # will find by name
    for f_ea in idautils.Functions():
        name = idc.get_func_name(f_ea)
        if "handleAckMsgRecheckSession" in name:
            ea = f_ea
            break

    with open(OUTPUT, 'w') as f:
        f.write(f"// handleAckMsgRecheckSession @ 0x{ea:x}\n")
        func = idaapi.get_func(ea)
        f.write(f"// size={func.size()}\n\n")
        addr = func.start_ea
        end = func.start_ea + func.size()
        while addr < end:
            insn = idc.generate_disasm_line(addr, 0)
            f.write(f"  0x{addr:x}: {insn}\n")
            mnem = idc.print_insn_mnem(addr)
            if "BL" in mnem:
                target = idc.get_operand_value(addr, 0)
                sym = idc.get_name(target)
                if sym: f.write(f"     → {sym}\n")
            addr = idc.next_head(addr)

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
