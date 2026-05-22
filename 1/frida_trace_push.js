// Trace all push message parsing to find correct formats
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");

// Find all MergePartialFromCodedStream functions for prize/bag messages
const targets = ['gain_prize', 'item_bag', 'notify_item', 'notify_text', 'notify_gain'];
let count = 0;

for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes('MergePartialFromCodedStream')) {
        for (const t of targets) {
            if (nm.includes(t)) {
                try {
                    Interceptor.attach(exp.address, {
                        onEnter(args) {
                            this.name = nm;
                            this.msg = args[0];
                        },
                        onLeave(retval) {
                            const short = this.name.split('::').pop();
                            send(`[MERGE] ${short} → ${retval.toInt32() ? 'OK' : 'FAIL'}`);
                        }
                    });
                    count++;
                } catch(e) {}
                break;
            }
        }
    }
}

send(`[+] Hooked ${count} push message merge functions`);
send(`[***] Now mine to trigger pushes...`);
