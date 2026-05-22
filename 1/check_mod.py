import frida, time
d = frida.get_device('127.0.0.1:7555')
s = d.attach(5678)
script = s.create_script("""
var m = Process.findModuleByName('libgame_logic.so');
if (m) {
    send('libgame_logic.so at ' + m.base + ' size=' + m.size);
} else {
    send('NOT LOADED via Process.findModuleByName');
    var nb = Process.findModuleByName('libnb.so');
    var houdini = Process.findModuleByName('libhoudini.so');
    send('libnb: ' + (nb ? nb.base : 'not found'));
    send('libhoudini: ' + (houdini ? houdini.base : 'not found'));
}
""")
script.on('message', lambda m, d: print(m.get('payload', str(m))))
script.load()
time.sleep(0.5)
script.unload()
s.detach()
print('Done')
