You can enable and disable Mobile Center Push at runtime. If you disable it, the SDK will stop updating the WNS registration identifier that is used to push notifications, but the existing one will continue to work. In other words, disabling the Mobile Center Push in the SDK will **NOT** stop your application from receiving push notifications.

```csharp
Push.SetEnabledAsync(false);
```
To enable Mobile Center Push again, use the same API but pass `true` as a parameter.

```csharp
Push.SetEnabledAsync(true);
```

Further API calls are immediately consistent with the state change even if you don't wait for the operation to finish persisting the state change on disk (and you should not wait in U.I. thread to avoid slowing down your application).

You can also check if Mobile Center Push is enabled or not:

```csharp
bool isEnabled = await Push.IsEnabledAsync();
```