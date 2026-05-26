import idaapi
import idc
import idautils

idaapi.auto_wait()

TARGETS = [
    "handleNtfMsgStartBattle",
    "BattleManager5start",
    "BattleManager19startBattleWithData",
    "BattleManager13startPveBattle",
    "BattleManager8startPve",
    "handleStartBattle",
    "SpriteElf11BeginBattle",
]

for ea in idautils.Functions():
    name = idc.get_func_name(ea)
    for t in TARGETS:
        if t in name:
            fn = idaapi.get_func(ea)
            if fn:
                print(f"\n{'='*60}")
                print(f"=== {name} @ {ea:#x} ===")
                print(f"{'='*60}")
                cur = fn.start_ea
                while cur < fn.end_ea:
                    line = idc.generate_disasm_line(cur, 0)
                    print(f"  {cur:#x}: {line}")
                    cur = idc.next_head(cur, fn.end_ea)

idaapi.qexit(0)
