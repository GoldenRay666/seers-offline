/**
 * Frida hook script for 赛尔号战神联盟 offline reconstruction.
 * Run: frida -U -l hook.js com.taomee.seers
 */

// ============================================================
// Phase 1: Network trace — capture all protocol data
// ============================================================

function hookNetWorkUtil() {
    const module = Process.findModuleByName("libgame_logic.so");
    if (!module) { console.log("[!] libgame_logic.so not loaded yet"); return; }
    const base = module.base;
    console.log("[+] libgame_logic.so base:", base);

    // NetWorkUtil::connect2Server(char const* ip, float, int port)
    const connect2Server = Module.findExportByName("libgame_logic.so",
        "_ZN11NetWorkUtil14connect2ServerEPKcifi");
    if (connect2Server) {
        Interceptor.attach(connect2Server, {
            onEnter(args) {
                const ip = args[0].readCString();
                const port = args[2].toInt32();
                console.log(`\n[NET] connect2Server(${ip}, port=${port})`);
                console.log(`  Call stack:`);
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\n  '));
            },
            onLeave(retval) {
                console.log(`[NET] connect2Server returned: ${retval}`);
            }
        });
        console.log("[+] Hooked connect2Server");
    } else {
        console.log("[!] connect2Server not found");
    }

    // NetWorkUtil::sendMessage — multiple overloads
    const sendMsg = Module.findExportByName("libgame_logic.so",
        "_ZN11NetWorkUtil11sendMessageEPN14ISeer20CSProto13cs_msg_head_tEPN6google8protobuf7MessageEfi");
    if (sendMsg) {
        Interceptor.attach(sendMsg, {
            onEnter(args) {
                console.log(`\n[NET] sendMessage called`);
                console.log(`  head: ${args[0]}, msg: ${args[1]}`);
                // Try to dump protobuf data
                try {
                    const msgPtr = args[1];
                    if (!msgPtr.isNull()) {
                        // Read first 128 bytes of message
                        const data = msgPtr.readByteArray(128);
                        if (data) console.log(`  msg data: ${hexdump(data, {length: 128})}`);
                    }
                } catch(e) {}
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\n  '));
            }
        });
        console.log("[+] Hooked sendMessage");
    }

    // NetWorkUtil::decodeMessage
    const decodeMsg = Module.findExportByName("libgame_logic.so",
        "_ZN11NetWorkUtil13decodeMessageEPciRS0_RiS1_S2_S2_");
    if (decodeMsg) {
        Interceptor.attach(decodeMsg, {
            onEnter(args) {
                const buf = args[0];
                const len = args[1].toInt32();
                console.log(`\n[NET] decodeMessage(len=${len})`);
                if (buf && len > 0 && len < 4096) {
                    console.log(hexdump(buf, {length: Math.min(len, 256)}));
                }
            },
            onLeave(retval) {
                console.log(`[NET] decodeMessage returned: ${retval}`);
            }
        });
        console.log("[+] Hooked decodeMessage");
    }

    // NetWorkUtil::dispatchMessage
    const dispatchMsg = Module.findExportByName("libgame_logic.so",
        "_ZN11NetWorkUtil15dispatchMessageEPciS0_ii");
    if (dispatchMsg) {
        Interceptor.attach(dispatchMsg, {
            onEnter(args) {
                const buf = args[0];
                const len = args[1].toInt32();
                console.log(`\n[NET] dispatchMessage(len=${len})`);
                if (buf && len > 0 && len < 4096) {
                    console.log(hexdump(buf, {length: Math.min(len, 256)}));
                }
            }
        });
        console.log("[+] Hooked dispatchMessage");
    }
}

// ============================================================
// Phase 2: Server selection crash analysis
// ============================================================

