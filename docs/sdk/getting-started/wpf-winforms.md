---
title: Get Started with WPF/WinForms
description: Get started
keywords: sdk
author: winnieli1208
ms.author: yuli1
ms.date: 07/25/2019
ms.topic: get-started-article
ms.assetid: ec34cd84-2614-48fc-af57-a457e7cbf6a7
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: wpf-winforms
---

# Get Started with WPF/WinForms

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

> [!NOTE]
> The WPF and WinForms UI hasn't been released yet. If you would like to try out the analytics and diagnostics SDK, please reach out to our support team and we can enable this experience for you. 

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center SDK in your app to use App Center Crashes.

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* Your project is targeting either .NET Framework 4.5 (or higher) or .NET Core 3.0 (or higher).
* .NET Core is supported only when the WPF/WinForms application runs on Windows.
* If you use the SDK from a portable library, it must target .NET standard 1.0 or higher (PCL is not supported).

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
2. Enter a name and an optional description for your app.
3. Select the appropriate OS and platform depending on your project as described above.
4. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Settings** page on the App Center Portal. At the top right hand corner of the **Settings** page, click on the **triple vertical dots** and select `Copy app secret` to get your App Secret.

## 3. Add the App Center SDK modules

The App Center SDK can be integrated using Visual Studio, or the Package Manager Console.

### Visual Studio

* Open Visual Studio.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click **References** and choose **Manage NuGet Packages**.
* Check the **Include prerelease** box, as the support for WPF/WinForms SDK is currently in **preview**.
* In the **Browse tab**, Search for **App Center**, and install **Microsoft.AppCenter.Analytics** and **Microsoft.AppCenter.Crashes** packages with version **2.2.1-preview** for both packages.

### Package Manager Console

* Open the console in [Visual Studio](https://visualstudio.microsoft.com/vs/). To do this, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.
* Type the following commands:

```shell
Install-Package Microsoft.AppCenter.Analytics -Version 2.2.1-preview
Install-Package Microsoft.AppCenter.Crashes -Version 2.2.1-preview
```

> [!NOTE]
> Make sure you install the **-preview** package as the official releases do not support WPF/WinForms.

Now that you've integrated the SDK in your application, it's time to start the SDK and make use of the App Center services.

> [!NOTE]
> If you use the App Center SDK in a portable project, you must install the packages in each of the projects: the portable, and the project that is running the WPF/WinForms app. To do that, you should open each sub-project and follow the corresponding steps described in [Visual Studio](#visual-studio) section.

## 5. Start the SDK

In order to use App Center, you must opt in to the module(s) that you want to use. By default no modules are started and you will have to explicitly call each of them when starting the SDK.

### 5.1 Add the `Start()` method

* On WPF, modify the `App.xaml.cs`.
* On WinForms, modify the `Program.cs` file.

Add the following using statements:

```csharp
using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;
```

Then in the same file:

* On WPF, add the following code in the `OnStartup` method.
* On WinForms, add the following code in the `Main` method, before the `Application.Run` statement.

```csharp
AppCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Crashes));
```

### 5.2 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

The example above shows how to use the `Start()` method and includes App Center Analytics.

Note that, unless you explicitly specify each service as parameters in the start method, you can't use that App Center service. In addition, the `Start()` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the services included in the first call will be available.

Great, you are all set to visualize crashes on the portal that the SDK collects automatically.

Look at the documentation for [App Center Analytics](~/sdk/analytics/windows.md) and [App Center Crashes](~/sdk/crashes/wpf-winforms.md) to learn how to customize and use more advanced functionalities of both services.
