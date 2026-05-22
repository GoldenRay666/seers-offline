import idaapi
import idc

idaapi.auto_wait()

func_name = "_ZNK14ISeer20CSProto19select_main_mon_out13IsInitializedEv"
ea = idc.get_name_ea(idaapi.BADADDR, func_name)
if ea == idaapi.BADADDR:
    print("Function not found!")
else:
    print(f"Found {func_name} at {ea:#x}")
    try:
        cfunc = idaapi.decompile(ea)
        print(str(cfunc)[:2000])
    except:
        # Try to find field references
        print("Disassembly:")
        current = ea
        for _ in range(30):
            print(f"{current:#x}: {idc.generate_disasm_line(current, 0)}")
            current = idc.next_head(current)

idaapi.qexit(0)
