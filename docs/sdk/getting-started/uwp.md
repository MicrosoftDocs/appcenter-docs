---
title: Get Started with UWP
description: Get started
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 10/08/2018
ms.topic: get-started-article
ms.assetid: e66eeedb-5395-46ce-9526-9e22319a94d4
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: uwp
---

# Get Started with UWP

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center UWP SDK in your app to use App Center Analytics.

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* Your project is set up in Visual Studio 2015 Update 3 or Visual Studio 2017.
* Your project references Universal Windows Platform [5.2.2](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform/5.2.2) or later

> [!NOTE]
> If you want to use Xamarin.Forms for UWP, please follow the Xamarin [Getting started](~/sdk/getting-started/xamarin.md) documentation instead of this one.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. To learn how to get started with Push, read the [appcenter.ms](https://appcenter.ms) documentation.

2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.

3. Enter a name and an optional description for your app.

4. Select the appropriate OS and platform depending on your project as described above.

5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** page or **Settings** page on the App Center Portal.

## 3. Add the App Center SDK modules

The App Center SDK can be integrated using Visual Studio, or the Package Manager Console.

### Visual Studio

1. Navigate to the **Project > Manage NuGet Packages...**

2. Search for **App Center**, and install **Microsoft.AppCenter.Analytics**.

### Package Manager Console

* Type the following commands:

   `PM> Install-Package Microsoft.AppCenter.Analytics`

Now that you've integrated the SDK in your application, it's time to start the SDK and make use of the App Center services.

> [!NOTE]
> If you use the App Center SDK in a portable project (such as **Xamarin.Forms**), you need to install the packages
> in each of the projects: the portable and UWP ones.

## 4. Add the `Internet (Client)` capability

In Visual Studio solution explorer, double-click the **Package.appxmanifest** file for your application. Click the **Capabilities** tab then check the **Internet (Client)** capability.

## 5. Start the SDK

In order to use App Center, you need to opt in to the services that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

### 5.1 Add the using statements

Add the appropriate namespaces before you use our APIs.

```csharp
using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
```

### 5.2 Add the `Start()` method

Add the following call to your application's **constructor**:

```csharp
AppCenter.Start("{Your App Secret}", typeof(Analytics));
```

### 5.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

The example above shows how to use the `Start()` method and includes App Center Analytics.

Note that, unless you explicitly specify each service as parameters in the start method, you can't use that App Center service. In addition, the `Start()` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the services included in the first call will be available.

Great, you are all set to visualize Analytics on the portal that the SDK collects automatically.

Look at the documentation for [App Center Analytics](~/sdk/analytics/uwp.md) to learn how to customize and use more advanced functionalities.

