// Verify cli_get_item_out merge at login
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Hook parent MergePartialFromCodedStream (the wire merge)
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("get_item_out") && !nm.includes("one_t") &&
        nm.includes("MergePartialFromCodedStream")) {
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                send(`[PARENT_MERGE] ret=${retval.toInt32()}`);
                const m = this.msg;
                send(`[PARENT] cap@+28=${m.add(0x28).readU32()} mask@+30=${m.add(0x30).readU32()} vec_begin@+8=${m.add(8).readU32()}`);
            }
        });
        send(`[HOOK] Parent merge @ ${exp.address} name=${nm}`);
        break;
    }
}

// Hook parent IsInitialized
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("get_item_out") && !nm.includes("one_t") && nm.includes("IsInitialized")) {
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                const m = this.msg;
                send(`[PARENT_INIT] ret=${retval.toInt32()} cap@+28=${m.add(0x28).readU32()} mask@+30=${m.add(0x30).readU32()}`);
            }
        });
        send(`[HOOK] Parent IsInitialized @ ${exp.address}`);
        break;
    }
}

// Hook one_t Merge
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("get_item_out_one_t") && nm.includes("MergePartialFromCodedStream")) {
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                const m = this.msg;
                send(`[ONE_MERGE] ret=${retval.toInt32()} id@+8=${m.add(8).readU32()} grid@+C=${m.add(0xC).readU32()} cnt@+10=${m.add(0x10).readU32()} mask@+2C=${m.add(0x2C).readU32()}`);
            }
        });
        send(`[HOOK] one_t merge @ ${exp.address}`);
        break;
    }
}

// Hook one_t IsInitialized
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("get_item_out_one_t") && nm.includes("IsInitialized")) {
        Interceptor.attach(exp.address, {
            onLeave(retval) {
                send(`[ONE_INIT] ret=${retval.toInt32()}`);
            }
        });
        send(`[HOOK] one_t IsInitialized @ ${exp.address}`);
        break;
    }
}

send('[***] Ready');
