"""Extract ALL field mappings from player_basic_info_t Merge (sub_59F4B6)"""
import idaapi, idc, idautils

OUTPUT = "C:/javatools/1/ida_pb_fields.txt"

def main():
    idaapi.auto_wait()

    # sub_59F4B6 is the real Merge function (called by player_basic_info_t::MergePartial)
    ea = 0x59F4B6
    func = idaapi.get_func(ea)
    if not func:
        ea = 0x59F4A4  # try the wrapper
        func = idaapi.get_func(ea)

    with open(OUTPUT, 'w') as f:
        f.write(f"// player_basic_info_t Merge at 0x{func.start_ea:x}, size={func.size()}\n\n")
        f.write("// Field mapping:\n")
        f.write("// case -> tag -> read_func -> offset\n\n")

        # Track which case we're in
        addr = func.start_ea
        end = func.start_ea + func.size()
        current_case = 0
        current_tag = 0
        current_offset = 0
        current_read = ""

        while addr < end:
            mnem = idc.print_insn_mnem(addr)
            insn = idc.generate_disasm_line(addr, 0)

            # Detect switch case
            if "case" in insn and "jumptable" in insn:
                # Extract case number from previous CMP
                pass

            # Detect tag check (CMP R2, #0x??)
            if mnem == "CMP" and "R2" in idc.print_operand(addr, 0):
                try:
                    val = idc.get_operand_value(addr, 1)
                    if val and val < 0x100:
                        current_tag = val
                        f.write(f"\n// tag=0x{val:x} (field {(val>>3)}, wire {val&7})\n")
                except: pass

            # Detect offset (ADDS R1, #0x??)
            if mnem == "ADDS" and ("R1" in idc.print_operand(addr, 0) or "R1" in insn):
                try:
                    op2 = idc.print_operand(addr, 2)
                    if "#" in op2:
                        val = idc.get_operand_value(addr, 2)
                        if val and val < 0x200:
                            current_offset = val
                            f.write(f"  0x{addr:x}: offset=+0x{val:x}\n")
                except: pass

            # Detect read function call
            if "BL" in mnem:
                target = idc.get_operand_value(addr, 0)
                sym = idc.get_name(target)
                if sym:
                    if "ReadVarint32" in sym:
                        current_read = "ReadVarint32 (uint32)"
                        f.write(f"  0x{addr:x}: {current_read} → +0x{current_offset:x}\n")
                    elif "ReadPrimitive" in sym:
                        current_read = "ReadPrimitive<int> (int32)"
                        f.write(f"  0x{addr:x}: {current_read} → +0x{current_offset:x}\n")
                    elif "ReadString" in sym or "ReadBytes" in sym:
                        current_read = "ReadString"
                        f.write(f"  0x{addr:x}: {current_read} → +0x{current_offset:x}\n")
                    elif "ReadMessage" in sym:
                        current_read = f"ReadMessage<{sym.split('<')[1] if '<' in sym else '?'}>"
                        f.write(f"  0x{addr:x}: {current_read} → +0x{current_offset:x}\n")

            addr = idc.next_head(addr)

    print("[IDA] Done")
    idc.qexit(0)

if __name__ == "__main__":
    main()
