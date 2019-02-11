---
title: Other Android APIs
description: Other APIs in the App Center SDK for Android
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 01/03/2019
ms.topic: article
ms.assetid: d13dd720-93b3-4658-b579-230c8821e292
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
dev_langs:
 - java
 - kotlin
---

# Other Android APIs

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Unity](unity.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

## Adjust the log level

You can control the amount of log messages by App Center that show up in LogCat. Use the `AppCenter.setLogLevel()` API to enable additional logging while debugging. The log levels correspond to the ones defined in `android.util.Log`. By default, it is set it to `ASSERT` for non-debuggable applications and `WARN` for debuggable applications. You can set the log level at any time you want.

To have as many log messages as possible, use `Log.Verbose`.

```java
AppCenter.setLogLevel(Log.VERBOSE);
```
```kotlin
AppCenter.setLogLevel(Log.VERBOSE)
```

## Identify installations

The App Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed or the user manually deletes all app data. The following API is useful for debugging purposes.

```java
AppCenter.getInstallId();
```
```kotlin
AppCenter.getInstallId()
```

[!include[](../android-see-async.md)]

## Identify users

The App Center SDK supports setting a **user id** that is used to augment crash reports. To use this capability:

1. Configure the App Center SDK by calling `AppCenter.start(...)` as described in the [App Center SDK Getting started guide](~/sdk/getting-started/android.md). 
2. Set a `userID` in the SDK using the following code:

```java
AppCenter.setUserId("your-user-id");
```
```kotlin
AppCenter.setUserId("your-user-id")
```

> [!NOTE]
> Note that the value for the user id is limited to 256 characters.

## Disable all services at runtime

If you want to disable all App Center services at once, use the `setEnabled()` API. When disabled, the SDK will not forward any information to App Center.

```java
AppCenter.setEnabled(false);
```
```kotlin
AppCenter.setEnabled(false)
```

To enable all services at once again, use the same API but pass `true` as a parameter.

```java
AppCenter.setEnabled(true);
```
```kotlin
AppCenter.setEnabled(true)
```

[!include[](../android-see-async.md)]

## Check if App Center is enabled

You can also check if App Center is enabled or not.

```java
AppCenter.isEnabled();
```
```kotlin
AppCenter.isEnabled()
```

[!include[](../android-see-async.md)]

## Check App Center SDK version at runtime

You can get the version of App Center SDK that you are currently using.

```java
AppCenter.getSdkVersion();
```
```kotlin
AppCenter.getSdkVersion()
```

## Use custom properties

App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. For instance, you can use custom properties to segment your users, and then send push notifications to a specific [audience](~/push/send-notification.md#audiences).

> [!NOTE]
> Only devices that have [Push](../push/android.md) successfully registered are matched in audiences.

Set custom properties by calling the `setCustomProperties()` API. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following Java types: `String`, `Number`, `boolean` and `Date`. 

```java
CustomProperties properties = new CustomProperties();
properties.set("color", "blue").set("score", 10);
AppCenter.setCustomProperties(properties);
```
```kotlin
val properties = CustomProperties()
properties.set("color", "blue").set("score", 10)
AppCenter.setCustomProperties(properties)
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `clear()` API. This will only remove the value of the property for a device. It will not remove the property name from App Center portal.

```java
CustomProperties properties = new CustomProperties();
properties.clear("score");
AppCenter.setCustomProperties(properties);
```
```kotlin
val properties = CustomProperties()
properties.clear("score")
AppCenter.setCustomProperties(properties)
```

## Storage size

When using the App Center SDK, logs are stored locally on the device. Large logs can take up a lot of space, so you may choose to limit the size of the local database. It is also useful in conjunction with the `pause` and `resume` APIs. If you expect to be paused for a long time, you can use a larger database size to store more events.

You can use the `setMaxStorageSize` API to set the size of the local DB. The API is asynchronous, and the callback is called when you start App Center services. For this reason, `setMaxStorageSize` must be called before your call to `AppCenter.start(...)`. You may only call the API once.

```java
// Use 20MB for storage.
AppCenter.setMaxStorageSize(20 * 1024 * 1024L).thenAccept(new AppCenterConsumer<Boolean>() {

    @Override
    public void accept(Boolean success) {
        // The success parameter is false when the size cannot be honored.
    }
});
AppCenter.start("{Your App Secret}", Analytics.class);
```
```kotlin
// Use 20MB for storage.
AppCenter.setMaxStorageSize(20 * 1024 * 1024).thenAccept {
    // The success parameter (it) is false when the size cannot be honored.
}

AppCenter.start(application, "{Your App Secret}", Analytics::class.java)
```

If you don't set the max storage size, the SDK uses a default max size of 10MB. The minimum size you are allowed to set is 20KB.

> [!NOTE]
> The actual max storage size may be higher than the value you have chosen. SQLite rounds the size up to the next multiple of the page size. The App Center SDK uses a page size of 4KB.

### Unsuccessful API calls

There are many reasons the callback may fail.

* The specified size is an invalid value (less than 20KB or greater than 140TB).
* The current database size is larger than the specified maximum size.
* The API has already been called. You may configure it only once per process.
* The API has been called after `AppCenter.start(...)`.

You can check warnings and errors in the console using the `AppCenter` log tag to troubleshoot configuration issues.
