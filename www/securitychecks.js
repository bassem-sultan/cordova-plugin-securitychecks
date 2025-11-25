var exec = require('cordova/exec');
var PLUGIN_NAME = 'SecurityChecks';
exports.echo = function (message, success, error) {
  exec(success, error, PLUGIN_NAME, 'echo', [String(message || '')]);
};
exports.isDebuggable = function (success, error) {
  exec(success, error, PLUGIN_NAME, 'isDebuggable', []);
};
exports.isEmulator = function (success, error) {
  exec(success, error, PLUGIN_NAME, 'isEmulator', []);
};
exports.isSimulator = function (success, error) {
  exec(success, error, PLUGIN_NAME, 'isSimulator', []);
};
