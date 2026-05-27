"""Decompile key battle functions using IDA headless mode.
Run: D:/BaiduNetdiskDownload/IDA_Pro_v8.3_Portable123/idat.exe -A -S"C:/javatools/1/ida_decomp_battle.py" -L"C:/javatools/1/ida_decomp_battle.log" "C:/javatools/1/lib/armeabi/libgame_logic.so"
"""
import idaapi
import idc
import ida_hexrays
import ida_funcs
import ida_name
import idautils
import sys
import os

OUTPUT = "C:/javatools/1/ida_decomp_battle_out.txt"

def decompile_func(ea, name):
    """Decompile and write to output"""
    try:
        cfunc = ida_hexrays.decompile(ea)
        if cfunc:
            # Convert pseudocode to string
            sv = cfunc.get_pseudocode()
            lines = []
            for i in range(sv.size()):
                lines.append(sv[i].line)
            return f"// {name} @ 0x{ea:x}\n" + "\n".join(lines) + "\n"
        return f"// DECOMPILE FAILED for {name} @ 0x{ea:x}\n"
    except Exception as e:
        return f"// DECOMPILE EXCEPTION: {e}\n"

def main():
    idaapi.auto_wait()

    targets = {
        "handleNtfMsgBattleEnd": 0x62d8b1,
        "handleNtfMsgStartBattle": 0x62d9dd,
        "setBattleSprite": 0x4666bd,
        "addElfComponent": 0x44d50d,
        "BattleManager::start": 0x465c54,
        "getAttacker": 0x4463bd,
        "addWaitingSprites": None,  # find by name
    }

    # Find addWaitingSprites by name
    for ea in idautils.Functions():
        name = idc.get_func_name(ea)
        if "addWaitingSprites" in name:
            targets["addWaitingSprites"] = ea
            break

    with open(OUTPUT, 'w') as f:
        f.write("=" * 60 + "\n")
        f.write("Battle Function Decompilations\n")
        f.write("=" * 60 + "\n\n")

        for name, ea in targets.items():
            if ea is None:
                f.write(f"// {name}: NOT FOUND\n\n")
                continue

            func = ida_funcs.get_func(ea)
            if not func:
                f.write(f"// {name} @ 0x{ea:x}: NO FUNCTION\n\n")
                continue

            f.write(f"\n{'='*60}\n")
            f.write(f"// {name} @ 0x{ea:x} (size={func.size()})\n")
            f.write(f"{'='*60}\n")
            f.write(decompile_func(ea, name))
            f.write("\n")

        f.write("\n// DONE\n")

    print(f"[IDA] Output written to {OUTPUT}")
    idc.qexit(0)

if __name__ == "__main__":
    main()
