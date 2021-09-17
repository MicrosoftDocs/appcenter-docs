---
title: Other Android APIs
description: Other APIs in the App Center SDK for Android
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 08/26/2021
ms.topic: article
ms.assetid: d13dd720-93b3-4658-b579-230c8821e292
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
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

## Adjust the log level

You can control the amount of log messages by App Center that show up in LogCat. Use the `AppCenter.setLogLevel()` API to enable additional logging while debugging. The log levels correspond to the ones defined in `android.util.Log`. By default, it's set it to `ASSERT` for non-debuggable applications and `WARN` for debuggable applications. You can set the log level at any time you want.

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

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `AppCenter` has been started, it will always return `null` before start.

## Identify users

The App Center SDK supports setting a **user ID** that's used to augment crash reports. To use this capability:

1. Configure the App Center SDK by calling `AppCenter.start(...)` as described in the [App Center SDK Getting started guide](~/sdk/getting-started/android.md). 
2. Set a `userID` in the SDK using the following code:

```java
AppCenter.setUserId("your-user-id");
```
```kotlin
AppCenter.setUserId("your-user-id")
```

[!INCLUDE [user id](includes/user-id.md)]

## Disable all services at runtime

If you want to disable all App Center services at once, use the `setEnabled()` API. When disabled, the SDK won't forward any information to App Center.

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

The state is persisted in the device's storage across application launches.

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `AppCenter` has been started.

## Disallow network requests

In the App Center SDK, network requests are allowed by default. If you want to send data that the App Center SDK collects by the user concern you can disallow automatic sending data.

```java
AppCenter.setNetworkRequestsAllowed(false);
```
```kotlin
AppCenter.setNetworkRequestsAllowed(false)
```

In this case, the App Center SDK continues to collect data but it will be sent only when the network requests will be allowed.

```java
AppCenter.setNetworkRequestsAllowed(true);
```
```kotlin
AppCenter.setNetworkRequestsAllowed(true)
```

>[!NOTE]
> This value is retained between starts.

At any time, you can check whether sending data in the App Center SDK is allowed or not.

```java
AppCenter.isNetworkRequestsAllowed();
```
```kotlin
AppCenter.isNetworkRequestsAllowed()
```

>[!NOTE]
> The value saved previously in `SharedPreferences` is ignored until `AppCenter` is started.
> It will return the last value set using `setNetworkRequestsAllowed` or `true` if the value wasn't changed before AppCenter start.

## Change state of service in runtime

Enable or disable the services at the runtime with following code:

```java
Analytics.setEnabled(false);
```
```kotlin
Analytics.setEnabled(false)
```

> [!NOTE]
> This method must only be used after `Analytics` has been started.

## Check if App Center is enabled

You can also check if App Center is enabled or not.

```java
AppCenter.isEnabled();
```
```kotlin
AppCenter.isEnabled()
```

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `AppCenter` has been started, it will always return `false` before start.

## Check App Center SDK version at runtime

You can get the version of App Center SDK that you're currently using.

```java
AppCenter.getSdkVersion();
```
```kotlin
AppCenter.getSdkVersion()
```

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

You may remove any custom property by calling the `clear()` API. This only removes the value of the property for a device. It won't remove the property name from App Center portal.

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

When using the App Center SDK, logs are stored locally on the device. Large logs can take up a lot of space, so you may choose to limit the size of the local database. It's also useful in conjunction with the `pause` and `resume` APIs. If you expect to be paused for a long time, you can use a larger database size to store more events.

You can use the `setMaxStorageSize` API to set the size of the local DB. The API is asynchronous, and the callback is called when you start App Center services. For this reason, `setMaxStorageSize` must be called before your call to `AppCenter.start(...)`. You may only call the API once.

```java
// Use 20 MB for storage.
AppCenter.setMaxStorageSize(20 * 1024 * 1024L).thenAccept(new AppCenterConsumer<Boolean>() {

    @Override
    public void accept(Boolean success) {
        // The success parameter is false when the size can't be honored.
    }
});
AppCenter.start("{Your App Secret}", Analytics.class);
```
```kotlin
// Use 20 MB for storage.
AppCenter.setMaxStorageSize(20 * 1024 * 1024).thenAccept {
    // The success parameter (it) is false when the size can't be honored.
}

AppCenter.start(application, "{Your App Secret}", Analytics::class.java)
```

If you don't set the max storage size, the SDK uses a default max size of 10 MB. The minimum size you're allowed to set is 20 KB.

> [!NOTE]
> The actual max storage size may be higher than the value you've chosen. SQLite rounds the size up to the next multiple of the page size. The App Center SDK uses a page size of 4 KB.

> [!NOTE]
> The logs older than 25 days will be discarded.

## Add distribution stores

By default in-app updates work for apps installed from the defined list of stores. If you want to distribute your application via stores that are not included in the predefined list of stores, then you can add the needed package installer using the API below before App Center start:

```java
    Set<String> stores = new HashSet<String>();
    stores.add("com.store1.packageinstaller");
    stores.add("com.store2.packageinstaller");
    Distribute.addStores(stores);
```

> [!NOTE]
> Don't add stores like Google Play to avoid any restrictions.

### Unsuccessful API calls

There are many reasons the callback may fail.

* The specified size is an invalid value (less than 20KB or greater than 140TB).
* The current database size is larger than the specified maximum size.
* The API has already been called. You may configure it only once per process.
* The API has been called after `AppCenter.start(...)`.

You can check warnings and errors in the console using the `AppCenter` log tag to troubleshoot configuration issues.

## Asynchronous APIs in the Android SDK

[!INCLUDE [[Android Async APIs](includes/android-async.md)]
