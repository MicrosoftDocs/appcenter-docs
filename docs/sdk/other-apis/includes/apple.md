---
title: Shared docs for Apple SDK
description:  Shared docs for Apple SDK
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 26/04/2021
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

You can control the amount of log messages that show up from App Center in the console. Use the `setLogLevel:`-API to enable additional logging while debugging. By default, it's set to `LogLevelAssert` for the App Store environment and `LogLevelWarning` otherwise.

To have as many log messages as possible, use `MSACLogLevelVerbose`/`LogLevel.verbose`.

```objc
[MSACAppCenter setLogLevel:MSACLogLevelVerbose];
```
```swift
AppCenter.logLevel = .verbose
```

## Identify installations

The App Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

```objc
NSUUID *installId = [MSACAppCenter  installId];
```
```swift
var installId = AppCenter.installId
```

## Identify users

The App Center SDK supports setting a **user ID** that's used to augment crash reports. To use this capability:

1. Configure the App Center SDK by calling `:start:withServices:` as described in the [App Center SDK Getting started guide](~/sdk/getting-started/ios.md). 
2. Set a `userID` in the SDK using the following code:

```objc
[MSACAppCenter setUserId:@"your-user-id"];
```
```swift
AppCenter.userId = "your-user-id"
```
[!INCLUDE [user id](user-id.md)]

## Disable all services at runtime

If you want to disable all App Center services at once, use the `setEnabled` API. When disabled, the SDK won't forward any information to App Center.

```objc
[MSACAppCenter setEnabled:NO];
```
```swift
AppCenter.enabled = false
```

To enable all services at once again, use the same API but pass `YES`/`true` as a parameter.

```objc
[MSACAppCenter setEnabled:YES];
```
```swift
AppCenter.enabled = true
```

The state is persisted in the device's storage across application launches.

> [!NOTE]
> This method must only be used after `AppCenter` has been started.

## Disallow network requests

In the App Center SDK, network requests are allowed by default. If you want to send data that the App Center SDK collects by the user concern you can disallow automatic sending data.

```objc
[MSACAppCenter setNetworkRequestsAllowed:false];
```
```swift
AppCenter.networkRequestsAllowed = false
```

In this case, the App Center SDK continues to collect data but it will be sent only when the network requests will be allowed.

```objc
[MSACAppCenter setNetworkRequestsAllowed:true];
```
```swift
AppCenter.networkRequestsAllowed = true
```

At any time, you can check whether sending data in the App Center SDK is allowed or not.

```objc
[MSACAppCenter isNetworkRequestsAllowed];
```
```swift
AppCenter.networkRequestsAllowed
```

## Change state of service in runtime

Enable or disable the services at the runtime with following code:

```objc
[MSACAnalytics setEnabled:NO];
```
```swift
Analytics.enabled = false
```

> [!NOTE]
> This method must only be used after `Analytics` has been started.

## Check if App Center is enabled

You can also check if App Center is enabled or not.

```objc
[MSACAppCenter isEnabled];
```
```swift
AppCenter.enabled
```

> [!NOTE]
> This method must only be used after `AppCenter` has been started, it will always return `false` before start.

## Check App Center SDK version at runtime

You can get the version of App Center SDK that you're currently using.

```objc
[MSACAppCenter sdkVersion];
```
```swift
AppCenter.sdkVersion
```

## Use custom properties

App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. For instance, you can use custom properties to segment your users, and then send push notifications to a specific [audience](~/push/send-notification.md#audiences).

> [!NOTE]
> Only devices that have [Push](../../push/ios.md) successfully registered are matched in audiences.
> As a consequence, the iOS simulator can't be used to test audience matching.

You can set custom properties by calling the `setCustomProperties` API. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following types: `NSString`, `NSNumber`, `BOOL` and `NSDate`.

```objc
MSACCustomProperties *customProperties = [MSACCustomProperties new];
[customProperties setString:@"blue" forKey:@"color"];
[customProperties setNumber:@(10) forKey:@"score"];
[MSACAppCenter setCustomProperties:customProperties];
```
```swift
var customProperties = CustomProperties()
customProperties.setString("blue", forKey: "color")
customProperties.setNumber(10, forKey: "score")
AppCenter.customProperties = customProperties
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `clearPropertyForKey` API. This only removes the value of the property for a device. It won't remove the property name from App Center portal.

```objc
MSACCustomProperties *customProperties = [MSACCustomProperties new];
[customProperties clearPropertyForKey:@"score"];
[MSACAppCenter setCustomProperties:customProperties];
```
```swift
var customProperties = CustomProperties()
customProperties.clearProperty(forKey: "score")
AppCenter.customProperties = customProperties
```

## Storage size

When using the App Center SDK, logs are stored locally on the device. Large logs can take up a lot of space, so you may choose to limit the size of the local database. It's also useful in conjunction with the `pause` and `resume` APIs. If you expect to be paused for a long time, you can use a larger database size to store more events.

Use the `setMaxStorageSize` API to set the size of the local DB. The API is asynchronous, and the `completionHandler` is called when you start App Center services. For this reason, `setMaxStorageSize` must be called before your call to `AppCenter.start`. You may only call the API once.

```obj-c
// Use 20 MB for storage.
[MSACAppCenter setMaxStorageSize:(20 * 1024 * 1024) completionHandler:^(BOOL success) {
    if (!success) {
        // The success parameter is false when the size can't be honored.
    }
}];
[MSACAppCenter start:@"{Your App Secret}", withServices:@[[MSACAnalytics class]]];
```
```swift
// Use 20 MB for storage.
AppCenter.setMaxStorageSize(20 * 1024 * 1024, completionHandler: { (success) in
    if !success {
        // The success parameter is false when the size can't be honored.
    }
})
AppCenter.start(withAppSecret: "{Your App Secret}", services:[Analytics.self])
```

If you don't set the max storage size, the SDK uses a default max size of 10 MB. The minimum size you're allowed to set is 20 KB.

> [!NOTE]
> The actual max storage size may be slightly higher than the value you've chosen. SQLite rounds the size up to the next multiple of the page size. The App Center SDK uses a page size of 4 KB.

> [!NOTE]
> The logs older than 25 days will be discarded.

### Unsuccessful API calls

There are many reasons the `completionHandler` call may return false.

* The specified size is an invalid value (less than 20 KB or greater than 140 TB).
* The current database size is larger than the specified maximum size.
* The API has already been called. You may configure it only once per process.
* The API has been called after `AppCenter.start` or `AppCenter.configure`.

You can check warnings and errors in the console using the `AppCenter` log tag to troubleshoot configuration issues.
