import idaapi
import idc
import idautils

idaapi.auto_wait()

# Check select_main_mon_out::IsInitialized
print("=== select_main_mon_out::IsInitialized ===")
ea = 0x5b2bd0
fn = idaapi.get_func(ea)
if fn:
    cur = fn.start_ea
    for _ in range(15):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        cur = idc.next_head(cur, fn.end_ea)

# Check LevelLayer::getChildrenByTag callers
print("\n=== LevelLayer::getChildrenByTag callers ===")
tag_ea = 0x55fba0
xrefs = list(idautils.XrefsTo(tag_ea))
for xr in xrefs:
    caller_fn = idaapi.get_func(xr.frm)
    fn_name = idc.get_func_name(xr.frm) if caller_fn else "?"
    print(f"  Called from {xr.frm:#x} ({fn_name})")

# Check MessageHandler::handleMessage for NORMAL_MSG_PACKAGE
print("\n=== MessageHandler::handleMessage(NORMAL_MSG_PACKAGE*) ===")
ea = 0x6329fc
fn = idaapi.get_func(ea)
if fn:
    cur = fn.start_ea
    for _ in range(50):
        line = idc.generate_disasm_line(cur, 0)
        print(f"  {cur:#x}: {line}")
        cur = idc.next_head(cur, fn.end_ea)
        if cur >= fn.end_ea:
            break

idaapi.qexit(0)
