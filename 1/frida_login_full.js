// Hook 登录全链路：check_session → create_role → login_out → select_main_mon
var mod = Process.enumerateModules().find(function(m) { return m.name === 'libgame_logic.so'; });
var base = mod.base;
console.log('libgame_logic.so base: ' + base);

// 用符号名找所有 MergePartial
var mergePartials = {};
mod.enumerateExports().forEach(function(s) {
  if (s.type === 'function' && s.name.indexOf('MergePartialFromCodedStream') !== -1) {
    var parts = s.name.split('::');
    var msgName = parts.slice(0, parts.length - 1).join('::');
    mergePartials[msgName] = s.address;
  }
});

// Hook 关键的 MergePartial
var targets = [
  'ISeer20CSProto::login_out',
  'ISeer20CSProto::check_session_out',
  'ISeer20CSProto::cli_lookup_random_nick_out',
  'ISeer20CSProto::player_enter_map_out',
  'ISeer20CSProto::notify_gain_new_mon_out',
  'ISeer20Comm::player_basic_info_t',
  'ISeer20Comm::functional_switch_info_t'
];

targets.forEach(function(name) {
  var addr = mergePartials[name];
  if (addr) {
    try {
      Interceptor.attach(addr, {
        onEnter: function(args) {
          console.log('[MERGE START] ' + name);
        },
        onLeave: function(ret) {
          console.log('[MERGE DONE]  ' + name);
        }
      });
      console.log('Hooked: ' + name);
    } catch(e) {
      console.log('FAILED: ' + name + ' - ' + e.message);
    }
  } else {
    console.log('NOT FOUND: ' + name);
  }
});

// Hook CCLog
var cclog = Module.findExportByName('libgame_logic.so', '_ZN7cocos2d5CCLogEPKcz');
if (cclog) {
  Interceptor.attach(cclog, {
    onEnter: function(args) { console.log('[C++] ' + args[0].readUtf8String()); }
  });
}

// Catch crash
Process.setExceptionHandler(function(d) {
  console.log('[CRASH] type=' + d.type + ' addr=' + d.address + ' pc=' + d.context.pc);
  return false;
});

console.log('READY — go test login now');
