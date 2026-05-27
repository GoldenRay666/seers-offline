"""Decompile getLastServerId and related server ID storage"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_last_server.txt"

def decompile_func(ea, name):
    try:
        cfunc = ida_hexrays.decompile(ea)
        if cfunc:
            sv = cfunc.get_pseudocode()
            lines = [sv[i].line for i in range(sv.size())]
            return f"// {name} @ 0x{ea:x}\n" + "\n".join(lines) + "\n"
        return "// FAILED\n"
    except:
        return "// EXCEPTION\n"

def main():
    idaapi.auto_wait()

    with open(OUTPUT, 'w') as f:
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "getLastServerId" in name and "GameManager" in name:
                f.write(decompile_func(ea, name))
                # Also dump disasm
                addr = ea
                for i in range(30):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")

        # Also find OnlineNetworkManager::getLastServerId
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "getLastServerId" in name and "Online" in name:
                f.write(decompile_func(ea, name))
                addr = ea
                for i in range(30):
                    insn = idc.generate_disasm_line(addr, 0)
                    f.write(f"  0x{addr:x}: {insn}\n")
                    addr = idc.next_head(addr)
                f.write("\n")

        # Find where online_id from HTTP response is stored
        for ea in idautils.Functions():
            name = idc.get_func_name(ea)
            if "setLastServerId" in name or "setServerId" in name or "storeServerId" in name:
                f.write(decompile_func(ea, name))
                f.write("\n")

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
