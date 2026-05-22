/**
 * Frida script - Bypass GuideLayer mask in 赛尔号战神联盟
 *
 * Strategy:
 * 1. Hook GuideLayer::showMaskLayer to be a no-op
 * 2. Hook GuideLayer::ccTouchBegan to pass ALL touches through (not just window area)
 * 3. OR: Find m_maskLayer node after init and set opacity to 0
 *
 * Run: frida -U -l bypass_guide.js com.taomee.seers
 */

'use strict';

const MODULE = "libgame_logic.so";

// Addresses (Thumb mode: actual PC = address + 1 for Thumb functions)
const ADDRS = {
    // GuideLayer methods
    showMaskLayer:   0x597784,  // GuideLayer::showMaskLayer
    beginGuide1:     0x5818d4,  // GameOpenAssignFunctionManager::beginGuide (variant 1)
    beginGuide2:     0x5974fc,  // GameOpenAssignFunctionManager::beginGuide (variant 2)
};

function hookIfExists(name, address, onEnterFn, onLeaveFn) {
    try {
        const func = Module.findBaseAddress(MODULE).add(address);
        Interceptor.attach(func, {
            onEnter: onEnterFn || function(args) {
                console.log(`[BYPASS] ${name} called`);
            },
            onLeave: onLeaveFn || function(retval) {
                console.log(`[BYPASS] ${name} returned: ${retval}`);
            }
        });
        console.log(`[+] Hooked ${name} at ${address.toString(16)}`);
        return true;
    } catch (e) {
        console.log(`[-] Failed to hook ${name}: ${e.message}`);
        return false;
    }
}

// Find GuideLayer instance and make mask transparent
function findAndDisableMask() {
    // The GuideLayer is a CCNode/CCLayer in the cocos2d scene
    // Find it by class name or by iterating children
    console.log("[*] Searching for GuideLayer instance...");

    // Get running scene
    const director = Module.findExportByName("libgame_logic.so",
        "_ZN7cocos2d8CCDirector16sharedDirectorEv");
    if (!director) {
        console.log("[-] CCDirector::sharedDirector not found");
        return;
    }

    // Try to get the running scene
    // C++ side: CCDirector::sharedDirector()->getRunningScene()
    // Then find GuideLayer children
    console.log("[*] GuideLayer mask bypass - will hook showMaskLayer instead");
}

// Hook after libgame_logic.so is loaded
function waitForModule(name, callback) {
    const mod = Process.findModuleByName(name);
    if (mod) {
        callback(mod);
    } else {
        const listener = Process.setModuleLoadCallback(name, function(mod) {
            callback(mod);
            Process.setModuleLoadCallback(name, null); // unhook
        });
    }
}

// Main: wait for game library to load
waitForModule(MODULE, function(mod) {
    console.log(`[+] ${MODULE} loaded at ${mod.base}`);

    // Hook showMaskLayer - prevent mask from showing
    hookIfExists("showMaskLayer", ADDRS.showMaskLayer,
        function(args) {
            console.log("[BYPASS] showMaskLayer called - PREVENTING");
            // Force return immediately
            this.context.pc = this.context.lr; // skip function
        }
    );

    // Hook beginGuide variants
    hookIfExists("beginGuide_v1", ADDRS.beginGuide1,
        function(args) {
            console.log("[BYPASS] beginGuide v1 - blocking");
            this.context.pc = this.context.lr;
        }
    );

    hookIfExists("beginGuide_v2", ADDRS.beginGuide2,
        function(args) {
            console.log("[BYPASS] beginGuide v2 - blocking");
            this.context.pc = this.context.lr;
        }
    );

    console.log("[*] Guide bypass hooks installed.");
    console.log("[*] If mask still appears, the mask is created during CCBI load,");
    console.log("[*] not via showMaskLayer. Try the CCBI modification approach.");
});

// Alternative approach: find all CCLayerColor nodes and set opacity to 0
// Only activate if the above hooks don't work
function tryOpacityBypass() {
    console.log("[*] Trying opacity bypass approach...");

    // CCLayerColor::setOpacity signature
    const setOpacity = Module.findExportByName("libgame_logic.so",
        "_ZN7cocos2d12CCLayerColor10setOpacityEa");
    if (setOpacity) {
        console.log(`[+] Found CCLayerColor::setOpacity at ${setOpacity}`);
        Interceptor.attach(setOpacity, {
            onEnter: function(args) {
                // args[1] is the opacity value (GLubyte)
                const opacity = args[1].toInt32();
                // If setting to semi-transparent (guide mask is usually 100-180)
                if (opacity > 50 && opacity < 200) {
                    console.log(`[BYPASS] Overriding CCLayerColor opacity from ${opacity} to 0`);
                    args[1] = ptr(0); // force opacity to 0 (fully transparent)
                }
            }
        });
    }
}

// Set a timeout to try the opacity approach after 3 seconds
setTimeout(function() {
    tryOpacityBypass();
}, 3000);

console.log("[*] Frida guide bypass script loaded. Waiting for game...");
