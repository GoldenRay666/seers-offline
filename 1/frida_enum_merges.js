var mod = Process.enumerateModules().find(function(m) { return m.name === 'libgame_logic.so'; });
// Find ALL MergePartial symbols
var found = [];
mod.enumerateExports().forEach(function(s) {
  if (s.type === 'function' && s.name.indexOf('MergePartialFromCodedStream') !== -1) {
    found.push(s.name);
  }
});
console.log('Total MergePartial: ' + found.length);
// Show login-related ones
found.forEach(function(name) {
  if (name.indexOf('login') !== -1 || name.indexOf('check_session') !== -1 ||
      name.indexOf('enter_map') !== -1 || name.indexOf('gain_new_mon') !== -1 ||
      name.indexOf('player_basic') !== -1 || name.indexOf('functional_switch') !== -1 ||
      name.indexOf('lookup') !== -1) {
    console.log(name);
  }
});
// Show first 10 to see naming pattern
console.log('=== Sample names ===');
found.slice(0, 10).forEach(function(n) { console.log(n); });
