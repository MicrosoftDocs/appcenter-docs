---
title: Other API
description: Other API in the Mobile Center SDK for Android
keywords: sdk
author: troublemakerben
ms.author: bereimol
ms.date: 04/17/2017
ms.topic: article
ms.assetid: d13dd720-93b3-4658-b579-230c8821e292
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Other API

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)

## Adjust the log level

You can control the amount of log messages by Mobile Center that show up in LogCat. Use the `MobileCenter.setLogLevel()` API to enable additional logging while debugging. The log levels correspond to the ones defined in `android.util.Log`. By default, it is set it to `ASSERT` for non-debuggable applications and `WARN` for debuggable applications. You can set the log level at any time you want.

To have as many log messages as possible use `Log.Verbose`.

```java
MobileCenter.setLogLevel(Log.VERBOSE);
```

## Identify installations

The Mobile Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

```java
UUID installId = MobileCenter.getInstallId();
```

## Disable the all services at runtime

If you want to disable all Mobile Center services at once, use the `setEnabled()` API. When disabled, the SDK will not forward any information to Mobile Center.

```java
MobileCenter.setEnabled(false);
```

To enable enable all at once Mobile Center again, use the same API but pass `true` as a parameter.

```java
MobileCenter.setEnabled(true);
```
