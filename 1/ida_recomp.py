"""Decompile RecomputeBufferLimits — the key to limit enforcement"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_recomp.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "RecomputeBufferLimits" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(80):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")
                break

        # Also find PopLimit to see if it sets stream+0x18
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "PopLimit" in name and "CodedInputStream" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(25):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")
                break

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
