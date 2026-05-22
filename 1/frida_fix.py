"""Frida: crash prevention only (minimal, working)"""
import frida, time, sys

JS = """
var installed = false;
function tryInstall() {
    if (installed) return;
    var m = Process.findModuleByName('libgame_logic.so');
    if (!m) return;
    installed = true;
    var base = m.base;
    send('[+] libgame_logic.so at ' + base);

    // Crash prevention - getChildrenByTag
    Interceptor.attach(base.add(0x55fba0), {
        onEnter(a) { if(a[0].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send('[+] getChildrenByTag guard');

    // Crash prevention - addAction
    Interceptor.attach(base.add(0x477a921), {
        onEnter(a) { if(a[0].isNull()||a[2].isNull()) this.s=1; },
        onLeave(r) { if(this.s) r.replace(ptr(0)); }
    });
    send('[+] addAction guard');

    send('[***] CRASH PREVENTION ACTIVE');
}
setInterval(tryInstall, 300);
"""

d = frida.get_device('127.0.0.1:7555')
pid = d.spawn(['com.taomee.seers'])
print(f'[+] PID: {pid}')
s = d.attach(pid)
script = s.create_script(JS)
script.on('message', lambda m, d: print(f'[JS] {m.get("payload", str(m))}'))
script.load()
d.resume(pid)
print(f'[+] Resumed. Crash prevention loaded.')
sys.stdout.flush()

while True:
    time.sleep(5)
