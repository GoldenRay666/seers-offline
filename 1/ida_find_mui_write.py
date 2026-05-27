"""Find what writes to m_userInfo bytes"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_mui_write_out.txt"

def main():
    idaapi.auto_wait()

    # m_userInfo is composed of 4 bytes:
    # UserData::m_userInfo = byte at 0xac4094
    # byte_AC4095 = 0xac4095
    # byte_AC4096 = 0xac4096
    # byte_AC4097 = 0xac4097
    addrs = [0xac4094, 0xac4095, 0xac4096, 0xac4097]

    with open(OUTPUT, 'w') as f:
        for addr in addrs:
            name = idc.get_name(addr) or f"byte_{addr:x}"
            f.write(f"\n{'='*60}\n")
            f.write(f"Xrefs TO {name} (0x{addr:x}):\n")
            f.write(f"{'='*60}\n")

            # Data xrefs (reads)
            f.write(f"Read xrefs:\n")
            for xref in idautils.XrefsTo(addr):
                func_name = idc.get_func_name(xref.frm)
                f.write(f"  from 0x{xref.frm:x} ({func_name})\n")

            # Find ALL xrefs including writes (use ida_xref)
            f.write(f"\nAll xrefs (including writes):\n")
            # Also check the pointer chain
            # m_userInfo_ptr at 0xab3028 → points to 0xac4094

        # Check m_userInfo_ptr at 0xab3028
        f.write(f"\n{'='*60}\n")
        f.write(f"Xrefs TO m_userInfo_ptr (0xab3028):\n")
        f.write(f"{'='*60}\n")
        for xref in idautils.XrefsTo(0xab3028):
            func_name = idc.get_func_name(xref.frm)
            f.write(f"  from 0x{xref.frm:x} ({func_name})\n")

        # Also look for STR (store) instructions near the xref points
        # that reference these addresses

        f.write(f"\n// DONE\n")

    print(f"[IDA] Output written to {OUTPUT}")
    idc.qexit(0)

if __name__ == "__main__":
    main()
