// Find all OnlineNetworkManager functions
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.startsWith("_ZN20OnlineNetworkManager") && nm.length < 80) {
        send(nm);
    }
}
send('[***] Done');
