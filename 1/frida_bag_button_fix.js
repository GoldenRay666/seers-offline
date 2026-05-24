// Fix: bag × and ? buttons not responding (other bag buttons work fine)
// Root cause hypothesis: addCloseButtonToGuideLayer / addDeviceToGuideLayer
// create buttons differently from addTabButtonToGuideLayer, leaving them
// with wrong contentSize, isEnabled=false, or similar.
//
// Strategy: after button creation, inspect state vs working buttons,
// patch any bad state found.

'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
let bagInstance = null;
let onCloseAddr = null;
let onHelpAddr = null;
let installed = false;

// CCNode/CCMenuItem offsets in cocos2d-x 2.0.2 ARM build
// These are approximate — we probe multiple offsets
const POSSIBLE_VISIBLE_OFFSETS = [0x40, 0x44, 0x48, 0x4C, 0x50, 0x54, 0x58, 0x5C, 0x60, 0x64, 0x68];
const POSSIBLE_CONTENTSIZE_OFFSETS = [0x20, 0x28, 0x30, 0x38, 0x40, 0x48, 0x50, 0x58, 0x60, 0x68, 0x70, 0x78, 0x80, 0x88, 0x90, 0x98, 0xA0, 0xA8, 0xB0, 0xB8, 0xC0, 0xC8, 0xD0, 0xD8, 0xE0, 0xE8, 0xF0, 0xF8];

// Store created buttons for inspection
let closeMenuItems = [];
let hintMenuItems = [];
let tabMenuItems = [];

function install() {
    if (installed) return;

    for (const exp of mod.enumerateExports()) {
        const n = exp.name;
        if (n === "_ZN12ItemBagLayer15onCloseSelectedEPN7cocos2d8CCObjectE")
            onCloseAddr = exp.address;
        if (n === "_ZN12ItemBagLayer14onHelpSelectedEPN7cocos2d8CCObjectE")
            onHelpAddr = exp.address;
    }
    send(`[BTNFIX] onClose=${!!onCloseAddr} onHelp=${!!onHelpAddr}`);

    // Hook bag init to capture instance
    for (const exp of mod.enumerateExports()) {
        const n = exp.name;
        if (n.includes("ItemBagLayer") && n.includes("initialize") && !n.includes("CCB")) {
            Interceptor.attach(exp.address, {
                onEnter(args) { bagInstance = args[0]; },
                onLeave(retval) {
                    // Reset tracking
                    closeMenuItems = [];
                    hintMenuItems = [];
                    tabMenuItems = [];
                    send(`[BTNFIX] Bag opened, instance=${bagInstance}`);
                }
            });
            send(`[BTNFIX] Bag init hooked`);
            break;
        }
    }

    // Hook addCloseButtonToGuideLayer — inspect result
    for (const exp of mod.enumerateExports()) {
        const n = exp.name;

        if (n === "_ZN12ItemBagLayer26addCloseButtonToGuideLayerEv") {
            Interceptor.attach(exp.address, {
                onEnter(args) { this.bag = args[0]; },
                onLeave(retval) {
                    let menu = findLastMenuChild(this.bag);
                    if (menu) {
                        closeMenuItems.push(menu);
                        dumpMenuItem("CLOSE", menu);
                    }
                    send(`[BTNFIX] addCloseButton done, found=${!!menu}`);
                }
            });
            send(`[BTNFIX] CloseButton hooked`);
        }

        if (n === "_ZN12ItemBagLayer21addDeviceToGuideLayerEv") {
            Interceptor.attach(exp.address, {
                onEnter(args) { this.bag = args[0]; },
                onLeave(retval) {
                    let menu = findLastMenuChild(this.bag);
                    if (menu) {
                        hintMenuItems.push(menu);
                        dumpMenuItem("HINT", menu);
                    }
                    send(`[BTNFIX] addDeviceButton done, found=${!!menu}`);
                }
            });
            send(`[BTNFIX] HintButton hooked`);
        }

        // Compare with working button
        if (n === "_ZN12ItemBagLayer24addTabButtonToGuideLayerEv") {
            Interceptor.attach(exp.address, {
                onEnter(args) { this.bag = args[0]; },
                onLeave(retval) {
                    let menu = findLastMenuChild(this.bag);
                    if (menu) {
                        tabMenuItems.push(menu);
                        dumpMenuItem("TAB", menu);
                    }
                    send(`[BTNFIX] addTabButton done, found=${!!menu}`);
                }
            });
            send(`[BTNFIX] TabButton hooked (reference)`);
        }
    }

    installed = true;
}

