"""Find all callers of setLastServerId"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_set_last.txt"

def main():
    idaapi.auto_wait()

    # Get xrefs to setLastServerId @ 0x473384
    with open(OUTPUT, 'w') as f:
        f.write("// Xrefs TO setLastServerId @ 0x473384\n")
        for xref in idautils.XrefsTo(0x473384):
            func = idc.get_func_name(xref.frm)
            f.write(f"// Called from 0x{xref.frm:x} in {func}\n")

        # Also find getLastServerId callers
        f.write("\n// Xrefs TO getLastServerId @ 0x4733a4\n")
        for xref in idautils.XrefsTo(0x4733a4):
            func = idc.get_func_name(xref.frm)
            f.write(f"// Called from 0x{xref.frm:x} in {func}\n")

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
