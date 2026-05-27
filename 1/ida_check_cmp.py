"""Dump exact comparison logic in handleAckMsgCheckSession"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_check_cmp.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        # Dump from 0x62f134 to 0x62f200 with detailed analysis
        ea = 0x62f134
        end = 0x62f200
        while ea < end:
            mnem = idc.print_insn_mnem(ea)
            disasm = idc.generate_disasm_line(ea, 0)
            op1 = idc.print_operand(ea, 0)
            op2 = idc.print_operand(ea, 1)
            f.write(f"0x{ea:x}: {disasm}\n")

            # Decode important instructions
            if mnem == "LDR" and "#" in op2:
                # PC-relative load - try to get the symbol
                try:
                    val = idc.get_operand_value(ea, 1)
                    name = idc.get_name(val)
                    if name:
                        f.write(f"  → loads offset for: {name}\n")
                except: pass

            if mnem == "CMP":
                f.write(f"  !! COMPARE: {op1} vs {op2}\n")

            if mnem in ("BEQ", "BNE", "BCC", "BCS"):
                target = idc.get_operand_value(ea, 0)
                f.write(f"  !! BRANCH to 0x{target:x}\n")

            ea = idc.next_head(ea)

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
