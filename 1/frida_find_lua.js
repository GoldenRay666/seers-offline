// Find Lua engine and execute function
'use strict';
const mod = Process.findModuleByName("libgame_logic.so");

send('=== luaL / lua_ / luaCall / executeString ===');
for (const exp of mod.enumerateExports()) {
    const nm = exp.name;
    if ((nm.includes('luaL_') || nm.includes('lua_pcall') || nm.includes('lua_call') ||
         nm.includes('executeString') || nm.includes('dostring') ||
         nm.includes('lua_State') || nm.includes('CCLuaEngine')) && nm.length < 100) {
        send(`  ${nm}`);
    }
}
send('[***] Done');
