---
title: Other Android APIs
description: Other APIs in the Mobile Center SDK for Android
keywords: sdk
author: troublemakerben
ms.author: bereimol
ms.date: 06/21/2017
ms.topic: article
ms.assetid: d13dd720-93b3-4658-b579-230c8821e292
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Other Android APIs

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

## Adjust the log level

You can control the amount of log messages by Mobile Center that show up in LogCat. Use the `MobileCenter.setLogLevel()` API to enable additional logging while debugging. The log levels correspond to the ones defined in `android.util.Log`. By default, it is set it to `ASSERT` for non-debuggable applications and `WARN` for debuggable applications. You can set the log level at any time you want.

To have as many log messages as possible, use `Log.Verbose`.

```java
MobileCenter.setLogLevel(Log.VERBOSE);
```

## Identify installations

The Mobile Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed or the user manually deletes all app data. The following API is useful for debugging purposes.

```java
MobileCenter.getInstallId();
```

[!include[](../android-see-async.md)]

## Enable or disable all services at runtime

If you want to disable all Mobile Center services at once, use the `setEnabled()` API. When disabled, the SDK will not forward any information to Mobile Center.

```java
MobileCenter.setEnabled(false);
```

To enable all services at once again, use the same API but pass `true` as a parameter.

```java
MobileCenter.setEnabled(true);
```

[!include[](../android-see-async.md)]

## Check if Mobile Center is enabled

You can also check if Mobile Center is enabled or not:

```java
MobileCenter.isEnabled();
```

[!include[](../android-see-async.md)]

## Use custom properties

Mobile Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. For instance, you can use custom properties to segment your users, and then send push notifications to a specific [audience](~/push/audiences.md).

You can set custom properties by calling the `setCustomProperties()` API. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following Java datatypes: `String`, `Number`, `boolean` and `Date`. 

```java
CustomProperties properties = new CustomProperties();
properties.set("color", "blue").set("score", 10);
MobileCenter.setCustomProperties(properties);
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `clear()` API.

```java
CustomProperties properties = new CustomProperties();
properties.set("color", "blue").set("score", 10).clear("score");
MobileCenter.setCustomProperties(properties);
```