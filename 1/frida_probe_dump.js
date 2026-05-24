// Hook the iterator function — return synth SaveItem for calls 1-2
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
let callCount = 0;

// Pre-allocate persistent SaveItems
function makeSaveItem(id, cnt) {
    const buf = Memory.alloc(0x11); // 17-byte stride
    for (let i=0;i<0x11;i+=4) buf.add(i).writeU32(0);
    buf.add(0).writeU32(id);
    buf.add(4).writeU32(cnt);
    return buf;
}
const si1 = makeSaveItem(20081, 10);
const si2 = makeSaveItem(20082, 5);

for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData17getItemWithGridIDEj") {
        Interceptor.attach(exp.address, {
            onEnter(a) {
                callCount++;
                // Note: a0=grid index (1..30), a1=container element ptr
                // Don't send here to avoid flooding
            },
            onLeave(r) {
                if (callCount <= 2 && !r.isNull()) {
                    // Replace the return with our synthetic SaveItem
                    const si = callCount === 1 ? si1 : si2;
                    r.replace(si);
                    send(`[FIX] call #${callCount} → id=${si.add(0).readU32()} cnt=${si.add(4).readU32()}`);
                }
            }
        });
        send(`[HOOK] iterator @ ${exp.address}`);
        break;
    }
}

send('[READY] Iterator fix. Open bag.');
