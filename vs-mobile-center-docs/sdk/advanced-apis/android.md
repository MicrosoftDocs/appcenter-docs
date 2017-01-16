# Android Advanced APIs


* **Debugging**: You can control the amount of log messages that show up from the Mobile Center SDK in LogCat. Use the `MobileCenter.setLogLevel()` API to enable additional logging while debugging. The log levels correspond to the ones defined in `android.util.Log`. By default, it is set it to `ASSERT` for non-debuggable applications and `WARN` for debuggable applications.

        MobileCenter.setLogLevel(Log.VERBOSE);

* **Get Install Identifier**: The Mobile Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

        UUID installId = MobileCenter.getInstallId();

* **Enable/Disable Mobile Center SDK:** If you want the Mobile Center SDK to be disabled completely, use the `setEnabled()` API. When disabled, the SDK will not forward any information to MobileCenter.

        MobileCenter.setEnabled(false);
