---
title: Shared docs for Apple SDK
description:  Shared docs for Apple SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 06/19/2020
ms.topic: include
ms.assetid: 032f5f12-1b77-4df4-9a06-da004e6ab0e8
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---

> [!div  class="op_single_selector"]
> * [Android](../android.md)
> * [iOS](../ios.md)
> * [Xamarin](../xamarin.md)
> * [UWP](../uwp.md)
> * [WPF/WinForms](../wpf-winforms.md)
> * [React Native](../react-native.md)
> * [macOS](../macos.md)
> * [tvOS](../tvos.md)
> * [Unity](../unity.md)
> * [Cordova](../cordova.md)

## Adjust the log level

You can control the amount of log messages that show up from App Center in the console. Use the `setLogLevel:`-API to enable additional logging while debugging. By default, it is set to `MSLogLevelAssert` for the App Store environment and `MSLogLevelWarning` otherwise.

To have as many log messages as possible, use `MSLogLevelVerbose`/`MSLogLevel.Verbose`.

```objc
[MSAppCenter setLogLevel:MSLogLevelVerbose];
```
```swift
MSAppCenter.setLogLevel(MSLogLevel.Verbose)
```

## Identify installations

The App Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

```objc
NSUUID *installId = [MSAppCenter  installId];
```
```swift
var installId = MSAppCenter.installId()
```

## Identify users

The App Center SDK supports setting a **user ID** that is used to augment crash reports. To use this capability:

1. Configure the App Center SDK by calling `:start:withServices:` as described in the [App Center SDK Getting started guide](~/sdk/getting-started/ios.md). 
2. Set a `userID` in the SDK using the following code:

```objc
[MSAppCenter setUserId:@"your-user-id"];
```
```swift
MSAppCenter.setUserId("your-user-id")
```
[!INCLUDE [user id](user-id.md)]

## Disable all services at runtime

If you want to disable all App Center services at once, use the `setEnabled` API. When disabled, the SDK will not forward any information to App Center.

```objc
[MSAppCenter setEnabled:NO];
```
```swift
MSAppCenter.setEnabled(false)
```

To enable all services at once again, use the same API but pass `YES`/`true` as a parameter.

```objc
[MSAppCenter setEnabled:YES];
```
```swift
MSAppCenter.setEnabled(true)
```

The state is persisted in the device's storage across application launches.

> [!NOTE]
> This method must only be used after `MSAppCenter` has been started.

## Change state of service in runtime

Enable or disable desired services at the runtime with following code:

```objc
[MSAnalytics setEnabled:NO];
```
```swift
MSAnalytics.setEnabled(false)
```

> [!NOTE]
> This method must only be used after `MSAnalytics` has been started.

## Check if App Center is enabled

You can also check if App Center is enabled or not.

```objc
[MSAppCenter isEnabled];
```
```swift
MSAppCenter.isEnabled()
```

> [!NOTE]
> This method must only be used after `MSAppCenter` has been started, it will always return `NO` or `false` before start.

## Check App Center SDK version at runtime

You can get the version of App Center SDK that you are currently using.

```objc
[MSAppCenter sdkVersion];
```
```swift
MSAppCenter.sdkVersion()
```

## Use custom properties

App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. For instance, you can use custom properties to segment your users, and then send push notifications to a specific [audience](~/push/send-notification.md#audiences).

> [!NOTE]
> Only devices that have [Push](../../push/ios.md) successfully registered are matched in audiences.
> As a consequence, the iOS simulator can not be used to test audience matching.

You can set custom properties by calling the `setCustomProperties` API. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following types: `NSString`, `NSNumber`, `BOOL` and `NSDate`.

```objc
MSCustomProperties *customProperties = [MSCustomProperties new];
[customProperties setString:@"blue" forKey:@"color"];
[customProperties setNumber:@(10) forKey:@"score"];
[MSAppCenter setCustomProperties:customProperties];
```
```swift
var customProperties = MSCustomProperties()
customProperties.setString("blue", forKey: "color")
customProperties.setNumber(10, forKey: "score")
MSAppCenter.setCustomProperties(customProperties)
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `clearPropertyForKey` API. This will only remove the value of the property for a device. It will not remove the property name from App Center portal.

```objc
MSCustomProperties *customProperties = [MSCustomProperties new];
[customProperties clearPropertyForKey:@"score"];
[MSAppCenter setCustomProperties:customProperties];
```
```swift
var customProperties = MSCustomProperties()
customProperties.clearProperty(forKey: "score")
MSAppCenter.setCustomProperties(customProperties)
```

## Storage size

When using the App Center SDK, logs are stored locally on the device. Large logs can take up a lot of space, so you may choose to limit the size of the local database. It is also useful in conjunction with the `pause` and `resume` APIs. If you expect to be paused for a long time, you can use a larger database size to store more events.

Use the `setMaxStorageSize` API to set the size of the local DB. The API is asynchronous, and the `completionHandler` is called when you start App Center services. For this reason, `setMaxStorageSize` must be called before your call to `[MSAppCenter start:...]`. You may only call the API once.

```obj-c
// Use 20 MB for storage.
[MSAppCenter setMaxStorageSize:(20 * 1024 * 1024) completionHandler:^(BOOL success) {
    if (!success) {
        // The success parameter is false when the size cannot be honored.
    }
}];
[MSAppCenter start:@"{Your App Secret}", withServices:@[[MSAnalytics class]]];
```
```swift
// Use 20 MB for storage.
MSAppCenter.setMaxStorageSize(20 * 1024 * 1024, completionHandler: { (success) in
    if !success {
        // The success parameter is false when the size cannot be honored.
    }
})
MSAppCenter.start("{Your App Secret}", withServices:[MSAnalytics.self])
```

If you don't set the max storage size, the SDK uses a default max size of 10 MB. The minimum size you are allowed to set is 20 KB.

> [!NOTE]
> The actual max storage size may be slightly higher than the value you have chosen. SQLite rounds the size up to the next multiple of the page size. The App Center SDK uses a page size of 4 KB.

> [!NOTE]
> The logs older than 25 days will be discarded.

### Unsuccessful API calls

There are many reasons the `completionHandler` call may return false.

* The specified size is an invalid value (less than 20 KB or greater than 140 TB).
* The current database size is larger than the specified maximum size.
* The API has already been called. You may configure it only once per process.
* The API has been called after `[MSAppCenter start:...]` or `[MSAppCenter configure:...]`.

You can check warnings and errors in the console using the `AppCenter` log tag to troubleshoot configuration issues.
