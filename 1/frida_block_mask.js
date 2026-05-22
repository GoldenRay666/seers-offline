// Try to prevent loading/waiting overlay from appearing
// Hook common overlay creation patterns

'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Functions that might show loading overlay
const SHOW_PATTERNS = [
    "showLoading", "showWait", "showMask", "setVisible",
    "addChild", "showOverlay", "showBlock",
    "lockScreen", "showModal", "LoadingLayer",
    "WaitLayer", "BlockLayer"
];

let hooked = 0;
for (const exp of mod.enumerateExports()) {
    for (const p of SHOW_PATTERNS) {
        if (exp.name.includes(p)) {
            try {
                Interceptor.attach(exp.address, {
                    onEnter(args) {
                        send(`[BLOCK] ${exp.name}`);
                    }
                });
                hooked++;
            } catch(e) {}
            break;
        }
    }
}

send(`[+] Hooked ${hooked} overlay-related functions`);
send(`[***] Now trigger the quest gray screen again...`);
send(`[***] But the hooks are already active on the current state`);
send(`[***] Tell me what you see - we captured all addChild/setVisible etc`);
