// Probe SaveItem structure by hooking updateItemInBag
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Hook UserData::updateItemInBag
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData15updateItemInBagERK8SaveItemPKc") {
        Interceptor.attach(exp.address, {
            onEnter(args) {
                // args[0] = this (UserData*)
                // args[1] = const SaveItem&
                // args[2] = const char*
                const saveItem = args[1];
                const str = args[2].isNull() ? 'null' : args[2].readCString();

                // Dump SaveItem: read first 64 bytes
                const raw = saveItem.readByteArray(64);
                const bytes = new Uint8Array(raw);
                let hex = '';
                for (let i = 0; i < bytes.length; i += 4) {
                    const v = (bytes[i+3]<<24)|(bytes[i+2]<<16)|(bytes[i+1]<<8)|bytes[i];
                    hex += `[+${i}]=${(v>>>0)} `;
                }
                send(`[SAVEITEM] str=${str} bytes: ${hex}`);
            }
        });
        send(`updateItemInBag hooked`);
        break;
    }
}

// Also check getItemWithItemID to see its return type
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData17getItemWithItemIDEj") {
        send(`getItemWithItemID @ ${exp.address}`);
    }
}

send('[***] Trigger by opening backpack or mining');
