// Try to find and call item-add functions
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Find addNewItemData
let addNewItemFn = null;
let sharedMgrFn = null;

for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN19GameItemDataManager14addNewItemDataERKN11ISeer20Conf6item_tE") {
        addNewItemFn = exp.address;
        send(`addNewItemData @ ${exp.address}`);
    }
    if (exp.name === "_ZN19GameItemDataManager13sharedManagerEv") {
        sharedMgrFn = exp.address;
        send(`sharedManager @ ${exp.address}`);
    }
}

if (sharedMgrFn && addNewItemFn) {
    const getMgr = new NativeFunction(sharedMgrFn, 'pointer', []);
    const mgr = getMgr();
    send(`GameItemDataManager instance: ${mgr}`);

    // Try calling addNewItemData with a minimal item_t (just id + name)
    // The item_t protobuf message layout:
    // +0: vtable
    // +4: _has_bits
    // +8: name (string*)
    // +12: id (uint32)
    // etc.

    // Allocate memory for a minimal item_t
    const itemSize = 128;
    const itemBuf = Memory.alloc(itemSize);

    // Write a vtable pointer (use any valid one from existing objects)
    // This is risky - let's try a different approach

    // Actually, let's just hook the function and see what happens when
    // the game calls it naturally
    Interceptor.attach(addNewItemFn, {
        onEnter(args) {
            send(`[addNewItemData] called! this=${args[0]} item=${args[1]}`);
            // Read item fields
            const item = args[1];
            const id = item.add(12).readU32();
            const namePtr = item.add(8).readPointer();
            let name = '';
            if (!namePtr.isNull()) {
                try {
                    name = namePtr.readCString();
                } catch(e) {}
            }
            send(`[addNewItemData] item.id=${id} name="${name}"`);
        }
    });
    send('[+] addNewItemData hooked - watching for calls');
}

send('[***] Ready');
