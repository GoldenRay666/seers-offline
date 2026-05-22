// Hook task error handler and force task completion
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Hook handleErrMapTaskUnfinished
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("handleErrMapTaskUnfinished")) {
        send(`Found: ${exp.name} @ ${exp.address}`);
        Interceptor.attach(exp.address, {
            onEnter(args) {
                send(`[TASK-ERR] handleErrMapTaskUnfinished called! this=${args[0]}`);
                // Print stack trace
                send(Thread.backtrace(this.context, Backtracer.ACCURATE).map(DebugSymbol.fromAddress).join('\n'));
            }
        });
    }
}

// Also find QuestManager functions
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("QuestManager") && exp.name.includes("check") && exp.name.length < 80) {
        send(`QuestManager: ${exp.name}`);
    }
}

send('[***] Ready. Talk to NPC to see what triggers.');
