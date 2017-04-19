---
title: SDK Troubleshootng
description: Troubleshooting the Mobile Center SDK for Xamarin
keywords: sdk
author: troublemakerben
ms.author: bereimol
ms.date: 04/17/2017
ms.topic: troubleshooting-article
ms.assetid: ef67ec59-c868-49e7-99e8-42b0399bde92
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarn
---

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

# Xamarin SDK Troubleshooting

## 1. Issues during setup

1. For a Xamarin Forms app, make sure the packages are installed in all the projects that reference any libraries. Otherwise you will see errors.
2. If you have this error when building for Xamarin.iOS: `MTOUCH: Error MT3001: Could not AOT the assembly 'obj/**/Build/Microsoft.Azure.Mobile.**.iOS.Bindings.dll' (MT3001)` you need to update the Xamarin.iOS component to version **10.4.0.128** or later.
3. If you have this error when building for Xamarin.iOS: `MTOUCH: Error MT5210: Native linking failed, undefined symbol: _OBJC_METACLASS_$_MS{SomeSdkClassName}. Please verify that all the necessary frameworks have been referenced and native libraries are properly linked in. (MT5210)` or a similar error (`MT5211` code with similar message mentioning Mobile Center), please make sure you call `MobileCenter.Start` before using the APIs of a specific service. If you are calling `Start` but have this issue, you need to update Xamarin.iOS component to version **10.4.0.128** or more recent.
4. If you are using Visual Studio for Mac and can't see an update to Xamarin.iOS and your Xamarin.iOS version is older than **10.4.0.128**, please install Xamarin Studio and update Xamarin.iOS from Xamarin Studio then you will be able to use the same Xamarin.iOS version on Visual Studio for Mac.
5. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully.

## 2. Analytics data doesn't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `Start()` method call. You can copy the exact `Start()` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

	```csharp
	MobileCenter.LogLevel = LogLevel.Verbose;`
	```

5. Make sure your device is online.
6. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
7. To check if Mobile Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it has been sent.

## 3. Crashes don't show up in the portal
1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `Start()` method call. You can copy the exact `Start()` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. You need to restart the app after a crash and Mobile Center Crashes will forward the crash log only after its restarted. In addition, on iOS, the SDK will not forward any crash log if you attached a debugger. So make sure you are not attached to a debugger when you re-open the app
5. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.


	```csharp
	MobileCenter.LogLevel = LogLevel.Verbose;`
	```

6. Don't use any other library that provides Crash Reporting functionality. You can only have one crash reporting SDK integrated in your app.
7. Make sure your device is online.
8. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
9. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server. 
10. To check if Mobile Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it has been sent.
