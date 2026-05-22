// Find the obtain_task_out message handler
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Search for task-related handlers
const KW = ["obtain_task", "ObtainTask", "handleTask", "HandleTask",
            "onObtain", "OnObtain", "taskObtain", "TaskObtain",
            "questObtain", "QuestObtain", "handleMessage", "HandleMessage",
            "dispatchMessage", "DispatchMessage", "onMessage", "OnMessage"];

send("Searching for task handler functions...");
for (const kw of KW) {
    const matches = [];
    for (const exp of mod.enumerateExports()) {
        if (exp.name.includes(kw)) {
            matches.push({name: exp.name, addr: exp.address, offset: exp.address.sub(mod.base)});
        }
    }
    if (matches.length > 0 && matches.length <= 20) {
        send(`\n[${kw}] ${matches.length} matches:`);
        for (const m of matches) {
            send(`  ${m.name} (offset: ${m.offset})`);
        }
    }
}

// Also look for NetWorkUtil dispatch
send("\n\nNetwork dispatch functions:");
for (const exp of mod.enumerateExports()) {
    if (exp.name.includes("dispatch") || exp.name.includes("Dispatch")) {
        if (exp.name.includes("NetWork") || exp.name.includes("Network") || exp.name.includes("Message")) {
            send(`  ${exp.name} (offset: ${exp.address.sub(mod.base)})`);
        }
    }
}

send("\n[***] Done");
