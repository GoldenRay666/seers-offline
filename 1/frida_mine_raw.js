// Scan CodedInputStream for buffer pointers
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("submit_map_mine_info_out")) continue;
    if (!exp.name.includes("MergePartialFromCodedStream")) continue;

    Interceptor.attach(exp.address, {
        onEnter(args) {
            this.msg = args[0];
            const stream = args[1];

            // Dump stream object: 0x40 bytes
            let streamDump = '';
            for (let off = 0; off < 0x40; off += 4) {
                try { streamDump += ` +${off}=${stream.add(off).readU32()}`; } catch(e) {}
            }
            send(`[MINE] stream dump:${streamDump}`);

            // Try all offsets for buffer ptr
            for (let off = 0; off < 0x30; off += 4) {
                try {
                    const ptr = stream.add(off).readPointer();
                    const endPtr = stream.add(off+4).readPointer();
                    const diff = endPtr.sub(ptr).toInt32();
                    if (diff > 0 && diff < 200) {
                        send(`[MINE] off=${off}: ptr_off=${off} end_off=${off+4} diff=${diff}`);
                        try {
                            const raw = ptr.readByteArray(Math.min(diff, 64));
                            const arr = new Uint8Array(raw);
                            let hex = '';
                            for (let i = 0; i < arr.length; i++) hex += arr[i].toString(16).padStart(2,'0');
                            send(`[MINE]   RAW: ${hex}`);
                        } catch(e) {}
                    }
                } catch(e) {}
            }
        },
        onLeave(retval) {
            const m = this.msg;
            send(`[MINE] ret=${retval.toInt32()} +8=${m.add(8).readU32()} +12=${m.add(12).readU32()} mask+14=${m.add(0x14).readU32()}`);
        }
    });
    send(`[HOOK] @ ${exp.address}`);
    break;
}
send('[***] Mine now.');
