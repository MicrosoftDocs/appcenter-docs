---
title: App Center Crashes for UWP
description: App Center Crashes for UWP
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 08/13/2019
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

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the Windows Store. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/uwp.md) section if you haven't set up the SDK in your application yet.

> [!NOTE]
> Currently we do not support detection of low memory warning on UWP platform.

## Adding the crashes module

### Package Manager Console

* Open the console in [Visual Studio](https://visualstudio.microsoft.com/vs/). To do this, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.
* Type the following commands:

```shell
Install-Package Microsoft.AppCenter.Crashes
```

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
