---
title: Other WPF and WinForms APIs
description: Other APIs in the App Center SDK for WPF and WinForms
keywords: sdk
author: winnieli1208
ms.author: yuli1
ms.date: 10/16/2019
ms.topic: article
ms.assetid: 3c917c07-a32f-4c5d-85d1-844c8d935c0c
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: wpf-winforms
---

# Other WPF and WinForms APIs

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

You can control the amount of log messages that show up from App Center in the console. Use the `LogLevel` API to enable additional logging while debugging. By default, it is set to `ASSERT` for the App Store environments and `WARN` otherwise.

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

```csharp
Analytics.SetEnabledAsync(false);
```

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

## Other APIs

The .NET NuGet package is shared with Xamarin and UWP, which have more functionalities.
All the APIs that are not documented for WPF and WinForms in this page will return `null` or `false` and will not do anything on WPF and WinForms.
The other APIs are visible so that you can use them in a portable library (such as when using the SDK in a Xamarin.Forms application that contains a UWP project), but those extra APIs are not implemented on WPF and WinForms.
