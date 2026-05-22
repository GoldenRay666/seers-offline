// Final fix: directly manipulate m_itemBag vector after mining
'use strict';

const ORE_MAP = {1: 20081, 2: 20082, 3: 20083, 4: 20084, 5: 20085};

const mod = Process.findModuleByName("libgame_logic.so");
const base = mod.base;
let itemBagAddr = null;
let installed = false;

function install() {
    if (installed) return;
    if (!mod) return;

    // Find m_itemBag static address
    for (const e of mod.enumerateExports()) {
        if (e.name === "_ZN8UserData9m_itemBagE") {
            itemBagAddr = e.address;
            send("[BAG] m_itemBag @ " + itemBagAddr);
        }
    }
    if (!itemBagAddr) return;

    // Find mining merge to trigger after mining
    for (const e of mod.enumerateExports()) {
        if (!e.name.includes("submit_map_mine_info_out")) continue;
        if (!e.name.includes("MergePartialFromCodedStream")) continue;

        Interceptor.attach(e.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                // Fix UI display
                const oreIndex = this.msg.add(12).readU32();
                const itemId = ORE_MAP[oreIndex] || 20081;
                this.msg.add(8).writeU32(itemId);
                this.msg.add(12).writeU32(1);
                retval.replace(ptr(1));

                // Directly add to m_itemBag vector
                try {
                    const begin = itemBagAddr.readPointer();
                    const endPtr = itemBagAddr.add(4);
                    const capPtr = itemBagAddr.add(8);
                    const end = endPtr.readPointer();
                    const cap = capPtr.readPointer();

                    // SaveItem layout (probed): 16 bytes
                    // +0: unknown, +4: unknown, +8: item_id?, +12: count?
                    // Actually from one_t probe: compiled field2(item_id)@+8, compiled field3(count)@+12
                    const SAVEITEM_SIZE = 16;

                    // Check if we need to grow
                    if (end.equals(cap)) {
                        // Vector is full - allocate new memory
                        const oldSize = end.sub(begin).toInt32();
                        const newCap = oldSize + SAVEITEM_SIZE * 4;
                        const newBuf = Memory.alloc(newCap);
                        if (oldSize > 0) {
                            newBuf.writeByteArray(begin.readByteArray(oldSize));
                        }
                        begin = newBuf;
                        endPtr.writePointer(newBuf.add(oldSize));
                        capPtr.writePointer(newBuf.add(newCap));
                        // Note: begin is a local variable, can't update the vector's begin
                        // This approach is too complex
                        send("[BAG] Vector full, need resize - skipping");
                        return;
                    }

                    // Write SaveItem at end
                    const si = end;
                    // Layout from one_t probe: +8=item_id, +12=count
                    // But SaveItem may differ. Try writing at common offsets
                    si.add(0).writeU32(0);     // unknown
                    si.add(4).writeU32(1);     // grid_id = 1
                    si.add(8).writeU32(itemId); // item_id
                    si.add(12).writeU32(1);     // count

                    // Advance end pointer
                    endPtr.writePointer(end.add(SAVEITEM_SIZE));

                    const newEnd = endPtr.readPointer();
                    const newCount = newEnd.sub(begin).toInt32() / SAVEITEM_SIZE;
                    send("[BAG] Item " + itemId + " written! Total items: " + newCount);
                } catch(e) {
                    send("[BAG] Error: " + e.message);
                }
            }
        });
        installed = true;
        send("[BAG] Direct bag fix installed");
        return;
    }
}

setInterval(install, 1000);
install();
