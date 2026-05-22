import frida, sys

# Minimal crash prevention + guide bypass
JS = """
var mod = Process.findModuleByName("libgame_logic.so");
if (mod) { install(mod.base); }
else {
    var t = setInterval(function() {
        var m = Process.findModuleByName("libgame_logic.so");
        if (m) { clearInterval(t); install(m.base); }
    }, 500);
}
function install(base) {
    send("[+] lib at " + base);
    // getChildrenByTag NULL guard
    Interceptor.attach(base.add(0x55fba0), {
        onEnter(a) { if(a[0].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send("[+] getChildrenByTag");
    // addAction NULL guard
    Interceptor.attach(base.add(0x477a921), {
        onEnter(a) { if(a[0].isNull()||a[2].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send("[+] addAction");
    // showMaskLayer bypass
    Interceptor.attach(base.add(0x597784), {
        onEnter(a) { send("[GUIDE] mask blocked"); a[0]=a[0]; this.context.pc=this.context.lr; }
    });
    send("[+] showMaskLayer");
    // beginGuide bypass
    Interceptor.attach(base.add(0x5818d4), {
        onEnter(a) { send("[GUIDE] begin blocked"); this.context.pc=this.context.lr; }
    });
    send("[+] beginGuide");
    send("[*] ALL HOOKS ACTIVE");
}
"""

d = frida.get_usb_device()
pid = 4680
s = d.attach(pid)
script = s.create_script(JS)
script.on('message', lambda m, d: print(f"[{m['type']}] {m.get('payload', m.get('description', ''))}"))
script.load()
import os, time
with open(os.path.join(os.path.dirname(__file__), 'frida_attach_log.txt'), 'w') as f:
    f.write("[+] Hooks injected. Game should be stable now.\n")
print("[+] Hooks injected. Game should be stable now.")
sys.stdout.flush()
time.sleep(999999)
