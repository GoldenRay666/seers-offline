"""Find m_userInfo_ptr references in handleMsgLoginIn and surrounding code that writes to offset 0"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_login_mui.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        # Search ALL functions for code that loads m_userInfo_ptr AND then writes to offset 0
        # The pattern is: LDR Rx, [Ry, #m_userInfo_ptr_GOT_offset] → STRx Rz, [Rx] or STRx Rz, [Rx, #0]

        mui_ptr_name = "_ZN8UserData10m_userInfoE_ptr"
        mui_ptr_ea = idc.get_name_ea_simple(mui_ptr_name)
        f.write(f"// m_userInfo_ptr at 0x{mui_ptr_ea:x}\n\n")

        # Find all xrefs to m_userInfo_ptr
        f.write("// All xrefs to m_userInfo_ptr:\n")
        for xref in idautils.XrefsTo(mui_ptr_ea):
            func_name = idc.get_func_name(xref.frm)
            f.write(f"//   0x{xref.frm:x} in {func_name}\n")
            # Show context around the xref
            ea = xref.frm
            for offset in [-8, -4, 0, 4, 8, 12, 16, 20, 24]:
                addr = ea + offset
                try:
                    insn = idc.generate_disasm_line(addr, 0)
                    prefix = ">>>" if offset == 0 else "   "
                    f.write(f"//   {prefix} 0x{addr:x}: {insn}\n")
                except:
                    pass
            f.write("\n")

        # Specifically for handleMsgLoginIn, decompile the parts that write to m_userInfo
        f.write("\n// === handleMsgLoginIn: searching for writes near m_userInfo_ptr loads ===\n")
        login_ea = 0x62FD5C
        login_end = login_ea + 3200

        # Find all LDR instructions that reference the GOT
        for ea in range(login_ea, login_end, 2):  # Thumb: 2-byte alignment
            try:
                mnem = idc.print_insn_mnem(ea)
                if mnem in ("STR", "STRB", "STRH"):
                    disasm = idc.generate_disasm_line(ea, 0)
                    f.write(f"  0x{ea:x}: {disasm}\n")
            except:
                pass

    print(f"[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
