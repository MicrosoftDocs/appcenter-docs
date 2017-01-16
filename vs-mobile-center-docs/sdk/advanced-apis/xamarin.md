# Xamarin Advanced APIs

* **Debugging**: You can control the amount of log messages that show up from the SDK. Use the API below to enable additional logging while debugging. By default, it is set it to `ASSERT` for non-debuggable applications and `WARN` for debuggable applications.

```csharp
        MobileCenter.LogLevel = LogLevel.Verbose;
```

* **Get Install Identifier**: The Mobile Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

```csharp
        System.Guid installId = MobileCenter.InstallId;
```

* **Enable/Disable Mobile Center SDK:** If you want the Mobile Center SDK to be disabled completely, use the `Enabled` property. When disabled, the SDK will not forward any information to MobileCenter.

```csharp
        MobileCenter.Enabled = false;
```
