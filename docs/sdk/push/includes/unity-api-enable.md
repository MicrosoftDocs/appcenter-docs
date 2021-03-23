---
author: lucen-ms
ms.author: kegr
ms.topic: include
ms.date: 12/02/2019
---

## Enable or disable App Center Push at runtime

You can enable and disable App Center Push at runtime. If you disable it, the SDK stops updating the Google registration identifier used to push, but the existing one will continue working. Disabling App Center Push in the SDK WON'T stop your application from receiving push notifications.

```csharp
Push.SetEnabledAsync(false);
```

To enable App Center Push again, use the same API but pass `true` as a parameter.

```csharp
Push.SetEnabledAsync(true);
```

The state is persisted in the device's storage across application launches.

[!INCLUDE [unity see async](../../includes/unity-see-async.md)]

## Check if App Center Push is enabled

You can also check if App Center Push is enabled or not.

```csharp
bool isEnabled = await Push.IsEnabledAsync();
```

[!INCLUDE [unity see async](../../includes/unity-see-async.md)]
