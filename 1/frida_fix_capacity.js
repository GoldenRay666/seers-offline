// Direct fix: write bag capacity into UserData memory
// Use when proto capacity field doesn't reflect in UI (Capacity=0 issue)
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
let installed = false;

function findCapacityOffset() {
    // Search UserData functions that mention bag size/capacity
    for (const exp of mod.enumerateExports()) {
        const nm = exp.name;
        if ((nm.includes("UserData") || nm.includes("GameItemData")) &&
            (nm.includes("BagCap") || nm.includes("bagCap") || nm.includes("BagSize") ||
             nm.includes("bagSize") || nm.includes("Capacity") || nm.includes("capacity") ||
             nm.includes("MaxGrid") || nm.includes("maxGrid") || nm.includes("itemBagCap"))) {
            send(`[CAPFIX] Found: ${nm} @ ${exp.address}`);
        }
    }

    // Also check m_itemBag vector - capacity might be stored alongside it
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData9m_itemBagE") {
            const vecAddr = exp.address;
            send(`[CAPFIX] m_itemBag vector @ ${vecAddr}`);
            // The vector is: begin(4) + end(4) + cap(4)
            // UserData might have capacity stored before or after the vector
            // Dump 64 bytes around the vector address
            for (let off = -32; off < 32; off += 4) {
                try {
                    const val = vecAddr.add(off).readU32();
                    if (val > 0 && val < 10000) {
                        send(`[CAPFIX]   vecAddr${off >= 0 ? '+' : ''}${off}: ${val} (${val})`);
                    }
                } catch(e) {}
            }
        }
    }
}

function install() {
    if (installed) return;
    findCapacityOffset();

    // Hook ItemBagLayer init to read and potentially fix capacity
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes("ItemBagLayer") && exp.name.includes("init") && !exp.name.includes("CCB")) {
            Interceptor.attach(exp.address, {
                onLeave(retval) {
                    // Try to read the capacity value after init
                    for (const e2 of mod.enumerateExports()) {
                        if (e2.name === "_ZN8UserData9m_itemBagE") {
                            const addr = e2.address;
                            const begin = addr.readPointer();
                            const endPtr = addr.add(4).readPointer();
                            const capPtr = addr.add(8).readPointer();
                            const count = endPtr.sub(begin).toInt32() / 16;
                            send(`[CAPFIX] ItemBagLayer opened: items=${count}`);
                        }
                    }
                }
            });
            send(`[CAPFIX] Hooked ItemBagLayer::init`);
            installed = true;
            return;
        }
    }
}

setInterval(install, 2000);
install();
