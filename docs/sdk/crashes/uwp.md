---
title: App Center Crashes for UWP
description: App Center Crashes for UWP
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 07/22/2019
ms.topic: article
ms.assetid: 6a102584-57ad-4b84-9fa1-8c2fd8b903ef
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: UWP
---

# App Center Crashes

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [React Native](react-native.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Unity](unity.md)
> * [Cordova](cordova.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is sent to App Center through the Windows crash reporting service built into Windows devices. Crash logs contain valuable information for you to help fix the crash. The crash will be reported to App Center even if the app is not restarted.

Please follow the [Getting Started](~/sdk/getting-started/uwp.md) section if you haven't set up the SDK in your application yet.

> [!IMPORTANT]
> * Crash reporting is enabled only on devices running Windows 10 Creators update or more recent (version 10.0.15063).
> * Crash reporting on Windows requires the app to be distributed through the Microsoft Store.
> * Crashes will only be sent if the device is plugged in to power, this includes phones.
> * Some crashes might appear unsymbolicated (missing method names or file names or even class names) from applications that are associated with Microsoft Store (such as when you add WNS push) before the application is actually published. This behavior can happen but there is no guarantee that it will.

> [!NOTE]
> We plan to improve App Center's Windows support in Summer 2019 and address the limitations listed above. You can find more details in our proposed [Windows plan](https://github.com/microsoft/appcenter/blob/specs/specs/2019-04/Windows-Plan.md).

## User consent to send a crash log

App Center Crashes for UWP will utilize the built in Windows crash reporting service; therefore it honors the user's default [privacy settings](https://privacy.microsoft.com/windows-10-feedback-diagnostics-and-privacy) for sending crash reports in Windows.

## Adding the crashes module

### Package Manager Console

* Open the console in [Visual Studio](https://visualstudio.microsoft.com/vs/). To do this, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.
* Type the following commands:

```shell
Install-Package Microsoft.AppCenter.Crashes
```

> [!IMPORTANT]
> * The Crash SDK is compatible only with official releases of the NuGet package. Do not install `-preview` releases that are not yet ready for UWP (it would stop showing crashes for UWP on App Center portal).

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

> [!IMPORTANT]
> UWP only supports starting Crashes with `AppCenter.Start` and none of the other API calls provided by the `Crashes` class are supported on UWP, They only work for Xamarin.iOS, Xamarin.Android and Xamarin.Forms apps deployed to iOS and Android.
