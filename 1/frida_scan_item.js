// Full scan: check IsInitialized and all fields
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (!nm.includes("submit_map_mine_info_out")) continue;

    // Hook IsInitialized
    if (nm.includes("IsInitialized") && nm.startsWith("_ZNK")) {
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                const msg = this.msg;
                const r = retval.toInt32();
                // Dump ALL 4-byte values from +4 to +40
                let vals = [];
                for (let off = 4; off < 48; off += 4) {
                    vals.push(msg.add(off).readU32());
                }
                send(`[IsInit] result=${r} msg=${msg} vals=${vals.join(',')}`);
            }
        });
        send(`IsInitialized @ ${exp.address}`);
    }

    // Hook ByteSize to see what fields are serialized
    if (nm.includes("ByteSize") && nm.startsWith("_ZNK")) {
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                const msg = this.msg;
                let vals = [];
                for (let off = 4; off < 48; off += 4) {
                    vals.push(msg.add(off).readU32());
                }
                send(`[ByteSize] result=${retval} vals=${vals.join(',')}`);
            }
        });
        send(`ByteSize @ ${exp.address}`);
    }

    // Hook Merge
    if (nm.includes("MergePartialFromCodedStream")) {
        const fn = exp.address;
        Interceptor.attach(fn, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                const msg = this.msg;
                let vals = [];
                for (let off = 4; off < 48; off += 4) {
                    vals.push(msg.add(off).readU32());
                }
                send(`[Merge] result=${retval} vals=${vals.join(',')}`);

                // Write mine_item_id at +8, mine_item_count at +12
                msg.add(8).writeU32(20081);
                msg.add(12).writeU32(1);
                const after8 = msg.add(8).readU32();
                const after12 = msg.add(12).readU32();
                send(`[Merge] FORCED [+8]=${after8} [+12]=${after12}`);
                retval.replace(ptr(1));
            }
        });
        send(`Merge @ ${fn}`);
    }
}
send(`[***] Go mine!`);
