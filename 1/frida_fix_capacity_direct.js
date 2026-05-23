// Direct capacity fix: scan UserData memory for capacity value and write 999
// Run once after game starts, before opening backpack
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
let installed = false;

function findAndFix() {
    if (installed) return;

    // 1. Find UserData singleton
    let userDataFn = null;
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes("UserData") && exp.name.includes("sharedManager") && exp.name.length < 100) {
            userDataFn = exp.address;
            break;
        }
    }
    if (!userDataFn) { send("[CAPFIX] UserData::sharedManager not found"); return; }

    const getUD = new NativeFunction(userDataFn, 'pointer', []);
    const ud = getUD();
    if (ud.isNull()) { send("[CAPFIX] UserData is null"); return; }
    send(`[CAPFIX] UserData @ ${ud}`);

    // 2. Find m_itemBag vector
    let itemBagAddr = null;
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData9m_itemBagE") {
            itemBagAddr = exp.address;
            break;
        }
    }
    if (!itemBagAddr) { send("[CAPFIX] m_itemBag not found"); return; }

    const vecOffset = itemBagAddr.sub(ud);
    send(`[CAPFIX] m_itemBag offset from UserData = ${vecOffset} (${vecOffset.toInt32()})`);

    // 3. Scan UserData for capacity-like values near m_itemBag
    // The capacity is likely an int32 stored somewhere near the vector
    // Scan 256 bytes before and after m_itemBag
    const SCAN_SIZE = 256;
    const scanStart = itemBagAddr.sub(SCAN_SIZE);
    send(`[CAPFIX] Scanning ${SCAN_SIZE*2} bytes around m_itemBag...`);

    let candidates = [];
    for (let off = 0; off < SCAN_SIZE * 2; off += 4) {
        try {
            const val = scanStart.add(off).readU32();
            // Capacity is likely a small positive number (for a new account, likely 0 or 30-50)
            // We're looking for 0 (to replace with 999)
            // or a small number like 30 (default capacity)
            if (val >= 0 && val <= 200) {
                candidates.push({ offset: off - SCAN_SIZE, value: val, absAddr: scanStart.add(off) });
            }
        } catch(e) {}
    }
    send(`[CAPFIX] Found ${candidates.length} candidate values (0-200)`);
    for (const c of candidates) {
        send(`[CAPFIX]   off ${c.offset}: ${c.value}`);
    }

    // 4. Strategy: hook ItemBagLayer init and read capacity display value
    // Also directly write 999 to vecAddr-8 and vecAddr-12 (common patterns)
    // Try common offsets where capacity might be stored
    const TRY_OFFSETS = [-12, -8, -4, 12, 16, 20, 24];
    send(`[CAPFIX] Will try writing 999 to offsets: ${TRY_OFFSETS.join(', ')}`);
    for (const off of TRY_OFFSETS) {
        try {
            const target = itemBagAddr.add(off);
            const oldVal = target.readU32();
            target.writeU32(999);
            const newVal = target.readU32();
            send(`[CAPFIX] Wrote 999 to m_itemBag${off >= 0 ? '+' : ''}${off}: ${oldVal} -> ${newVal}`);
        } catch(e) {
            send(`[CAPFIX] Failed to write at offset ${off}: ${e.message}`);
        }
    }

    // 5. Hook cli_notify_item_bag_updates_out handler to dump capacity read
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes("notify_item_bag_updates_out") &&
            exp.name.includes("MergePartialFromCodedStream")) {
            Interceptor.attach(exp.address, {
                onEnter(args) { this.msg = args[0]; },
                onLeave(retval) {
                    try {
                        // After merge, read the first few fields (capacity should be field 1)
                        const raw = this.msg.readByteArray(48);
                        const arr = new Uint8Array(raw);
                        let hex = '';
                        for (let i = 0; i < arr.length; i += 4) {
                            const v = (arr[i+3]<<24)|(arr[i+2]<<16)|(arr[i+1]<<8)|arr[i];
                            hex += `[+${i}]=${(v>>>0)} `;
                        }
                        send(`[CAPFIX] Bag update merged! msg dump: ${hex}`);
                    } catch(e) {}
                    // Re-write capacity offsets after bag update
                    for (const off of TRY_OFFSETS) {
                        try {
                            itemBagAddr.add(off).writeU32(999);
                        } catch(e) {}
                    }
                }
            });
            send(`[CAPFIX] Hooked bag_updates merge for capacity re-write`);
            break;
        }
    }

    installed = true;
    send(`[CAPFIX] Fix applied! Please open backpack now.`);
}

setInterval(findAndFix, 2000);
findAndFix();
