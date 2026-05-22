import frida, time, sys, os

JS = """
var installed = false;
function tryInstall() {
    if (installed) return;
    var mod = Process.findModuleByName("libgame_logic.so");
    if (!mod) return;
    installed = true;
    var base = mod.base;
    send("[DAEMON] libgame_logic.so at " + base);

    // getChildrenByTag NULL guard
    Interceptor.attach(base.add(0x55fba0), {
        onEnter(a) { if(a[0].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send("[DAEMON] +getChildrenByTag");

    // addAction NULL guard
    Interceptor.attach(base.add(0x477a921), {
        onEnter(a) { if(a[0].isNull()||a[2].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send("[DAEMON] +addAction");

    // showMaskLayer bypass
    Interceptor.attach(base.add(0x597784), {
        onEnter(a) {
            send("[DAEMON] GUIDE showMaskLayer blocked");
            this.context.pc = this.context.lr;
        }
    });
    send("[DAEMON] +showMaskLayer");

    // beginGuide bypass
    Interceptor.attach(base.add(0x5818d4), {
        onEnter(a) {
            send("[DAEMON] GUIDE beginGuide blocked");
            this.context.pc = this.context.lr;
        }
    });
    send("[DAEMON] +beginGuide");

    send("[DAEMON] ALL HOOKS ACTIVE");
}
setInterval(tryInstall, 500);
tryInstall();
"""

log = open('c:/javatools/1/daemon_log.txt', 'w', buffering=1)

d = frida.get_usb_device()
s = d.attach(4680)
script = s.create_script(JS)
def on_msg(m, d):
    line = f"[{m['type']}] {m.get('payload', m.get('description', ''))}\n"
    log.write(line)
    sys.stdout.write(line)
    sys.stdout.flush()
script.on('message', on_msg)
script.load()
log.write("[DAEMON] Frida daemon started, waiting for libgame_logic.so...\n")
log.flush()
sys.stdout.write("[DAEMON] Started. Monitoring for library load...\n")
sys.stdout.flush()

# Stay alive indefinitely
try:
    while True:
        time.sleep(5)
except KeyboardInterrupt:
    log.write("[DAEMON] Stopped by user\n")
    log.close()
    script.unload()
    s.detach()
