// Hook login flow using real mangled symbol names
var mod = Process.enumerateModules().find(function(m) { return m.name === 'libgame_logic.so'; });

// Build name-to-address map for MergePartial functions
var mp = {};
mod.enumerateExports().forEach(function(s) {
  if (s.type === 'function' && s.name.indexOf('MergePartialFromCodedStream') !== -1) {
    // Extract short name from mangled: _ZN14ISeer20CSProto9login_out27...
    var match = s.name.match(/_ZN\d+(ISeer20\w+)Proto(\d+)(\w+)27/);
    if (match) {
      var short = match[1] + 'Proto::' + match[3];
      mp[short] = s.address;
    }
    // Also match ISeer20Comm
    match = s.name.match(/_ZN\d+(ISeer20Comm)(\d+)(\w+)27/);
    if (match) {
      var short = match[1] + '::' + match[3];
      mp[short] = s.address;
    }
  }
});

// Hook targets
var targets = [
  'ISeer20CSProto::login_out',
  'ISeer20CSProto::cli_check_session_out',
  'ISeer20CSProto::cli_lookup_random_nick_out',
  'ISeer20CSProto::player_enter_map_out',
  'ISeer20CSProto::notify_gain_new_mon_out',
  'ISeer20Comm::player_basic_info_t',
  'ISeer20Comm::functional_switch_info_t',
  'ISeer20CSProto::select_main_mon_out',
];

var hooked = 0;
targets.forEach(function(name) {
  var addr = mp[name];
  if (addr) {
    try {
      Interceptor.attach(addr, {
        onEnter: function(args) {
          console.log('[PARSE] ' + name);
        }
      });
      hooked++;
    } catch(e) {
      console.log('ERR: ' + name + ': ' + e.message);
    }
  } else {
    console.log('MISS: ' + name);
  }
});

// Hook handlers by finding register_log patterns
var handlers = [
  { name: 'handleMsgLoginIn', offset: 0x62fd5c },
  { name: 'handleAckMsgCheckSession', offset: null },  // need to find
  { name: 'handleAckMsgSelectMainMon', offset: null },
];

// Hook CCLog
var cclog = Module.findExportByName('libgame_logic.so', '_ZN7cocos2d5CCLogEPKcz');
if (cclog) {
  Interceptor.attach(cclog, {
    onEnter: function(args) { console.log('[CCLog] ' + args[0].readUtf8String()); }
  });
}

// Crash handler
Process.setExceptionHandler(function(d) {
  console.log('[CRASH] type=' + d.type + ' addr=' + d.address);
  return false;
});

console.log('Hooked ' + hooked + ' MergePartials. Test login now.');
