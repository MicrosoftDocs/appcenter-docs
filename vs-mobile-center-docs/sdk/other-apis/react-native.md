---
title: Other React Native APIs
description: Other APIs in the Mobile Center SDK for React Native
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 08/02/2017
ms.topic: article
ms.assetid: 70204319-64ef-4d13-bd8d-a48ab9ab5833
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# Other React Native APIs

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)


## Adjust the log level

You can control the amount of log messages that show up from Mobile Center. Log messages show in the console on iOS and LogCat on Android. Use the `setLogLevel` API to enable additional logging while debugging. By default, it is set to `LogLevelAssert` for the iOS App Store environment / Android release builds and `LogLevelWarning` otherwise.

To have as many log messages as possible, use `LogLevelVerbose`.

```javascript
import MobileCenter from 'mobile-center';

await MobileCenter.setLogLevel(MobileCenter.LogLevelVerbose);
```

> [!NOTE]
> The JavaScript `setLogLevel` API can't increase logging for app startup code, before JavaScript is loaded.
>
> If you wish to increase logging for app startup, use the native Mobile Center setLogLevel APIs.
>
> In iOS, call `[MSMobileCenter setLogLevel: MSLogLevelVerbose];` before any call to `[RNMobileCenter register];` (or `RNAnalytics` or `RNCrashes` or `RNPush`) in **AppDelegate.m**. You have to add `@import MobileCenter;` if missing in that file.
>
> In Android, call `MobileCenter.setLogLevel(android.util.Log.VERBOSE);` before `SoLoader.init` in `onCreate` callback in **MainApplication.java**.

## Identify installations

The Mobile Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed or the user manually deletes all app data on Android. The following API is useful for debugging purposes.

```javascript
import MobileCenter from 'mobile-center';

const installId = await MobileCenter.getInstallId();   // Returned as a string
```

## Disable all services at runtime

If you want to disable all Mobile Center services at once, use the `setEnabled()` API. When disabled, the SDK will not forward any information to Mobile Center.

```javascript
import MobileCenter from 'mobile-center';

await MobileCenter.setEnabled(false);
```

To enable all services at once again, use the same API but pass `true` as a parameter.

```javascript
await MobileCenter.setEnabled(true);
```

## Check if Mobile Center is enabled

You can also check if Mobile Center is enabled or not.

```javascript
const enabled = await MobileCenter.isEnabled();
```

## Use custom properties

Mobile Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. For instance, you can use custom properties to segment your users, and then send push notifications to a specific [audience](~/push/audiences.md).

You can set custom properties by calling the `setCustomProperties()` API. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following Javascript types: `string`, `number`, `boolean` and `Date`. 

```javascript
import MobileCenter, {CustomProperties} from 'mobile-center';

const properties = new CustomProperties();
properties.set("color", "blue").set("score", 10);
MobileCenter.setCustomProperties(properties);
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `clear()` API. This will only remove the value of the property for a device. It will not remove the property name from Mobile Center portal.

```javascript
import MobileCenter, {CustomProperties} from 'mobile-center';

const properties = new CustomProperties();
properties.clear("score");
MobileCenter.setCustomProperties(properties);
```
