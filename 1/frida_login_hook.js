var sym = {};
var mod = Process.enumerateModules().find(function(m) { return m.name === 'libgame_logic.so'; });
mod.enumerateExports().forEach(function(s) {
  if (s.type === 'function') sym[s.name] = s.address;
});

function h(name) {
  var addr = sym[name];
  if (!addr) { console.log('MISS: ' + name); return; }
  Interceptor.attach(addr, {
    onEnter: function(args) { console.log('> ' + name.substring(0, 80)); }
  });
}

// login_out
h('_ZN14ISeer20CSProto9login_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// check_session_out
h('_ZN14ISeer20CSProto21cli_check_session_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// lookup_random_nick_out
h('_ZN14ISeer20CSProto26cli_lookup_random_nick_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// player_enter_map_out
h('_ZN14ISeer20CSProto20player_enter_map_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// notify_gain_new_mon_out
h('_ZN14ISeer20CSProto23notify_gain_new_mon_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// player_basic_info_t
h('_ZN11ISeer20Comm19player_basic_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// functional_switch_info_t
h('_ZN11ISeer20Comm24functional_switch_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// select_main_mon_out
h('_ZN14ISeer20CSProto20select_main_mon_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// get_bag_mon_out
h('_ZN14ISeer20CSProto13get_bag_mon_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// get_item_out
h('_ZN14ISeer20CSProto17cli_get_item_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');
// get_pvp_data_out
h('_ZN14ISeer20CSProto14get_pvp_data_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE');

// CCLog
h('_ZN7cocos2d5CCLogEPKcz');

// Crash
Process.setExceptionHandler(function(d) {
  console.log('[CRASH] ' + d.type + ' at ' + d.address);
  return false;
});

console.log('READY');
