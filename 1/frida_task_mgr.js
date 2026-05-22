// Find task data update functions
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

send('=== Quest/Task Manager key functions ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm.includes("QuestManager") || nm.includes("TaskManager") || nm.includes("QuestData")) &&
        (nm.includes("set") || nm.includes("update") || nm.includes("finish") || nm.includes("step") || nm.includes("complete") || nm.includes("sharedManager")) &&
        nm.length < 100) {
        send(nm);
    }
}

send('\n=== GameQuestDataManager ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("GameQuestDataManager") && nm.length < 100) {
        send(nm);
    }
}

send('[***] Done');
