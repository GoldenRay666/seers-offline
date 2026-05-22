// Diagnose: check if merge function exists
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
let count = 0;
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("mine_info_out") && exp.name.includes("Merge")) {
        send(`[DIAG] MERGE: ${exp.name} @ ${exp.address}`);
        count++;
    }
}
send(`[DIAG] Found ${count} mine merge functions`);

// Check game process
send(`[DIAG] PID: ${Process.id}`);
send(`[DIAG] Module base: ${mod.base}`);
