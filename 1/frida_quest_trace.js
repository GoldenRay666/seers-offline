// Minimal trace for quest gray screen investigation
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
send(`[+] libgame_logic.so at ${mod.base}`);

const TARGETS = [
    "processGuideEv",
    "beginGuideEv",
    "endGuideEv",
    "goNextStepEv",
    "getGuideStepEv",
    "guideTakeQuestEv",
    "guideSubmitQuestEv",
    "guideQuestCenterDialogEv",
    "guidePressQuestCenterEv",
    "showDialogNodeEv",
    "hideDialogNodeEv",
    "guideWalkToEvaEv",
    "guideShowFunctionButtonsEv",
    "guideHideFunctionButtonsEv",
];

let hooked = 0;

for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    for (const t of TARGETS) {
        if (nm.endsWith(t)) {
            const label = t.replace("Ev", "");
            try {
                Interceptor.attach(exp.address, {
                    onEnter: function(args) {
                        send(`[GUIDE] -> ${label}`);
                    }
                });
                hooked++;
            } catch(e) {}
            break;
        }
    }
}

send(`[+] ${hooked} hooks active`);
send(`[***] Now accept the quest to trigger gray screen...`);
