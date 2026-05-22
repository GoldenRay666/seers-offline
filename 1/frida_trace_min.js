// Minimal trace: just hook processGuide, goNextStep, endGuide
'use strict';
const BASE = Module.findBaseAddress("libgame_logic.so");
send(`[+] BASE=${BASE}`);

// processGuide
Interceptor.attach(BASE.add(0x46e700), {
    onEnter(args) { send(`>>> processGuide`); }
});
// goNextStep
Interceptor.attach(BASE.add(0x46e784), {
    onEnter(args) { send(`>>> goNextStep`); }
});
// endGuide
Interceptor.attach(BASE.add(0x46e53c), {
    onEnter(args) { send(`>>> endGuide`); }
});
// beginGuide
Interceptor.attach(BASE.add(0x46e7d0), {
    onEnter(args) { send(`>>> beginGuide`); }
});
// guideShowFunctionButtons
Interceptor.attach(BASE.add(0x46f8de), {
    onEnter(args) { send(`>>> guideShowFunctionButtons`); }
});
// guideTakeQuest
Interceptor.attach(BASE.add(0x46f92e), {
    onEnter(args) { send(`>>> guideTakeQuest`); }
});
// guideHideFunctionButtons
Interceptor.attach(BASE.add(0x46e7c0), {
    onEnter(args) { send(`>>> guideHideFunctionButtons`); }
});
// guideElectricityHint
Interceptor.attach(BASE.add(0x46f74c), {
    onEnter(args) { send(`>>> guideElectricityHint`); }
});
send("[+] 8 hooks active. Accept quest now.");
