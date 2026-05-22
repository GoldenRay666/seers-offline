// Hook all task-check functions to see which one blocks NPC
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

const checks = [
    "isQuestFinished", "isTaskStepByQuestID", "isHaveQuestByQuestID",
    "handleErrMapTaskUnfinished", "handleErrQuestUnfinishedWhenSubmit",
    "getQuestInfoByQuestId", "getQuestState", "checkAction",
    "isTaskFinished", "getTaskState"
];

for (const exp of mod.enumerateExports()) {
    for (const c of checks) {
        if (exp.name.includes(c) && exp.name.length < 100) {
            try {
                Interceptor.attach(exp.address, {
                    onEnter(args) {
                        send(`[TASK-CHECK] ${c} this=${args[0]} a1=${args[1]} a2=${args[2]}`);
                    },
                    onLeave(retval) {
                        send(`[TASK-CHECK] ${c} ret=${retval}`);
                    }
                });
            } catch(e) {}
            break;
        }
    }
}
send('[***] Go talk to NPC now');
