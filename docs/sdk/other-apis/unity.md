---
title: Other Unity APIs
description: Other APIs in the App Center SDK for Unity
keywords: sdk
author: jwhitedev
ms.author: jawh
ms.date: 07/11/2019
ms.topic: article
ms.assetid: 666da224-d8fe-484b-b945-c2d018c53daa
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: unity
---

# Other Unity APIs

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

You can control the number of log messages that show up from App Center in the console. Use the `LogLevel`-API to enable additional logging while debugging. By default, it's set to `ASSERT` for the App Store environments and `WARN` otherwise.

To have as many log messages as possible, enable `LogLevel.Verbose` in the App Center settings or within your code.

```csharp
AppCenter.LogLevel = LogLevel.Verbose;
```

## Identify installations

The App Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated. A new identifier is generated only when the app is reinstalled. The following API is useful for debugging purposes.

```csharp
System.Guid? installId = await AppCenter.GetInstallIdAsync();
```

## Identify users

The App Center SDK supports setting a **user ID** that is used to augment crash reports. To use this capability:

1. Configure the App Center SDK as described in the [App Center SDK Getting started guide](~/sdk/getting-started/unity.md).
2. Set a `userID` in the SDK using the following code:

```csharp
AppCenter.SetUserId("your-user-id");
```

After setting a user ID, you can use App Center's search feature to search for specific crash reports associated with the ID. Learn more in App Center's [search documentation](~/diagnostics/search.md). 

> [!NOTE]
> Note that the value for the user id is limited to 256 characters.

## Disable all services at runtime

If you want to disable all App Center services at once, use the `Enabled` property. When disabled, the SDK won't forward any information to App Center.

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

You can enable or disable desired service at the runtime with following code:

```csharp
Analytics.SetEnabledAsync(true);
```

> [!NOTE]
> This method should only be used after AppCenter is started.

## Check if App Center is enabled

You can also check if App Center is enabled or not.

```csharp
bool enabled = await AppCenter.IsEnabledAsync();
```

## Check App Center SDK version at runtime

You can get the version of App Center SDK that you're currently using.

```csharp
AppCenter.SdkVersion;
```

## Use custom properties

App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. For instance, you can use custom properties to segment your users, and then send push notifications to those segments by [creating targeted audiences](~/push/send-notification.md#audiences).

> [!NOTE]
> Only devices that have Push successfully registered are matched in audiences. Make sure to refer to the relevant getting started documentation depending on the platform you are targeting.
> As a consequence, the iOS simulator can not be used to test audience matching.

You can set custom properties by calling the `SetCustomProperties()` method. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following C# types: `string`, `int`, `long`, `double`, `float`, `decimal`, `bool`, and `DateTime`.

```csharp
CustomProperties properties = new CustomProperties();
properties.Set("color", "blue").Set("score", 10).Set("now", DateTime.UtcNow);
AppCenter.SetCustomProperties(properties);
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `Clear()` method. This method will only remove the value of the property for a device. It won't remove the property name from App Center portal.

```csharp
CustomProperties properties = new CustomProperties();
properties.Clear("score");
AppCenter.SetCustomProperties(properties);
```
