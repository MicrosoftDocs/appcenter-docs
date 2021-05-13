---
title: Other React Native APIs
description: Other APIs in the App Center SDK for React Native
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 05/13/2021
ms.topic: article
ms.assetid: 70204319-64ef-4d13-bd8d-a48ab9ab5833
ms.tgt_pltfrm: react-native
---

# Other React Native APIs

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

## Adjust the log level

You can control the amount of log messages that show up from App Center. Log messages show in the console on iOS and LogCat on Android. Use the `setLogLevel` API to enable additional logging while debugging. The default level is `LogLevel.ASSERT` for the iOS App Store environment and Android release builds. Otherwise, it's set to `LogLevel.WARNING`.

To output all log messages, use `LogLevel.VERBOSE`.

```javascript
import AppCenter from 'appcenter';

await AppCenter.setLogLevel(AppCenter.LogLevel.VERBOSE);
```

> [!NOTE]
> The JavaScript `setLogLevel` API can't increase logging for app startup code, before JavaScript is loaded.
> 
> If you wish to increase logging for app startup, use the native App Center setLogLevel APIs.
> 
> In iOS, call `[MSACAppCenter setLogLevel: MSACLogLevelVerbose];` before any call to `[AppCenterReactNative register];` (or `AppCenterReactNativeAnalytics` or `AppCenterReactNativeCrashes` or `AppCenterReactNativePush`) in the project's **AppDelegate.m**. You must add `@import AppCenter;` if missing in that file.
> 
> In Android, call `AppCenter.setLogLevel(android.util.Log.VERBOSE);` before `SoLoader.init` in `onCreate` callback in `MainApplication.java`.

## Identify installations

The App Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed or the user manually deletes all app data on Android. The following API is useful for debugging purposes.

```javascript
import AppCenter from 'appcenter';

const installId = await AppCenter.getInstallId();   // Returned as a string
```

## Identify users

The App Center SDK supports setting a **user ID** that's used to augment crash reports. To use this capability:

1. Configure the App Center SDK as described in the [App Center SDK Getting started guide](~/sdk/getting-started/react-native.md).
2. Set a `userID` in the SDK using the following code:

```javascript
AppCenter.setUserId("your-user-id");
```

[!INCLUDE [user id](includes/user-id.md)]

## Disable all services at runtime

If you want to disable all App Center services at once, use the `setEnabled()` API. When disabled, the SDK won't forward any information to App Center.

```javascript
import AppCenter from 'appcenter';

await AppCenter.setEnabled(false);
```

To enable all services at once again, use the same API but pass `true` as a parameter.

```javascript
await AppCenter.setEnabled(true);
```

The state is persisted in the device's storage across application launches.

## Disallow network requests

In the App Center SDK, network requests are allowed by default. If you want to send data that the App Center SDK collects by the user concern you can disallow automatic sending data.

```javascript
await AppCenter.setNetworkRequestsAllowed(false);
```

In this case, the App Center SDK continues to collect data but it will be sent only when the network requests will be allowed.

```javascript
await AppCenter.setNetworkRequestsAllowed(true);
```

>[!NOTE]
> This value is retained between starts.

At any time, you can check whether sending data in the App Center SDK is allowed or not.

```javascript
await AppCenter.isNetworkRequestsAllowed();
```

>[!NOTE]
> The value saved in SharedPreferences is ignored until `AppCenter` is started on Android platform.
> It will return the last value set using `setNetworkRequestsAllowed` or `true` if the value wasn't changed before AppCenter start.

## Change state of service in runtime

You can enable or disable the service at the runtime with following code:

```javascript
await AppCenter.Analytics.setEnabled(false);
```

## Check if App Center is enabled

You can also check if App Center is enabled or not.

```javascript
const enabled = await AppCenter.isEnabled();
```

## Check App Center SDK version at runtime
 
You can get the version of App Center SDK that you're currently using.
 
```javascript
AppCenter.getSdkVersion();
```

## Use custom properties

App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. For instance, you can use custom properties to segment your users, and then send push notifications to a specific [audience](~/push/send-notification.md#audiences).

> [!NOTE]
> Only devices that have [Push](../push/react-native-ios.md) successfully registered are matched in audiences.
> As a consequence, the iOS simulator can't be used to test audience matching.

You can set custom properties by calling the `setCustomProperties()` API. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following Javascript types: `string`, `number`, `boolean` and `Date`. 

```javascript
import AppCenter, {CustomProperties} from 'appcenter';

const properties = new CustomProperties();
properties.set('color', 'blue').set('score', 10);
AppCenter.setCustomProperties(properties);
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `clear()` API. This only removes the value of the property for a device. It won't remove the property name from App Center portal.

```javascript
import AppCenter, {CustomProperties} from 'appcenter';

const properties = new CustomProperties();
properties.clear('score');
AppCenter.setCustomProperties(properties);
```
