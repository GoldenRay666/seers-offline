import idaapi, idc, idautils

idaapi.auto_wait()

# Get the address of case 3 (field 4) in the switch
# From the jump table, case 3 entry is at offset 0x78 from 0x5A09D6
# Jump table base: 0x5A09DA + 3*2 = 0x5A09E0 → value: DCW 0x78
# Case address: 0x5A09D6 + 0x78 = 0x5A0A4E

base = 0x5A09D6
# Read the jump table entry for case 3
jt_addr = 0x5A09DA + 3*2
offset = idc.get_wide_word(jt_addr)
case_addr = base + offset
print(f"Case 3 (field 4) at {case_addr:#x}")

# Disassemble 30 instructions from here
cur = case_addr
for _ in range(30):
    print(f"  {cur:#x}: {idc.generate_disasm_line(cur, 0)}")
    cur = idc.next_head(cur)

idaapi.qexit(0)
