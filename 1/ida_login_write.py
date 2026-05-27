"""Search handleMsgLoginIn for writes to m_userInfo[0..3]"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_login_write.txt"

def main():
    idaapi.auto_wait()

    # Search for instructions that write to addresses 0xAC4094-0xAC4097 area
    # These are the 4 bytes of m_userInfo
    # The address is accessed via m_userInfo_ptr (GOT entry at 0xAB3028)

    # First, find the m_userInfo_ptr value
    # In IDA, the GOT entry at 0xAB3028 contains a pointer to 0xAC4094

    with open(OUTPUT, 'w') as f:
        f.write("// Searching for writes to m_userInfo[0..3] in handleMsgLoginIn\n")
        f.write("// m_userInfo_ptr at 0xAB3028\n")
        f.write("// m_userInfo at 0xAC4094 (bytes 0xAC4094-0xAC4097)\n\n")

        # The function is at 0x62FD5C, size ~3196 bytes
        func_start = 0x62FD5C
        func_end = func_start + 3200

        ea = func_start
        while ea < func_end:
            mnem = idc.print_insn_mnem(ea)
            # Look for STR instructions (store register)
            if mnem.startswith("STR"):
                # Get operands
                op1 = idc.print_operand(ea, 0)
                op2 = idc.print_operand(ea, 1)
                disasm = idc.generate_disasm_line(ea, 0)
                f.write(f"  0x{ea:x}: {disasm}\n")
            ea = idc.next_head(ea)

        f.write("\n// Done\n")

    print(f"[IDA] Done, output: {OUTPUT}")
    idc.qexit(0)

if __name__ == "__main__":
    main()
