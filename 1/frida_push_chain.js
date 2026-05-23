// Trace push chain: merge → IsInitialized → handler → updateItemInBag
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// 1. Bag update merge with raw stream dump
for (const exp of mod.enumerateExports()) {
    if (!exp.name.includes("notify_item_bag_updates_out")) continue;
    if (exp.name.includes("one_t")) continue;

    if (exp.name.includes("MergePartialFromCodedStream")) {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    this.msg = args[0];
                    const stream = args[1];
                    try {
                        const ptr = stream.add(4).readPointer();
                        const end = stream.add(8).readPointer();
                        const diff = end.sub(ptr).toInt32();
                        if (diff > 0 && diff < 200) {
                            const raw = ptr.readByteArray(diff);
                            const arr = new Uint8Array(raw);
                            send(`[BAG_MERGE] BODY(${diff}b): ${Array.from(arr).map(b=>b.toString(16).padStart(2,'0')).join('')}`);
                        }
                    } catch(e) {}
                },
                onLeave(retval) {
                    send(`[BAG_MERGE] ret=${retval.toInt32()}`);
                    let parts = [];
                    for (let i = 0; i < 0x80; i += 4) {
                        try {
                            const v = this.msg.add(i).readU32();
                            if (v !== 0 && v < 0x100000) parts.push(`+${i}=${v}`);
                        } catch(e) {}
                    }
                    if (parts.length) send(`[BAG_MERGE] ${parts.join(' ')}`);
                }
            });
            send(`[BAG_MERGE] Hooked @ ${exp.address}`);
        } catch(e) { send(`[BAG_MERGE] Error: ${e.message}`); }
    }

    if (exp.name.includes("IsInitialized")) {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) { this.msg = args[0]; },
                onLeave(retval) {
                    send(`[BAG_INIT] ret=${retval.toInt32()} mask+70=${this.msg.add(0x70).readU32()}`);
                }
            });
            send(`[BAG_INIT] Hooked @ ${exp.address}`);
        } catch(e) {}
    }
}

// 2. ReadTag
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN6google8protobuf2io16CodedInputStream7ReadTagEv") {
        try {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    const tag = retval.toInt32();
                    if (tag !== 0) send(`[READTAG] field=${tag>>>3} wire=${tag&7}`);
                }
            });
            send(`[READTAG] Hooked @ ${exp.address}`);
        } catch(e) {}
        break;
    }
}

// 3. updateItemInBag
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData15updateItemInBagERK8SaveItemPKc") {
        try {
            Interceptor.attach(exp.address, {
                onEnter(args) {
                    const si = args[1];
                    try {
                        const raw = si.readByteArray(32);
                        const arr = new Uint8Array(raw);
                        send(`[UPDATE] updateItemInBag! ${Array.from(arr).map(b=>b.toString(16).padStart(2,'0')).join('')}`);
                    } catch(e) {}
                }
            });
            send(`[UPDATE] Hooked @ ${exp.address}`);
        } catch(e) {}
        break;
    }
}

// 4. NetWorkUtil functions (push dispatch relevant)
send("\n=== NetWorkUtil ===");
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("NetWorkUtil") && exp.name.length < 80) {
        send(`  ${exp.name} @ ${exp.address}`);
    }
}

send('[CHAIN] Ready. Mine now.');