function hookServerSelection() {
    // SelectServerLayer::onServerSelected
    const onServerSelected = Module.findExportByName("libgame_logic.so",
        "_ZN17SelectServerLayer16onServerSelectedEPN7cocos2d8CCObjectE");
    if (onServerSelected) {
        Interceptor.attach(onServerSelected, {
            onEnter(args) {
                console.log(`\n[UI] SelectServerLayer::onServerSelected(${args[1]})`);
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\n  '));
            }
        });
        console.log("[+] Hooked onServerSelected");
    }

    // AccountLoginLayer::setServerList
    const setServerList = Module.findExportByName("libgame_logic.so",
        "_ZN17AccountLoginLayer13setServerListERSt6vectorI16ServerListInfo_tSaIS1_EE");
    if (setServerList) {
        Interceptor.attach(setServerList, {
            onEnter(args) {
                console.log(`\n[UI] AccountLoginLayer::setServerList(${args[1]})`);
                // Try to read vector size
                try {
                    const vecPtr = args[1];
                    const size = vecPtr.add(0).readU32();
                    console.log(`  Vector size: ${size}`);
                } catch(e) {}
            }
        });
        console.log("[+] Hooked setServerList");
    }
}

// ============================================================
// Phase 3: JSON parsing
// ============================================================

function hookJsonParsing() {
    // parseJsonStr(char const*, Json::Value&)
    const parseJsonStr = Module.findExportByName("libgame_logic.so",
        "_Z12parseJsonStrPKcRN4Json5ValueE");
    if (parseJsonStr) {
        Interceptor.attach(parseJsonStr, {
            onEnter(args) {
                const str = args[0].readCString();
                if (str && str.length > 0) {
                    console.log(`\n[JSON] parseJsonStr(len=${str.length})`);
                    console.log(`  ${str.substring(0, 500)}`);
                }
            }
        });
        console.log("[+] Hooked parseJsonStr");
    }
}

// ============================================================
// Phase 4: Login flow
// ============================================================

function hookLoginFlow() {
    const startConnect = Module.findExportByName("libgame_logic.so",
        "_ZN12LoginManager18startConnectServerEv");
    if (startConnect) {
        Interceptor.attach(startConnect, {
            onEnter(args) {
                console.log(`\n[LOGIN] LoginManager::startConnectServer()`);
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\n  '));
            }
        });
        console.log("[+] Hooked startConnectServer");
    }

    const doLogin = Module.findExportByName("libgame_logic.so",
        "_ZN14TmLoginManager7doLoginEv");
    if (doLogin) {
        Interceptor.attach(doLogin, {
            onEnter(args) {
                console.log(`\n[LOGIN] TmLoginManager::doLogin()`);
            }
        });
        console.log("[+] Hooked doLogin");
    }
}

// ============================================================
// Phase 5: CHECK/abort intercept
// ============================================================

function hookAbort() {
    const abortPtr = Module.findExportByName(null, "abort");
    if (abortPtr) {
        Interceptor.attach(abortPtr, {
            onEnter(args) {
                console.log(`\n[!!!] ABORT called!`);
                console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
                    .map(DebugSymbol.fromAddress).join('\n  '));
            }
        });
        console.log("[+] Hooked abort() — will capture crash!");
    }
}

// ============================================================
// Main
// ============================================================

console.log("[*] Seer2 Frida hook starting...");

// Hook abort first (to catch crashes)
hookAbort();

// Try to hook immediately if module is already loaded
const mod = Process.findModuleByName("libgame_logic.so");
if (mod) {
    hookNetWorkUtil();
    hookServerSelection();
    hookJsonParsing();
    hookLoginFlow();
} else {
    // Wait for the module to load
    console.log("[*] Waiting for libgame_logic.so to load...");
    const listener = Process.setModuleLoadListener((m) => {
        if (m.name === "libgame_logic.so") {
            console.log("[+] libgame_logic.so loaded!");
            hookNetWorkUtil();
            hookServerSelection();
            hookJsonParsing();
            hookLoginFlow();
        }
    });
}

console.log("[*] All hooks installed. Waiting for game activity...\n");
