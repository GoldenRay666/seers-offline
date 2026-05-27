"""Decompile player_basic_info_t Merge to find field mapping"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils

OUTPUT = "C:/javatools/1/ida_player_basic_out.txt"

def decompile_func(ea, name):
    try:
        cfunc = ida_hexrays.decompile(ea)
        if cfunc:
            sv = cfunc.get_pseudocode()
            lines = []
            for i in range(sv.size()):
                lines.append(sv[i].line)
            return f"// {name} @ 0x{ea:x}\n" + "\n".join(lines) + "\n"
        return f"// FAILED\n"
    except Exception as e:
        return f"// EXCEPTION: {e}\n"

def main():
    idaapi.auto_wait()

    targets = {}
    for ea in idautils.Functions():
        name = idc.get_func_name(ea)
        if "player_basic_info_t" in name and "Merge" in name:
            targets[name] = ea

    with open(OUTPUT, 'w') as f:
        f.write("=" * 60 + "\n")
        for name, ea in sorted(targets.items()):
            func = ida_funcs.get_func(ea)
            f.write(f"\n{'='*60}\n")
            f.write(f"// {name} @ 0x{ea:x} (size={func.size()})\n")
            f.write(f"{'='*60}\n")
            f.write(decompile_func(ea, name))
        f.write("\n// DONE\n")
    print(f"[IDA] Output written to {OUTPUT}")
    idc.qexit(0)

if __name__ == "__main__":
    main()
