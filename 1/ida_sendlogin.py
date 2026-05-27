"""Decompile OnlineNetworkManager::sendLoginMessage"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_sendlogin.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "sendLoginMessage" in name and "OnlineNetworkManager" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(60):
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

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
