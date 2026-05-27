"""Find handleAckMsgGetBagMon or get_bag_mon_out Merge"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_bagmon2.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if ("get_bag_mon" in name or "GetBagMon" in name) and "Merge" in name and "out" in name:
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
                            if off < 0x80:
                                f.write(f"     ;; +0x{off:x}\n")
                        except: pass
                    addr = idc.next_head(addr)
                f.write("\n")
                break

        # Also search by handler name
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "GetBagMon" in name or "getBagMon" in name:
                f.write(f"// Handler? {name} @ 0x{ea:x}\n")

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
