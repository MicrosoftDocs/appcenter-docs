You can enable and disable App Center Push at runtime. If you disable it, the SDK will stop updating the registration identifier that is used to push notifications, but the existing one will continue to work. In other words, disabling the App Center Push in the SDK will **NOT** stop your application from receiving push notifications.

```csharp
Push.SetEnabledAsync(false);
```
To enable App Center Push again, use the same API but pass `true` as a parameter.

```csharp
Push.SetEnabledAsync(true);
```

You don't need to await this call to make other API calls (such as `IsEnabledAsync`) consistent.

The state is persisted in the device's storage across application launches.

> [!NOTE]
> This method must only be used after `Push` has been started.

## Check if App Center Push is enabled

You can also check if App Center Push is enabled or not:

```csharp
bool isEnabled = await Push.IsEnabledAsync();
```

> [!NOTE]
> This method must only be used after `Push` has been started, it will always return `false` before start.