// Find CCMenu/CCMenuItem among the last-added children
function findLastMenuChild(layer) {
    // CCNode children vector is at offset to find by probing
    // CCMenu's identifiable by having multiple CCMenuItem children
    // For CCArray: +0 is vtable, +4 is data array pointer, +8 is count
    // CCArray data: pointer to CCObject* array

    // Probe common CCNode child-vector offsets
    const CHILD_OFFSETS = [0x44, 0x48, 0x4C, 0x50, 0x54, 0x58, 0x5C, 0x60, 0x64, 0x68, 0x6C, 0x70, 0x74, 0x78, 0x7C, 0x80];

    for (const off of CHILD_OFFSETS) {
        try {
            const vecPtr = layer.add(off).readPointer();
            if (vecPtr.isNull() || vecPtr.toInt32() < 0x10000) continue;

            // CCArray layout: +0=?, +4=dataPtr, +8=count
            const dataPtr = vecPtr.add(4).readPointer();
            const count = vecPtr.add(8).readU32();

            if (count > 0 && count < 100 && !dataPtr.isNull() && dataPtr.toInt32() > 0x10000) {
                // Read last element (most recently added child)
                const lastChild = dataPtr.add((count - 1) * 4).readPointer();
                if (!lastChild.isNull() && lastChild.toInt32() > 0x10000) {
                    return lastChild;
                }
            }
        } catch(e) {}
    }
    return null;
}

// Dump menu item state at common offsets
function dumpMenuItem(label, item) {
    let info = `[BTNFIX] ${label} item=${item}`;

    // Read common offset ranges as u32 to find layout
    const u32s = [];
    for (let off = 0; off < 0x80; off += 4) {
        try {
            u32s.push(`${off.toString(16)}=${item.add(off).readU32().toString(16)}`);
        } catch(e) { break; }
    }
    send(info + " u32dump: " + u32s.join(" "));

    // After first real test, compare close vs tab and show differences
}

// ---- RPC for manual fallback ----
rpc.exports = {
    closeBag: function() {
        if (!bagInstance || bagInstance.isNull()) return "bag not open";
        if (!onCloseAddr) return "onCloseSelected not found";
        try {
            const fn = new NativeFunction(onCloseAddr, 'void', ['pointer', 'pointer']);
            fn(bagInstance, ptr(0));
            return "close called OK";
        } catch(e) {
            return "error: " + e.message;
        }
    },
    helpBag: function() {
        if (!bagInstance || bagInstance.isNull()) return "bag not open";
        if (!onHelpAddr) return "onHelpSelected not found";
        try {
            const fn = new NativeFunction(onHelpAddr, 'void', ['pointer', 'pointer']);
            fn(bagInstance, ptr(0));
            return "help called OK";
        } catch(e) {
            return "error: " + e.message;
        }
    },
    isBagOpen: function() {
        return !(!bagInstance || bagInstance.isNull());
    },
    compareButtons: function() {
        return {
            closeCount: closeMenuItems.length,
            hintCount: hintMenuItems.length,
            tabCount: tabMenuItems.length,
            close: closeMenuItems.map(String),
            hint: hintMenuItems.map(String),
            tab: tabMenuItems.map(String),
        };
    }
};

setInterval(install, 1000);
install();
