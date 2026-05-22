"""
IDA script: Analyze player_enter_map_out proto structure
Usage: Run from IDA or headless with ida.exe -A -S"analyze_enter_map.py" -L/tmp/ida_enter_map.log libgame_logic.so
"""
import idaapi
import idautils
import idc
import sys

OUTPUT = "C:/javatools/1/enter_map_proto.txt"

def find_string(name):
    """Find address of a string in the binary"""
    for s in idautils.Strings():
        if name in str(s):
            return s.ea
    return None

def find_xref_to(addr):
    """Find cross references to an address"""
    refs = []
    for xref in idautils.XrefsTo(addr):
        refs.append(xref.frm)
    return refs

def analyze_proto_structure(func_name_hint):
    """Find and analyze proto message structure by looking for MergePartial functions"""
    results = []

    # Search for string references to the message name
    for s in idautils.Strings():
        s_str = str(s)
        if 'player_enter_map_out' in s_str and '_t' not in s_str:
            addr = s.ea
            results.append(f"Found string at 0x{addr:X}: {s_str}")

            # Find xrefs to this string
            for xref in idautils.XrefsTo(addr):
                results.append(f"  XREF from 0x{xref.frm:X}")

                # Look for function that references this
                func = idaapi.get_func(xref.frm)
                if func:
                    results.append(f"  Function: 0x{func.start_ea:X} - 0x{func.end_ea:X}")

    return results

def main():
    results = []
    results.append("=== player_enter_map_out Proto Analysis ===\n")

    # Wait for auto-analysis to complete
    idaapi.auto_wait()

    results.extend(analyze_proto_structure("player_enter_map_out"))

    # Also look for MergePartial pattern
    results.append("\n=== Searching for message handler registration ===")

    # Write results
    with open(OUTPUT, 'w') as f:
        f.write('\n'.join(results))

    print(f"Results written to {OUTPUT}")

    # Exit IDA
    idc.qexit(0)

if __name__ == '__main__':
    main()
