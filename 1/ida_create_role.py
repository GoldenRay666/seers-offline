"""Decompile handleAckMsgCreateRole"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_create_role_out.txt"

def decompile_func(ea, name):
    try:
        cfunc = ida_hexrays.decompile(ea)
        if cfunc:
            sv = cfunc.get_pseudocode()
            lines = []
            for i in range(sv.size()):
                lines.append(sv[i].line)
            return "\n".join(lines)
        return "// FAILED\n"
    except Exception as e:
        return f"// EXCEPTION: {e}\n"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        f.write(decompile_func(0x62eed8, "handleAckMsgCreateRole"))
        f.write("\n\n// DISASM:\n")
        ea = 0x62eed8
        for i in range(200):
            insn = idc.generate_disasm_line(ea, 0)
            f.write(f"  0x{ea:x}: {insn}\n")
            ea = idc.next_head(ea)
    print(f"[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
