---
title: Other UWP APIs
description: Other APIs in the App Center SDK for UWP
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 10/16/2019
ms.topic: article
ms.assetid: 47b5da40-70fd-468b-a9a9-05a266b7fa7b
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: uwp
---

# Other UWP APIs

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

You can control the amount of log messages that show up from App Center in the console. Use the `LogLevel`-API to enable additional logging while debugging. By default, it is set to `ASSERT` for the App Store environments and `WARN` otherwise.

To have as many log messages as possible, use `LogLevel.Verbose`.

```csharp
AppCenter.LogLevel = LogLevel.Verbose;
```

## Identify installations

The App Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

```csharp
System.Guid? installId = await AppCenter.GetInstallIdAsync();
```

## Identify users

The App Center SDK supports setting a **user ID** that is used to augment crash reports. To use this capability:

1. Configure the App Center SDK by calling `AppCenter.Start(...)` as described in the [App Center SDK Getting started guide](~/sdk/getting-started/xamarin.md).
2. Set a `userID` in the SDK using the following code:

```csharp
AppCenter.SetUserId("your-user-id");
```

After setting a user ID, you can use App Center's search feature to search for specific crash reports associated with the ID. Learn more in App Center's [search documentation](~/diagnostics/search.md). 

> [!NOTE]
> The value for the user id is limited to 256 characters.

## Disable all services at runtime

If you want to disable all App Center services at once, use the `Enabled` property. When disabled, the SDK will not forward any information to App Center.

```csharp
AppCenter.SetEnabledAsync(false);
```

To enable all services at once again, use the same API but pass `true` as a parameter.

```csharp
AppCenter.SetEnabledAsync(true);
```

You don't need to await this call to make other API calls (such as `IsEnabledAsync`) consistent.

The state is persisted in the device's storage across application launches.

## Change state of service in runtime

Enable or disable desired services at the runtime with following code:

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

```csharp
bool enabled = await AppCenter.IsEnabledAsync();
```

## Check App Center SDK version at runtime

You can get the version of App Center SDK that you are currently using.

```csharp
AppCenter.SdkVersion;
```

## Use custom properties

App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. For instance, you can use custom properties to segment your users, and then send push notifications to a specific [audience](~/push/send-notification.md#audiences).

> [!NOTE]
> Only devices that have [Push](../push/uwp.md) successfully registered are matched in audiences.

You can set custom properties by calling the `SetCustomProperties()` API. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following C# datatypes: `string`, `int`, `long`, `double`, `float`, `decimal`, `bool` and `DateTime`.

```csharp
CustomProperties properties = new CustomProperties();
properties.Set("color", "blue").Set("score", 10).Set("now", DateTime.UtcNow);
AppCenter.SetCustomProperties(properties);
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `Clear()` API. This will only remove the value of the property for a device. It will not remove the property name from App Center portal.

```csharp
CustomProperties properties = new CustomProperties();
properties.Set("color", "blue").Set("score", 10).Clear("score");
AppCenter.SetCustomProperties(properties);
```
