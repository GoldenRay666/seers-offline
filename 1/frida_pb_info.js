// Hook player_basic_info_t::MergePartial to trace field reads
var mod = Process.enumerateModules().find(function(m) { return m.name === 'libgame_logic.so'; });

var sym = {};
mod.enumerateExports().forEach(function(s) {
  if (s.type === 'function') sym[s.name] = s.address;
});

// The key functions
var mp = sym['_ZN11ISeer20Comm19player_basic_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE'];

// Hook CodedInputStream methods to trace field reads
// ReadTag returns (field_number << 3) | wire_type
var readTag = mod.base.add(0); // We'll find it differently

// Instead: hook the MergePartial and use ReadTag tracing via CodedInputStream vtable
if (mp) {
  Interceptor.attach(mp, {
    onEnter: function(args) {
      this.msg = args[0];  // player_basic_info_t*
      this.input = args[1]; // CodedInputStream*
      console.log('[PB_Merge] player_basic_info_t msg=' + this.msg + ' input=' + this.input);
    },
    onLeave: function(ret) {
      console.log('[PB_Merge] player_basic_info_t DONE');
    }
  });
  console.log('Hooked player_basic_info_t::MergePartial');
}

// Also hook login_out MergePartial
var lo = sym['_ZN14ISeer20CSProto9login_out27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE'];
if (lo) {
  Interceptor.attach(lo, {
    onEnter: function(args) {
      console.log('[login_out::Merge] START');
    },
    onLeave: function(ret) {
      console.log('[login_out::Merge] DONE');
    }
  });
}

// Hook functional_switch_info_t MergePartial
var fs = sym['_ZN11ISeer20Comm24functional_switch_info_t27MergePartialFromCodedStreamEPN6google8protobuf2io16CodedInputStreamE'];
if (fs) {
  Interceptor.attach(fs, {
    onEnter: function(args) {
      console.log('[func_switch::Merge] START');
    },
    onLeave: function(ret) {
      console.log('[func_switch::Merge] DONE');
    }
  });
}

// CCLog
var cclog = Module.findExportByName('libgame_logic.so', '_ZN7cocos2d5CCLogEPKcz');
if (cclog) {
  Interceptor.attach(cclog, {
    onEnter: function(args) {
      var msg = args[0].readUtf8String();
      if (msg.length < 200) console.log('[CC] ' + msg);
    }
  });
}

// Crash
Process.setExceptionHandler(function(d) {
  console.log('[CRASH] type=' + d.type + ' addr=' + d.address + ' pc=' + d.context.pc);
  return false;
});

console.log('READY');
