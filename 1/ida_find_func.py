import idaapi, idc
idaapi.auto_wait()
# Resolve BL target at 0x62da84
ea = 0x62da84
insn = idc.print_insn_mnem(ea)
if insn == "BL":
    target = idc.get_operand_value(ea, 0)
    name = idc.get_func_name(target) or idc.get_name(target)
    print(f"BL at {ea:#x} -> {target:#x} ({name})")
    # Print function size
    fn = idaapi.get_func(target)
    if fn:
        print(f"Function: {name}, start={fn.start_ea:#x}, end={fn.end_ea:#x}, size={fn.end_ea - fn.start_ea}")

# Also resolve setAttackee
for addr in [0x62dab2, 0x62da84]:
    insn = idc.print_insn_mnem(addr)
    if insn == "BL":
        target = idc.get_operand_value(addr, 0)
        name = idc.get_func_name(target) or idc.get_name(target)
        print(f"BL at {addr:#x} -> {target:#x} ({name})")

idaapi.qexit(0)
