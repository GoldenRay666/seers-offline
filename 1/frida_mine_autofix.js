// Final working: container build + return replacement + synth config + tap fix
'use strict';
const ORE_MAP = {1: 20081, 2: 20082};
const MODULE = "libgame_logic.so";
let installed = false;

function install() {
    if (installed) return;
    const mod = Process.findModuleByName(MODULE);
    if (!mod) return;

    // === CONTAINER BUILD (best effort, for UserData completeness) ===
    let opNew = null;
    for (const exp of mod.enumerateExports()) if (exp.name === '_Znwj') { opNew = exp.address; break; }
    if (opNew) {
        for (const exp of mod.enumerateExports()) {
            if (exp.name === "_ZN8UserData13createNewDataEv") {
                Interceptor.attach(exp.address, {
                    onLeave(r) {
                        const caddr = mod.base.add(0xAC4158);
                        if (caddr.readPointer().isNull()) {
                            const N = 30; const sz = N * 17;
                            const buf = new NativeFunction(opNew, 'pointer', ['uint'])(sz);
                            if (!buf.isNull()) {
                                for (let i=0;i<sz;i+=4) buf.add(i).writeU32(0);
                                buf.add(0x00).writeU32(20081); buf.add(0x04).writeU32(10);
                                buf.add(0x11).writeU32(20082); buf.add(0x15).writeU32(5);
                                caddr.writePointer(buf);
                                caddr.add(4).writePointer(buf.add(sz));
                                caddr.add(8).writePointer(buf.add(sz));
                            }
                        }
                    }
                }); break;
            }
        }
    }

    // === RETURN REPLACEMENT (proven to work for display) ===
    function makeSaveItem(id, cnt) {
        const buf = Memory.alloc(0x11);
        for (let i=0;i<0x11;i+=4) buf.add(i).writeU32(0);
        buf.add(0).writeU32(id); buf.add(4).writeU32(cnt);
        return buf;
    }
    const si1 = makeSaveItem(20081, 10);
    const si2 = makeSaveItem(20082, 5);
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN8UserData17getItemWithGridIDEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) { this.gridId = a[0].toInt32(); },
                onLeave(r) {
                    if (r.isNull()) return;
                    if (this.gridId === 1) r.replace(si1);
                    else if (this.gridId === 2) r.replace(si2);
                }
            });
            break;
        }
    }

    // === ITEM CONFIG ===
    let m_getItemInfo = null;
    for (const exp of mod.enumerateExports())
        if (exp.name === "_ZN19GameItemDataManager19getItemInfoByItemIDEj") m_getItemInfo = exp.address;
    if (m_getItemInfo) {
        const syn = {};
        for (const [id, name] of [[20081,'黄铁矿'],[20082,'赤晶矿']]) {
            const buf = Memory.alloc(256);
            for (let i=0;i<256;i+=4) buf.add(i).writeU32(0);
            buf.add(0).writeU32(0xFFFFFFFF);
            const np = Memory.allocUtf8String(name);
            buf.add(4).writePointer(np); buf.add(8).writeU32(np.readUtf8String().length);
            buf.add(12).writeU32(np.readUtf8String().length);
            buf.add(16).writeU32(id); buf.add(20).writeU32(1); buf.add(24).writeU32(2); buf.add(28).writeU32(1);
            syn[id] = buf;
        }
        Interceptor.attach(m_getItemInfo, {
            onEnter(a) { this.id = a[1].toInt32(); },
            onLeave(r) { if (r.isNull() && syn[this.id]) r.replace(syn[this.id]); }
        });
    }

    // === TAP FIX ===
    let tappedGrid = 0;
    for (const exp of mod.enumerateExports()) {
        if (exp.name === "_ZN12ItemBagLayer14onItemSelectedEPN7cocos2d8CCObjectE") {
            Interceptor.attach(exp.address, {
                onEnter(a) { const n = a[1]; if (!n.isNull()) tappedGrid = n.add(0x0c).readU32(); }
            });
        }
        if (exp.name === "_ZN12ItemBagLayer12loadItemInfoEj") {
            Interceptor.attach(exp.address, {
                onEnter(a) { if (a[1].toInt32()===0 && tappedGrid>0) a[1] = ptr(tappedGrid); }
            });
        }
    }

    // === MINING ===
    for (const exp of mod.enumerateExports()) {
        if (!exp.name.includes("submit_map_mine_info_out")) continue;
        if (!exp.name.includes("MergePartialFromCodedStream")) continue;
        Interceptor.attach(exp.address, {
            onEnter(args) { this.msg = args[0]; },
            onLeave(retval) {
                const oreIndex = this.msg.add(12).readU32();
                const itemId = ORE_MAP[oreIndex] || 20081;
                this.msg.add(8).writeU32(itemId); this.msg.add(12).writeU32(1);
                retval.replace(ptr(1));
            }
        });
        send("[seers-fix] Ready"); break;
    }

    installed = true;
}
setInterval(install, 1000);
install();
