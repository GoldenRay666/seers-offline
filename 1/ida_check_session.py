"""Decompile handleAckMsgCheckSession and its message Merge"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_check_session_out.txt"

def decompile_func(ea, name):
    try:
        cfunc = ida_hexrays.decompile(ea)
        if cfunc:
            sv = cfunc.get_pseudocode()
            lines = []
            for i in range(sv.size()):
                lines.append(sv[i].line)
            return f"// {name} @ 0x{ea:x}\n" + "\n".join(lines) + "\n"
        return "// FAILED\n"
    except:
        return "// EXCEPTION\n"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        # 1. handler
        f.write(decompile_func(0x62f134, "handleAckMsgCheckSession"))

        # 2. Merge for cli_check_session_out
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "check_session_out" in name and "Merge" in name:
                f.write(f"\n// Found: {name} @ 0x{ea:x}\n")
                f.write(decompile_func(ea, name))

        # 3. Also dump raw disasm for the handler (first 100 instructions)
        f.write("\n\n// === RAW DISASM handleAckMsgCheckSession ===\n")
        ea = 0x62f134
        for i in range(100):
            insn = idc.generate_disasm_line(ea, 0)
            f.write(f"  0x{ea:x}: {insn}\n")
            ea = idc.next_head(ea)

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
