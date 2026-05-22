// After mining, force-update task progress locally
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

// Find task-related functions
send('=== Task manager functions ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm.includes("Task") || nm.includes("task")) &&
        (nm.includes("set") || nm.includes("update") || nm.includes("finish") ||
         nm.includes("complete") || nm.includes("progress") || nm.includes("step")) &&
        nm.length < 100) {
        send(nm);
    }
}
send('[***] Done - check for useful functions');
