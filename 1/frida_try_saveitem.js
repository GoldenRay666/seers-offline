// Try calling updateItemInBag with different SaveItem layouts
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

let updateFn = null, userDataShared = null, getItemById = null;
for (const exp of mod.enumerateExports()) {
    if (exp.name === "_ZN8UserData15updateItemInBagERK8SaveItemPKc") updateFn = exp.address;
    if (exp.name.includes("UserData") && exp.name.includes("sharedManager")) userDataShared = exp.address;
    if (exp.name === "_ZN8UserData17getItemWithItemIDEj") getItemById = exp.address;
}
send(`updateFn=${!!updateFn} shared=${!!userDataShared} getById=${!!getItemById}`);

if (updateFn && userDataShared && getItemById) {
    // Try to call getItemWithItemID first to see if UserData is accessible
    const getUD = new NativeFunction(userDataShared, 'pointer', []);
    const ud = getUD();
    send(`UserData: ${ud}`);

    // Try different SaveItem layouts
    // Layout guesses (based on proto fields order):
    const LAYOUTS = [
        // Layout A: item_id(0), count(4), grid_id(8)
        { id_off: 0, cnt_off: 4, grid_off: 8, size: 12 },
        // Layout B: grid_id(0), item_id(4), count(8)
        { id_off: 4, cnt_off: 8, grid_off: 0, size: 12 },
        // Layout C: with level, get_time
        { id_off: 0, cnt_off: 4, grid_off: 8, level_off: 12, time_off: 16, size: 24 },
    ];

    for (let i = 0; i < LAYOUTS.length; i++) {
        const L = LAYOUTS[i];
        const mem = Memory.alloc(L.size + 4);
        mem.writeU32(0); // clear first 4 bytes (vtable? no, it's a struct)

        mem.add(L.id_off).writeU32(20081);  // item_id
        mem.add(L.cnt_off).writeU32(1);     // count
        mem.add(L.grid_off).writeU32(0);    // grid_id (0 = auto?)

        send(`Trying layout ${i}: id@${L.id_off} cnt@${L.cnt_off} grid@${L.grid_off}`);

        try {
            // Get existing item to see if it exists
            const existing = new NativeFunction(getItemById, 'pointer', ['pointer', 'uint32'])(ud, 20081);
            send(`  getItemWithItemID(20081) = ${existing}`);

            // Try updateItemInBag
            const doUpdate = new NativeFunction(updateFn, 'void', ['pointer', 'pointer', 'pointer']);
            doUpdate(ud, mem, ptr(0));
            send(`  updateItemInBag called successfully`);

            // Check if item now exists
            const after = new NativeFunction(getItemById, 'pointer', ['pointer', 'uint32'])(ud, 20081);
            send(`  after: getItemWithItemID(20081) = ${after}`);

            if (!after.isNull()) {
                send(`  SUCCESS! Layout ${i} works!`);
            }
        } catch(e) {
            send(`  Error: ${e.message}`);
        }
    }
}

send('[***] Done');
