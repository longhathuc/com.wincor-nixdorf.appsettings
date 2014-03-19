

cordova.define("com.wincor-nixdorf.appsettings.Appsettings", function(require, exports, module) {
var exec    = require('cordova/exec'),
        utils   = require('cordova/utils'),
        cordova = require('cordova');
               
               
var appsettings = {
    getAppSettings:function() {
        if (device.available)
            return exec(null, null, "AppSettings", "getAppSettings",{});
        return 1;
    },
    setAppSettings:function(){
        exec(null,null, "AppSettings","setAppSettings",{});
    },
}
               

module.exports = appsettings;
});