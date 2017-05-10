You can enable and disable Mobile Center Push at runtime.

If you disable it, the SDK will stop updating the WNS registration identifier that is used to push notifications, but the existing one will continue  to work.

In other words, disabling the Mobile Center Push in the SDK will **NOT** stop your application from receiving push notifications.

```csharp
Push.Enabled = false;
```
To enable Mobile Center Push again, use the same API but pass `true` as a parameter.

```csharp
Push.Enabled = true;
```

You can also check if Mobile Center Push is enabled or not:

```csharp
bool isEnabled = Push.Enabled;
```