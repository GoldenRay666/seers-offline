// Systematic test: vary ONLY scroll layout, keep NULL fix + × button
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");
let lastId=0,lastCnt=0,injected=false;

// CONFIG: test case — change this number only!
const TEST = 'C'; // A=correct, B=correct+extra, C=old(garbage), D=1item+correct

// SYNTH
let m_getItemInfo=null;
for(const exp of mod.enumerateExports())if(exp.name==="_ZN19GameItemDataManager19getItemInfoByItemIDEj")m_getItemInfo=exp.address;
const syn={};
for(const[id,name]of[[20081,'黄铁矿'],[20082,'赤晶矿']]){
    const buf=Memory.alloc(256);for(let i=0;i<256;i+=4)buf.add(i).writeU32(0);buf.add(0).writeU32(0xFFFFFFFF);const np=Memory.allocUtf8String(name);buf.add(4).writePointer(np);buf.add(8).writeU32(np.readUtf8String().length);buf.add(12).writeU32(np.readUtf8String().length);buf.add(16).writeU32(id);buf.add(20).writeU32(1);buf.add(24).writeU32(2);buf.add(28).writeU32(1);syn[id]=buf;
}
if(m_getItemInfo)Interceptor.attach(m_getItemInfo,{onEnter(a){this.id=a[1].toInt32()},onLeave(r){if(r.isNull()&&syn[this.id])r.replace(syn[this.id]);}});

// NULL FIX
for(const exp of mod.enumerateExports()){
    if(exp.name.includes("notify_item_bag_updates_out_one_t")&&exp.name.includes("MergePartial"))Interceptor.attach(exp.address,{onEnter(a){this.m=a[0]},onLeave(r){const id=this.m.add(8).readU32();const cnt=this.m.add(12).readU32();if(id>0){lastId=id;lastCnt=cnt;}}});
    if(exp.name==="_ZN8UserData15updateItemInBagERK8SaveItemPKc")Interceptor.attach(exp.address,{onEnter(a){if(a[1].isNull()&&lastId>0){const si=Memory.alloc(32);for(let i=0;i<32;i+=4)si.add(i).writeU32(0);si.add(0).writeU32(1);si.add(4).writeU32(1);si.add(8).writeU32(lastId);si.add(12).writeU32(lastCnt||1);a[1]=si;send(`[FIX]${lastId}x${lastCnt}`);}}});
}

// SCROLL INJECTION — varies by TEST
for(const exp of mod.enumerateExports()){
    if(exp.name==="_ZN12ItemBagLayer20createItemScrollPageERKSt6vectorI8SaveItemSaIS1_EEbb"){
        Interceptor.attach(exp.address,{onEnter(a){
            const v=a[1];if(v.isNull())return;const sz=v.add(4).readPointer().sub(v.readPointer()).toInt32();
            if(sz===0&&!injected){
                let buf,size;
                if(TEST==='A'){// correct layout, 2 items
                    buf=Memory.alloc(40);size=40;
                    for(let i=0;i<size;i+=4)buf.add(i).writeU32(0);
                    buf.add(0).writeU32(20081);buf.add(4).writeU32(10);
                    buf.add(20).writeU32(20082);buf.add(24).writeU32(5);
                }else if(TEST==='B'){// correct + extra fields, 2 items
                    buf=Memory.alloc(40);size=40;
                    for(let i=0;i<size;i+=4)buf.add(i).writeU32(0);
                    buf.add(0).writeU32(20081);buf.add(4).writeU32(10);buf.add(8).writeU32(1);buf.add(12).writeU32(10);
                    buf.add(20).writeU32(20082);buf.add(24).writeU32(5);buf.add(28).writeU32(2);buf.add(32).writeU32(5);
                }else if(TEST==='C'){// OLD layout (id@+8,cnt@+12,g@+0), 2 items
                    buf=Memory.alloc(40);size=40;
                    for(let i=0;i<size;i+=4)buf.add(i).writeU32(0);
                    buf.add(0).writeU32(1);buf.add(8).writeU32(20081);buf.add(12).writeU32(10);
                    buf.add(20).writeU32(2);buf.add(28).writeU32(20082);buf.add(32).writeU32(5);
                }else{// D: correct, 1 item
                    buf=Memory.alloc(20);size=20;
                    for(let i=0;i<size;i+=4)buf.add(i).writeU32(0);
                    buf.add(0).writeU32(20081);buf.add(4).writeU32(10);
                }
                v.writePointer(buf);v.add(4).writePointer(buf.add(size));v.add(8).writePointer(buf.add(size));
                injected=true;
                // Read back
                const b2=v.readPointer();const sz2=v.add(4).readPointer().sub(b2).toInt32();
                const raw=b2.readByteArray(Math.min(sz2,100));const arr=new Uint8Array(raw);
                send(`[SCROLL] TEST=${TEST} size=${sz2}`);
                for(let i=0;i<Math.min(sz2/20,3);i++){const o=i*20;send(`[SCROLL] [${i}] +0=${arr[o]|(arr[o+1]<<8)|(arr[o+2]<<16)|(arr[o+3]<<24)} +4=${arr[o+4]|(arr[o+5]<<8)|(arr[o+6]<<16)|(arr[o+7]<<24)} +8=${arr[o+8]|(arr[o+9]<<8)|(arr[o+10]<<16)|(arr[o+11]<<24)} +c=${arr[o+12]|(arr[o+13]<<8)|(arr[o+14]<<16)|(arr[o+15]<<24)}`);}
            }}
        });
    }
}

// × BUTTON
for(const exp of mod.enumerateExports()){if(exp.name==="_ZN12ItemBagLayer26addCloseButtonToGuideLayerEv"){let b=exp.address;for(const e2 of mod.enumerateExports()){if(e2.name==="_ZN12ItemBagLayer10initializeEv"){Interceptor.attach(e2.address,{onEnter(a){this.bag=a[0]},onLeave(r){if(b&&this.bag)try{new NativeFunction(b,'void',['pointer'])(this.bag);}catch(e){}}});}}break;}}

// MINING + IsInit
for(const exp of mod.enumerateExports()){if(exp.name.includes("submit_map_mine_info_out")&&exp.name.includes("MergePartial"))Interceptor.attach(exp.address,{onEnter(a){this.m=a[0]},onLeave(r){const oi=this.m.add(12).readU32();const id={1:20081,2:20082}[oi]||20081;this.m.add(8).writeU32(id);this.m.add(12).writeU32(1);r.replace(ptr(1));}});if(exp.name.includes("IsInitialized")&&(exp.name.includes("cli_get_item_out")||exp.name.includes("notify_item_bag_updates_out")))try{Interceptor.attach(exp.address,{onLeave(r){if(r.toInt32()===0)r.replace(ptr(1));}});}catch(e){}}

send(`[READY] TEST=${TEST}. Open bag.`);
