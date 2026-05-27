"""Find callers of finishSelectServer"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_finish_server.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        # Find finishSelectServer address
        ea = 0x489358
        f.write(f"// finishSelectServer @ 0x{ea:x}\n")

        # Dump the function
        func = idaapi.get_func(ea)
        if func:
            addr = func.start_ea
            for i in range(40):
                insn = idc.generate_disasm_line(addr, 0)
                f.write(f"  0x{addr:x}: {insn}\n")
                addr = idc.next_head(addr)

        f.write("\n// Xrefs TO finishSelectServer:\n")
        for xref in idautils.XrefsTo(ea):
            func_name = idc.get_func_name(xref.frm)
            f.write(f"// Called from 0x{xref.frm:x} in {func_name}\n")

        # Also find what calls finishSelectServer indirectly
        # Look at setServerList to see if auto-select happens
        f.write("\n// setServerList @ 0x489bac context:\n")
        addr = 0x489bac
        for i in range(60):
            insn = idc.generate_disasm_line(addr, 0)
            f.write(f"  0x{addr:x}: {insn}\n")
            addr = idc.next_head(addr)

        # Also look at finishSelectServer context
        f.write("\n// finishSelectServer full disasm:\n")
        addr = 0x489358
        for i in range(80):
            insn = idc.generate_disasm_line(addr, 0)
            f.write(f"  0x{addr:x}: {insn}\n")
            addr = idc.next_head(addr)

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
