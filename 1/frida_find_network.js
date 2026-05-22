// Find OnlineNetworkManager singleton
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if (nm.includes("OnlineNetworkManager") && nm.includes("shared")) {
        send(`${nm} @ ${exp.address}`);
    }
    if (nm === "_ZN20OnlineNetworkManager25sendGetPlayerItemsMessageEv") {
        send(`sendGetPlayerItemsMessage @ ${exp.address}`);
    }
}
send('[***] Done');
