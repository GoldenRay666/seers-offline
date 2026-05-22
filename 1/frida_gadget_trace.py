"""Connect to frida-gadget and trace guide functions."""
import frida, sys, time

JS = open(r"C:\javatools\1\frida_trace_guide.js", encoding="utf-8").read()

# Connect to gadget
dev = frida.get_device_manager().add_remote_device("127.0.0.1:27042")
print(f"[+] Connected to gadget device", flush=True)

# The gadget is already attached to the app process
# On gadget, we access the single session directly
try:
    session = dev.attach("com.taomee.seers")
    print(f"[+] Attached to com.taomee.seers", flush=True)
except:
    # Try attaching to the gadget's current session
    # With listen mode, we need to enumerate processes
    print("[*] Trying enumerate...", flush=True)
    for app in dev.enumerate_applications():
        if "taomee" in app.identifier:
            print(f"[*] Found: {app.identifier} pid={app.pid}", flush=True)
    # Try attach by pid
    processes = dev.enumerate_processes()
    for p in processes:
        if "taomee" in p.name:
            print(f"[*] Found process: {p.name} pid={p.pid}", flush=True)
            session = dev.attach(p.pid)
            print(f"[+] Attached to pid {p.pid}", flush=True)
            break

script = session.create_script(JS)
script.on('message', lambda m, d: print(f"[JS] {m.get('payload', m)}", flush=True))
script.load()
print("[+] Script loaded. TRACE ACTIVE.", flush=True)
print("[*] Accept the quest now to trigger gray screen...", flush=True)

try:
    while True:
        time.sleep(1)
        sys.stdout.flush()
except KeyboardInterrupt:
    print("[*] Done", flush=True)
    session.detach()
