"""Decompile sub_59F4B6 - the real player_basic_info_t field parser"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_sub_59F4B6_out.txt"

def decompile_func(ea, name):
    try:
        cfunc = ida_hexrays.decompile(ea)
        if cfunc:
            sv = cfunc.get_pseudocode()
            lines = []
            for i in range(sv.size()):
                lines.append(sv[i].line)
            return "\n".join(lines)
        return f"// FAILED\n"
    except Exception as e:
        return f"// EXCEPTION: {e}\n"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        f.write("=" * 60 + "\n")
        f.write("sub_59F4B6 decompilation\n")
        f.write("=" * 60 + "\n\n")

        # sub_59F4B6
        code = decompile_func(0x59F4B6, "sub_59F4B6")
        f.write(code)
        f.write("\n\n")

        # Also dump the raw disassembly for manual analysis
        f.write("=" * 60 + "\n")
        f.write("RAW DISASSEMBLY (first 300 instructions)\n")
        f.write("=" * 60 + "\n")
        ea = 0x59F4B6
        for i in range(300):
            insn = idc.generate_disasm_line(ea, 0)
            f.write(f"  0x{ea:x}: {insn}\n")
            ea = idc.next_head(ea)

        f.write("\n// DONE\n")
    print(f"[IDA] Output written to {OUTPUT}")
    idc.qexit(0)

if __name__ == "__main__":
    main()
