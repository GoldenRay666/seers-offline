"""Spawn seers on ARM with touch debugging hooks."""
import frida, sys, time

JS = open(r"C:\javatools\1\frida_touch.js", encoding="utf-8").read()

d = frida.get_usb_device()
pid = d.spawn(["com.taomee.seers"])
print(f"[+] Spawned PID: {pid}", flush=True)
s = d.attach(pid)
print(f"[+] Attached to PID {pid}", flush=True)
script = s.create_script(JS)
script.on('message', lambda m, d: print(f"[JS] {m.get('payload', m.get('description', ''))}", flush=True))
script.load()
print("[+] Script loaded", flush=True)
d.resume(pid)
print(f"[+] Resumed PID {pid}", flush=True)
print("[*] Watching touch events. Tap Eva dialog now...", flush=True)

try:
    while True:
        time.sleep(2)
        sys.stdout.flush()
except KeyboardInterrupt:
    print("[*] Interrupt", flush=True)
    s.detach()
