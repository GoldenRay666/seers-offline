"""Find and dump handleAckMsgCheckSession function start"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_handler_start.txt"

def main():
    idaapi.auto_wait()

    # Find the function containing 0x62f134
    func = idaapi.get_func(0x62f134)
    if func:
        start = func.start_ea
        size = func.size()

        with open(OUTPUT, 'w') as f:
            f.write(f"// handleAckMsgCheckSession starts at 0x{start:x}, size={size}\n\n")
            ea = start
            end = start + size
            while ea < end:
                disasm = idc.generate_disasm_line(ea, 0)
                f.write(f"0x{ea:x}: {disasm}\n")
                ea = idc.next_head(ea)
            f.write(f"\n// END at 0x{ea:x}\n")

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
