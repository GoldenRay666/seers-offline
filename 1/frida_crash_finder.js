var mod = Process.enumerateModules().find(function(m) { return m.name === 'libgame_logic.so'; });
var base = mod.base;
console.log('base: ' + base);

// handleMsgLoginIn @ 0x62fd5c
var handlerAddr = base.add(0x62fd5c);

Interceptor.attach(handlerAddr, {
  onEnter: function(args) {
    console.log('[HANDLER] handleMsgLoginIn ENTER');
    // Log stack trace of where we are
    console.log(Thread.backtrace(this.context, Backtracer.ACCURATE)
      .map(DebugSymbol.fromAddress).join('\n'));
  },
  onLeave: function(ret) {
    console.log('[HANDLER] handleMsgLoginIn LEAVE');
  }
});
console.log('handler hooked @ ' + handlerAddr);

// Catch ALL exceptions
Process.setExceptionHandler(function(d) {
  var pc = d.context.pc;
  var offset = pc.sub(base);
  console.log('[CRASH] type=' + d.type);
  console.log('[CRASH] pc=0x' + offset.toString(16));

  // Check if in handler range (0x62fd5c - 0x6309d8)
  if (offset >= 0x62fd5c && offset <= 0x6309d8) {
    var handlerOff = offset - 0x62fd5c;
    console.log('[CRASH] IN HANDLER at +0x' + handlerOff.toString(16));
  }

  // Print nearby symbols
  console.log('[CRASH] symbol: ' + DebugSymbol.fromAddress(pc));
  return false;
});

console.log('READY');
