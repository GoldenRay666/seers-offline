// Find login_out functions by symbol name
var mod = Process.enumerateModules().find(function(m) { return m.name === 'libgame_logic.so'; });
if (!mod) { console.log('module not loaded'); }

// Find all login_out related functions
console.log('=== login_out symbols ===');
mod.enumerateExports().forEach(function(s) {
  if (s.name.indexOf('login_out') !== -1 && s.type === 'function') {
    console.log(s.name + ' @ ' + s.address);
  }
});

// Find all handleMsgLoginIn
console.log('=== handleMsgLoginIn ===');
mod.enumerateExports().forEach(function(s) {
  if (s.name.indexOf('handleMsgLoginIn') !== -1) {
    console.log(s.name + ' @ ' + s.address);
  }
});

// Find MergePartial for login_out
console.log('=== login_out MergePartial ===');
mod.enumerateExports().forEach(function(s) {
  if (s.name.indexOf('login_out') !== -1 && s.name.indexOf('MergePartial') !== -1) {
    console.log(s.name + ' @ ' + s.address);
  }
});
