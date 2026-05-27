"""Decompile PushLimit and ReadTag for CodedInputStream"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_pushlimit.txt"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        # Find PushLimit
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "PushLimit" in name and "CodedInputStream" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(60):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")

        # Find ReadTag (or ReadTagFallback)
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if ("ReadTag" in name and "Fallback" not in name and "CodedInputStream" in name):
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(80):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")

        # Also find ExpectAtEnd
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "ExpectAtEnd" in name and "CodedInputStream" in name:
                f.write(f"// {name} @ 0x{ea:x}\n")
                addr = ea
                for i in range(30):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
