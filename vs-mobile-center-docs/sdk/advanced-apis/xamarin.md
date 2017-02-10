---
title: Xamarin Advanced APIs
description: Advanced APIs in the Xamarin Mobile Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 64f8592a-73e0-4f08-9c29-4de82e2d1131
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin
---

# Xamarin Advanced APIs

> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)
- [Xamarin](xamarin.md)
- [React Native](react-native.md)

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
