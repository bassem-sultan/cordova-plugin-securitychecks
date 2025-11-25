package com.app.securitychecks;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
public class SecurityChecks extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        switch (action) {
            case "echo":
                String msg = args.optString(0, "");
                callbackContext.success(msg);
                return true;
            case "isDebuggable":
                callbackContext.success(boolToJSON(isAppDebuggable()));
                return true;
            case "isEmulator":
                callbackContext.success(boolToJSON(isRunningOnEmulator()));
                return true;
            case "isSimulator":
                callbackContext.success(boolToJSON(false));
                return true;
            default:
                return false;
        }
    }
    private boolean isAppDebuggable() {
        try {
            ApplicationInfo info = cordova.getActivity().getApplicationInfo();
            return (info.flags & ApplicationInfo.FLAG_DEBUGGABLE) != 0;
        } catch (Throwable t) {
            return false;
        }
    }
    private boolean isRunningOnEmulator() {
        String fingerprint = Build.FINGERPRINT;
        String model = Build.MODEL;
        String product = Build.PRODUCT;
        String manufacturer = Build.MANUFACTURER;
        return (fingerprint != null && (fingerprint.contains("generic") || fingerprint.contains("ranchu")))
                || (model != null && (model.contains("Emulator") || model.contains("Android SDK built for x86")))
                || (product != null && (product.contains("sdk") || product.contains("emulator") || product.contains("vbox")))
                || (manufacturer != null && manufacturer.contains("Genymotion"));
    }
    private String boolToJSON(boolean value) {
        JSONObject obj = new JSONObject();
        try { obj.put("value", value); } catch (JSONException e) {}
        return obj.toString();
    }
}
