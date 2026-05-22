import frida, time

d = frida.get_device('127.0.0.1:7555')
s = d.attach(5760)

script = s.create_script("""
var mods = Process.enumerateModules();
send('Total: ' + mods.length);
var found = [];
mods.forEach(function(m) {
    var n = m.name.toLowerCase();
    if (n.indexOf('game') >= 0 || n.indexOf('logic') >= 0 ||
        n.indexOf('cocos') >= 0 || n.indexOf('seer') >= 0 ||
        n.indexOf('taomee') >= 0 || n.match(/lib(?!nb|houdini|cutils|utils|log|binder|c|m|dl)/)) {
        found.push(m.name + ' @ ' + m.base + ' [' + m.size + ']');
    }
});
if (found.length === 0) {
    send('No game-like modules found. First 30 modules:');
    mods.slice(0, 30).forEach(function(m) {
        send('  ' + m.name + ' @ ' + m.base);
    });
} else {
    found.forEach(function(f) { send(f); });
}
""")

script.on('message', lambda m, d: print(m.get('payload', str(m))))
script.load()
time.sleep(1)
script.unload()
s.detach()
