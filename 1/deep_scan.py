"""Scan ALL modules for anything that could be the game lib"""
import frida, time, sys

# Wait for game to be in connected state, then scan
d = frida.get_device('127.0.0.1:7555')

# Start game
pid = d.spawn(['com.taomee.seers'])
s = d.attach(pid)
script = s.create_script("""
// Poll continuously and dump ALL modules when count increases
var lastCount = 0;
setInterval(function() {
    var mods = Process.enumerateModules();
    if (mods.length > lastCount) {
        lastCount = mods.length;
        send('Module count changed to: ' + mods.length);
        // Check for game lib
        for (var i = 0; i < mods.length; i++) {
            var m = mods[i];
            // Check ALL possible names
            if (m.name.indexOf('game') >= 0 || m.name.indexOf('logic') >= 0 ||
                m.name.indexOf('cocos') >= 0 || m.name.indexOf('seer') >= 0 ||
                m.name.indexOf('Seer') >= 0 || m.name.indexOf('taomee') >= 0 ||
                m.path.indexOf('com.taomee') >= 0) {
                send('>>> FOUND: ' + m.name + ' base=' + m.base + ' size=' + m.size + ' path=' + m.path);
            }
        }
    }
    // Also try findModuleByName with a full path
    var m = Process.findModuleByName('/data/app/com.taomee.seers-1/lib/arm/libgame_logic.so');
    if (m) {
        send('>>> FOUND BY FULL PATH: ' + m.base);
    }
}, 1000);
""")
script.on('message', lambda m, d: print(m.get('payload', str(m))))
script.load()
d.resume(pid)
print(f'[+] PID {pid} running. Scanning for game lib...')
sys.stdout.flush()

# Run for 5 minutes
time.sleep(300)
script.unload()
s.detach()
