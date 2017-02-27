---
title: Mobile Center SDK Limitations & Known Issues
description: Limitations and known issues with the Mobile Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 02/24/2017
ms.topic: article
ms.assetid: e1e427f3-6949-4266-b1cd-13da703fc132
ms.service: mobile-center
ms.custom: sdk
---

# SDK Limitations & Known Issues

Following are the known SDK limitations for different platforms:

### iOS and Xamarin iOS
1. Linking fails when using both HockeyApp and Mobile Center SDK in the same app.
Your app will fail to compile with a linking error if you are using HockeyApp SDK for Crash reporting along with the Mobile Center SDK for Crashes. You can only include 1 Crash SDK in your app. In order for your app to compile, please remove the other one. Also note that Mobile Center SDK is in public preview right now, so our recommendation is to use the new SDK for test apps and continue using HockeySDK for your production apps.

### Xamarin
1. Crashes caused by `StackOverflowException` are not reported. This is a limitation of the Xamarin runtime.

## Known Issues

1. If you are using the Xamarin IDE alpha release, there is an issue causing the forms previewer not to work when working on a Xamarin.Forms application that integrates Mobile Center. The exact error is: `Invalid XAML: Could not create an native instance of the type 'Microsoft.Azure.Mobile.iOS.Bindings.MSWrapperSdk': the native class hasn't been loaded`

2. If you have this error when building for Xamarin.iOS: `MTOUCH: Error MT3001: Could not AOT the assembly 'obj/**/Build/Microsoft.Azure.Mobile.**.iOS.Bindings.dll' (MT3001)` you need to *uncheck* **Enable incremental builds** in iOS Build Project Options.
This is a problem introduced by Xamarin.iOS version 10.4 and can be tracked [here](https://bugzilla.xamarin.com/show_bug.cgi?id=52727).
