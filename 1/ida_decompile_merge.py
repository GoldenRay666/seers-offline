import idaapi
import idc
import idautils

idaapi.auto_wait()

TARGETS = [
    "cli_notify_item_bag_updates_out",
    "cli_get_item_out",
    "submit_map_mine_info_out",
    "cli_notify_item_bag_updates_out_one_t",
    "cli_get_item_out_one_t",
]

for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    for t in TARGETS:
        if t in name and ("MergePartialFromCodedStream" in name or "IsInitialized" in name):
            fn = idaapi.get_func(ea)
            if fn:
                print(f"\n{'='*60}")
                print(f"=== {name} @ {ea:#x} ===")
                print(f"{'='*60}")
                # Disassemble the full function
                cur = fn.start_ea
                while cur < fn.end_ea:
                    line = idc.generate_disasm_line(cur, 0)
                    print(f"  {cur:#x}: {line}")
                    cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
