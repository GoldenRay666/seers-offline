// Wide trace: include Quest, Scene, Mask, EventSwallow
'use strict';

const mod = Process.findModuleByName("libgame_logic.so");
send(`[+] libgame_logic.so at ${mod.base}`);

// Keywords to match
const KW = [
    "Quest", "quest",
    "Mask", "mask",
    "EventSwallow", "Swallow",
    "Guide", "guide",
    "Scene",
    "Dialog", "dialog",
];

let hooked = 0;
const foundNames = [];

for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    for (const kw of KW) {
        if (nm.includes(kw)) {
            try {
                Interceptor.attach(exp.address, {
                    onEnter: function(args) {
                        const short = this.name.replace(/_ZN.*::/, '').replace('Ev', '');
                        send(`[TRACE] ${short}`);
                    }.bind({name: nm})
                });
                hooked++;
                foundNames.push(nm);
                if (foundNames.length <= 60) send(`  [OK] ${nm}`);
            } catch(e) {}
            break;
        }
    }
}

send(`\n[+] Hooked ${hooked} functions`);
send(`[***] Now accept the quest...`);
