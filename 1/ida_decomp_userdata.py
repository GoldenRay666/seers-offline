"""Decompile UserData functions for battle fix"""
import idaapi, idc, ida_hexrays, ida_funcs, idautils, sys, os

OUTPUT = "C:/javatools/1/ida_decomp_userdata_out.txt"

def decompile_func(ea, name):
    try:
        cfunc = ida_hexrays.decompile(ea)
        if cfunc:
            sv = cfunc.get_pseudocode()
            lines = []
            for i in range(sv.size()):
                lines.append(sv[i].line)
            return f"// {name} @ 0x{ea:x}\n" + "\n".join(lines) + "\n"
        return f"// DECOMPILE FAILED\n"
    except Exception as e:
        return f"// EXCEPTION: {e}\n"

def main():
    idaapi.auto_wait()

    # Find functions by name
    targets = {}

    # Key UserData functions for battle
    search_names = [
        "getSpriteInfoByUUID",
        "updateUserInfo",
        "addSpriteToPack",
        "addSpriteToStorage",
        "addSprite",
        "setFollowSpriteIndex",
        "setFollowSpriteByUUID",
        "getItemWithGridID",
        "m_userInfo",
        "SpriteBattleInfo",
        "SpriteInfo",
    ]

    for ea in idautils.Functions():
        name = idc.get_func_name(ea)
        for sn in search_names:
            if sn in name and "UserData" in name:
                targets[f"{name}"] = ea

    # Also search for m_userInfo in data section
    # It's a static variable
    for se in idautils.Segments():
        for ea in idautils.Heads(se, idc.get_segm_end(se)):
            name = idc.get_name(ea)
            if "m_userInfo" in name:
                targets[f"DATA:{name}"] = ea

    with open(OUTPUT, 'w') as f:
        f.write("=" * 60 + "\n")
        f.write("UserData Function Decompilations\n")
        f.write("=" * 60 + "\n\n")

        for name, ea in sorted(targets.items()):
            f.write(f"\n{'='*60}\n")

            if name.startswith("DATA:"):
                # Data item - dump size and xrefs
                f.write(f"// {name} @ 0x{ea:x}\n")
                size = idc.get_item_size(ea)
                f.write(f"// Size: {size} bytes\n")
                # Try to read as dword/string
                if size >= 4:
                    val = idc.get_wide_dword(ea)
                    f.write(f"// Value (dword): 0x{val:x}\n")
                if size >= 2:
                    val = idc.get_wide_word(ea)
                    f.write(f"// Value (word): 0x{val:x}\n")
                val = idc.get_wide_byte(ea)
                f.write(f"// Value (byte): 0x{val:x}\n")

                # Xrefs to this data
                f.write(f"// Xrefs:\n")
                for xref in idautils.XrefsTo(ea):
                    f.write(f"//   from 0x{xref.frm:x} ({idc.get_func_name(xref.frm)})\n")
            else:
                func = ida_funcs.get_func(ea)
                if func:
                    f.write(f"// {name} @ 0x{ea:x} (size={func.size()})\n")
                    f.write(f"{'='*60}\n")
                    f.write(decompile_func(ea, name))
            f.write("\n")

        f.write("\n// DONE\n")

    print(f"[IDA] Output written to {OUTPUT}")
    idc.qexit(0)

if __name__ == "__main__":
    main()
