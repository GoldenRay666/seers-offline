"""Connect to frida-gadget in listen mode."""
import frida, sys, time

JS = open(r"C:\javatools\1\frida_trace_guide.js", encoding="utf-8").read()

dev = frida.get_device_manager().add_remote_device("127.0.0.1:27042")
print(f"[+] Connected", flush=True)

# In listen mode, the gadget exposes the injected process directly
# Try different session creation methods
session = None

# Method 1: attach by name
try:
    session = dev.attach("com.taomee.seers")
    print("[+] Attached by name", flush=True)
except Exception as e:
    print(f"[-] name attach failed: {e}", flush=True)

# Method 2: attach by pid
if not session:
    try:
        procs = dev.enumerate_processes()
        print(f"[*] Processes: {[(p.pid, p.name) for p in procs[:5]]}", flush=True)
        for p in procs:
            if "taomee" in p.name or "Gadget" in p.name or "seers" in p.name:
                session = dev.attach(p.pid)
                print(f"[+] Attached to {p.name} pid={p.pid}", flush=True)
                break
    except Exception as e:
        print(f"[-] process enum failed: {e}", flush=True)

# Method 3: resume + attach
if not session:
    try:
        # gadget might auto-attach; try spawning
        pid = dev.spawn(["com.taomee.seers"])
        session = dev.attach(pid)
        dev.resume(pid)
        print(f"[+] Spawned+attached pid={pid}", flush=True)
    except Exception as e:
        print(f"[-] spawn failed: {e}", flush=True)

if not session:
    # Method 4: The gadget IS the session
    try:
        # Gadget in listen mode - the device itself represents the session
        print("[*] Trying direct script load...", flush=True)
        # Sometimes we need to use the device directly
        session = dev  # this won't work but let's see
    except:
        pass

if session and session != dev:
    script = session.create_script(JS)
    script.on('message', lambda m, d: print(f"[JS] {m.get('payload', m)}", flush=True))
    script.load()
    print("[+] Script loaded. Accept the quest now!", flush=True)
else:
    print("[-] Could not create session. Manual steps needed.", flush=True)
    print("[*] Try: frida -H 127.0.0.1:27042 -n com.taomee.seers", flush=True)

try:
    while True:
        time.sleep(1)
        sys.stdout.flush()
except KeyboardInterrupt:
    print("[*] Done", flush=True)
