---
title: App Center Crashes for UWP
description: App Center Crashes for UWP
keywords: sdk, crash
author: elamalani 
ms.author: elamalani 
ms.date: 11/17/2017
ms.topic: article
ms.assetid: 6a102584-57ad-4b84-9fa1-8c2fd8b903ef
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: UWP
---

# App Center Crashes

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [UWP](uwp.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is sent to App Center through the Windows crash reporting service built into Windows devices. Crash logs contain valuable information for you to help fix the crash. The crash will be reported to App Center even if the app is not restarted.

Please follow the [Getting Started](~/sdk/getting-started/uwp.md) section if you haven't set up the SDK in your application yet.


> [!IMPORTANT]
> Crash reporting on windows requires the app to be distributed through the Windows Store.


> [!NOTE]
> Crashes will only be sent if the device is plugged in to power, this includes phones.


### Users consent to send a crash log

App Center Crashes for UWP will utilize the built in Windows crash reporting service; therefore they honor the users default privacy settings for sending crash reports in Windows.

## Adding the crashes module

### Package Manager Console

* Type the following commands:

   `PM> Install-Package Microsoft.AppCenter.Crashes`


### Add the using statements

Add the appropriate namespaces before you use our APIs.

```csharp
using Microsoft.AppCenter.Crashes;
```

### Modify the `Start()` method

Add or edit the following call to your application's **constructor** to include the crashes module:

```csharp
AppCenter.Start("{Your App Secret}", typeof(Crashes));
```