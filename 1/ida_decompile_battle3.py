import idaapi
import idc
import idautils

idaapi.auto_wait()

# Full disassembly of battle handler functions
TARGETS = [
    "BattleManager",
    "handleBattle",
    "onBattle",
    "startBattle",
    "initBattle",
    "enterBattle",
    "beginBattle",
    "battlePve",
    "battle_pve",
    "BattleScene",
    "BattleLayer",
    "BattleUILayer",
    "BattleController",
]

for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    for t in TARGETS:
        if t in name:
            fn = idaapi.get_func(ea)
            if fn and fn.end_ea - fn.start_ea >= 10:
                print(f"\n{'='*60}")
                print(f"=== {name} @ {ea:#x} ===")
                print(f"{'='*60}")
                cur = fn.start_ea
                while cur < fn.end_ea:
                    line = idc.generate_disasm_line(cur, 0)
                    print(f"  {cur:#x}: {line}")
                    cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
