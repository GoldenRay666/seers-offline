// Probe cli_get_item_out merge to find field mapping
'use strict';
const mod=Process.findModuleByName("libgame_logic.so");
for(const e of mod.enumerateExports()){
 if(e.name.includes("cli_get_item_out")&&e.name.includes("MergePartial")){
  Interceptor.attach(e.address,{
   onEnter(a){this.m=a[0]},
   onLeave(r){
    const m=this.m;let v=[];
    for(let o=0;o<64;o+=4)v.push(m.add(o).readU32());
    send("[GETITEM-MSG] "+v.join(","));
   }
  });
 }
}
send("[PROBE] ready - mine then open backpack");
