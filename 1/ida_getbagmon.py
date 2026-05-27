"""Find handleAckMsgGetBagMon handler"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_getbagmon.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        # Find handler by name
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if ("get_bag_mon" in name or "GetBagMon" in name or "getBagMon" in name) and "handle" in name.lower():
                f.write(f"// {name} @ 0x{ea:x}\n")
                func = idaapi.get_func(ea)
                if func:
                    addr = func.start_ea
                    end = func.start_ea + func.size()
                    f.write(f"// size={func.size()}\n")
                    while addr < end:
                        insn = idc.generate_disasm_line(addr, 0)
                        f.write(f"  0x{addr:x}: {insn}\n")
                        mnem = idc.print_insn_mnem(addr)
                        if "BL" in mnem:
                            tgt = idc.get_operand_value(addr, 0)
                            sym = idc.get_name(tgt)
                            if sym: f.write(f"     => {sym}\n")
                        addr = idc.next_head(addr)
                f.write("\n")
                break

        # Also find get_bag_mon_out Merge
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "get_bag_mon_out" in name and "Merge" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(100):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")
                break

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
