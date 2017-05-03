---
title: Other iOS APIs
description: Other APIs in the Mobile Center SDK for iOS
keywords: sdk
author: troublemakerben
ms.author: bereimol
ms.date: 04/14/2017
ms.topic: article
ms.assetid: f79abed4-6e50-4d1c-aa1e-0b78b764908d
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
---

# Other iOS APIs

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

## Adjust the log level

You can control the amount of log messages that show up from Mobile Center in the console. Use the `setLogLevel:`-API to enable additional logging while debugging. By default, it is set to `MSLogLevelAssert` for the App Store environment and `MSLogLevelWarning` otherwise.

To have as many log messages as possible, use `MSLogLevelVerbose`/`MSLogLevel.Verbose`.

**Objective-C**

```obj-c
[MSMobileCenter setLogLevel:MSLogLevelVerbose];
```

**Swift**

```swift
MSMobileCenter.setLogLevel(MSLogLevel.Verbose)
```

## Identify installations

The Mobile Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

**Objective-C**

```obj-c
NSUUID *installId = [MSMobileCenter  installId];
```

**Swift**

```swift
var installId = MSMobileCenter.installId()
```

## Disable all services at runtime

If you want to disable all Mobile Center services at once, use the `setEnabled`-API. When disabled, the SDK will not forward any information to Mobile Center.

**Objective-C**

```obj-c
[MSMobileCenter setEnabled:NO];
```

**Swift**

```swift
MSMobileCenter.setEnabled(false)
```

To enable all services at once again, use the same API but pass `YES`/`true` as a parameter.

**Objective-C**

```obj-c
[MSMobileCenter setEnabled:YES];
```

**Swift**

```swift
MSMobileCenter.setEnabled(true)
```
