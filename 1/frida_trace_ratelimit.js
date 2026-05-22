// Rate-limited trace: send max 5 calls per function, then mute
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
send(`[+] libgame_logic.so at ${mod.base}`);

const TARGETS = [
    "processGuideEv", "beginGuideEv", "endGuideEv", "goNextStepEv",
    "getGuideStepEv", "guideTakeQuestEv", "guideSubmitQuestEv",
    "guideQuestCenterDialogEv", "guidePressQuestCenterEv",
    "showDialogNodeEv", "hideDialogNodeEv", "guideWalkToEvaEv",
    "guideShowFunctionButtonsEv", "guideHideFunctionButtonsEv",
    "isInGuideEv",
];

// Track call count per function
const counts = {};

let hooked = 0;

for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    for (const t of TARGETS) {
        if (nm.endsWith(t)) {
            const label = t.replace("Ev", "");
            counts[label] = 0;
            try {
                Interceptor.attach(exp.address, {
                    onEnter: function(args) {
                        const c = counts[label];
                        if (c < 5) {
                            counts[label] = c + 1;
                            send(`[GUIDE] -> ${label} (#${c + 1})`);
                        } else if (c === 5) {
                            counts[label] = 6;
                            send(`[GUIDE] ${label}: muted (too frequent)`);
                        }
                    }
                });
                hooked++;
            } catch(e) {}
            break;
        }
    }
}

send(`[+] ${hooked} hooks active (rate-limited to 5 calls each)`);
send(`[***] Watching guide calls in gray screen state...`);
