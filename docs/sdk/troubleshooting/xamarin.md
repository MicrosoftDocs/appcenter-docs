---
title: Xamarin SDK Troubleshooting
description: Troubleshooting the App Center SDK for Xamarin
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 01/31/2018
ms.topic: troubleshooting-article
ms.assetid: ef67ec59-c868-49e7-99e8-42b0399bde92
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: xamarin
---

# Xamarin SDK Troubleshooting

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [React Native](react-native.md)

## Issues during setup

1. For a Xamarin Forms app, make sure the packages are installed in all the projects that reference any libraries. Otherwise you will see errors.
2. If you have this error when building for Xamarin.iOS: `MTOUCH: Error MT3001: Could not AOT the assembly 'obj/**/Build/Microsoft.AppCenter.**.iOS.Bindings.dll' (MT3001)` you need to update the Xamarin.iOS component to version **10.4.0.128** or later.
3. If you have this error when building for Xamarin.iOS: `MTOUCH: Error MT5210: Native linking failed, undefined symbol: _OBJC_METACLASS_$_MS{SomeSdkClassName}. Please verify that all the necessary frameworks have been referenced and native libraries are properly linked in. (MT5210)` or a similar error (`MT5211` code with similar message mentioning App Center), please make sure you call `AppCenter.Start` before using the APIs of a specific service. If you are calling `Start` but have this issue, you need to update Xamarin.iOS component to version **10.4.0.128** or more recent.
4. If you are using Visual Studio for Mac and can't see an update to Xamarin.iOS and your Xamarin.iOS version is older than **10.4.0.128**, please install Xamarin Studio and update Xamarin.iOS from Xamarin Studio then you will be able to use the same Xamarin.iOS version on Visual Studio for Mac.
5. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This verifies that the SDK is configured successfully.

## Analytics data doesn't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `Start()` method call. You can copy the exact `Start()` code by opening the app in the portal and navigating to Getting Started page.
3. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

  ```csharp
  AppCenter.LogLevel = LogLevel.Verbose;
  ```

  Check the logs say "App Center SDK configured successfully" (in Info log level), then check if you see HTTPS request logs.

4. Make sure your device is online.
5. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
6. To check if App Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it has been sent.

## Crashes don't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `Start()` method call. You can copy the exact `Start()` code by opening the app in the portal and navigating to Getting Started page.
3. You need to restart the app after a crash and App Center Crashes will forward the crash log only after it is restarted. In addition, on Xamarin.iOS, the SDK will not save any crash log if you attached a debugger. Make sure the debugger is not attached when you crash the iOS app. On Xamarin.Android, you can crash while having debugger attached but you need to continue execution after breaking into the unhandled exception.
4. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

  ```csharp
  AppCenter.LogLevel = LogLevel.Verbose;
  ```

  Check the logs say "App Center SDK configured successfully" (in Info log level), then check if you see HTTPS request logs.

5. Don't use any other library that provides Crash Reporting functionality, such as Xamarin Insights or HockeyApp. You can only have one crash reporting SDK integrated.
6. If you use Hockey App in Android, make sure it's initialized after App Center.
7. Make sure your device is online.
8. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
9. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server.
10. To check if App Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it has been sent.

## Distribute and in-app updates are blocking my automated UI tests

If you are running automated UI tests, enabled in-app updates will block your automated UI tests as they will try to authenticate against the App Center backend. We recommend to not enable App Center Distribute for your UI tests. 

## You are seeing messages in the console that indicate that the database could not be opened on iOS

App Center uses SQLite to persist logs before they are sent to the backend. If you are bundling your application with your own SQLite library instead of using the one provided by the OS, you might see errors like this in the console `[AppCenter] ERROR: -[MSDBStorage executeSelectionQuery:]/147 Failed to open database` and won't see any analytics or crash information in the backend. Please update the SDK to version 0.16.0 or later.
