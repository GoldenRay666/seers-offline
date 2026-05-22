import idaapi
import idc
import idautils
import re

idaapi.auto_wait()

name = "_ZN11ISeer20Comm16mon_basic_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE"
ea = idc.get_name_ea(idaapi.BADADDR, name)

if ea == idaapi.BADADDR:
    print("NOT FOUND")
    idaapi.qexit(0)

fn = idaapi.get_func(ea)
cur = fn.start_ea
end = fn.end_ea

# Collect all instructions
insns = []
while cur < end:
    disasm = idc.generate_disasm_line(cur, 0)
    insns.append((cur, disasm))
    cur = idc.next_head(cur, end)

# Parse switch cases from jump table
# The switch is on field_number (extracted from tag >> 3)
# Each case has: wire_type check, then ReadXxx call

# Look for the BL instructions that call ReadXxx
# and the CMP instructions that check wire_type

current_field = 0
fields = {}
reading = False

for addr, disasm in insns:
    # Detect case entry: "jumptable 005A09D6 case X"
    m = re.search(r'case (\d+)', disasm)
    if m:
        current_field = int(m.group(1))
        reading = True
        fields[current_field] = {'wire_types': []}
        continue
    
    if not reading:
        continue
    
    # Detect wire_type check: "CMP R3, #2" or "TST R1, R6" where R6=7
    m = re.search(r'CMP\s+R\d+,\s+#(\d+)', disasm)
    if m and current_field > 0:
        wt = int(m.group(1))
        if wt <= 5:
            fields[current_field]['wire_types'].append(wt)
    
    # Detect function calls
    m = re.search(r'BL\s+(\S+)', disasm)
    if m and current_field > 0:
        fn_name = m.group(1)
        if 'Read' in fn_name and 'String' in fn_name:
            fields[current_field]['type'] = 'STRING'
        elif 'Read' in fn_name and 'Varint' in fn_name:
            fields[current_field]['type'] = 'VARINT'
        elif 'Read' in fn_name and 'Message' in fn_name:
            fields[current_field]['type'] = 'MESSAGE'
        elif 'Read' in fn_name and 'Enum' in fn_name:
            fields[current_field]['type'] = 'ENUM'

# Print results
print("=== mon_basic_info_t fields ===")
for fn in sorted(fields.keys()):
    info = fields[fn]
    ftype = info.get('type', 'UNKNOWN')
    wts = info.get('wire_types', [])
    print(f"  Field {fn}: type={ftype}, wire_types={wts}")

# Count and categorize
print("\n=== Summary ===")
for fn in sorted(fields.keys()):
    info = fields[fn]
    ftype = info.get('type', 'UNKNOWN')
    print(f"  Field {fn}: {ftype}")

idaapi.qexit(0)
