// Hook the handler function to find crash point after login_out parsing
var mod = Process.enumerateModules().find(function(m) { return m.name === 'libgame_logic.so'; });
var base = mod.base;

// handleMsgLoginIn @ 0x62fd5c (from IDA whitebox)
var handler = base.add(0x62fd5c);

// Scan the handler for all BL/BLX calls to trace execution
// The handler is at 0x62fd5c - 0x6309d8 (3196 bytes)
// Key addresses within the handler:
// 0x62fd86: BLX __dynamic_cast    (line 23)
// 0x62fd9c: BL player_basic_info_t copy ctor (line 33)
// 0x62fdb0: BL functional_switch_info_t copy ctor (line 42)
// 0x62fdc0: BLX strcpy            (line 49)
// 0x006303b2: UserData::addObtainedMonster
// 0x0063059a: UserData::setServerTime
// 0x006305a0: UserData::setServerTime

Interceptor.attach(handler, {
  onEnter: function(args) {
    console.log('[HANDLER] handleMsgLoginIn ENTER');
    this.handlerThis = args[0];
  },
  onLeave: function(ret) {
    console.log('[HANDLER] handleMsgLoginIn LEAVE - OK');
  }
});

// Hook key internal functions called by handler
// strcpy
var strcpy = Module.findExportByName('libc.so', 'strcpy');
if (strcpy) {
  Interceptor.attach(strcpy, {
    onEnter: function(args) {
      var dest = args[0], src = args[1];
      // Only log if called from handler
      var retAddr = this.returnAddress;
      if (retAddr >= handler && retAddr <= handler.add(0x1000)) {
        console.log('[HANDLER] strcpy dest=' + dest + ' src="' + src.readUtf8String(20) + '"');
      }
    }
  });
}

// Hook __dynamic_cast (used to validate message type)
var dync = Module.findExportByName('libgnustl_shared.so', '__dynamic_cast');
if (!dync) dync = Module.findExportByName('libc++_shared.so', '__dynamic_cast');
if (!dync) {
  // Try to find it by another name
  mod.enumerateExports().forEach(function(s) {
    if (s.name.indexOf('dynamic_cast') !== -1 && s.name.indexOf('ISeer20CSProto') === -1) {
      console.log('dynamic_cast: ' + s.name + ' @ ' + s.address);
    }
  });
}

// Hook CCLog
var cclog = Module.findExportByName('libgame_logic.so', '_ZN7cocos2d5CCLogEPKcz');
if (cclog) {
  Interceptor.attach(cclog, {
    onEnter: function(args) {
      console.log('[CC] ' + args[0].readUtf8String().substring(0, 200));
    }
  });
}

// Crash catcher
Process.setExceptionHandler(function(d) {
  var pc = d.context.pc;
  var offset = pc.sub(base);
  console.log('[CRASH] type=' + d.type + ' pc=0x' + offset.toString(16) + ' addr=' + d.address);
  // Check if crash is in handler range
  if (pc >= handler && pc <= handler.add(0x1000)) {
    console.log('[CRASH] *** IN HANDLER *** offset=0x' + pc.sub(handler).toString(16));
  }
  return false;
});

console.log('READY — handler hooked');
