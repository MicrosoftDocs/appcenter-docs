---
title: Get Started with UWP
description: Get started
keywords: sdk
author: dhei
ms.author: dihei
ms.date: 05/01/2017
ms.topic: get-started-article
ms.assetid: e66eeedb-5395-46ce-9526-9e22319a94d4
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: uwp
---

# Get Started with UWP

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

The Mobile Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up Mobile Center UWP SDK in your app to use Mobile Center Analytics.

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* Your project is set up in Visual Studio 2015 Update 3 or Visual Studio 2017.
* Your project references Universal Windows Platform [5.2.2](https://www.nuget.org/packages/Microsoft.NETCore.UniversalWindowsPlatform/5.2.2) or later

## 2. Create your app in the Mobile Center Portal to optain the App Secret

If you have already created your app in the Mobile Center portal, you can skip this step.

1. To learn how to get started with Push, read the [mobile.azure.com](https://mobile.azure.com) documentation.

2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.

3. Enter a name and an optional desciption for your app.

4. Select the appropriate OS and platform depending on your project as described above.

5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the Mobile Center Portal.

## 3. Add the Mobile Center SDK modules

The Mobile Center SDK can be integrated using Visual Studio, or the Package Manager Console.

### 3.1 Visual Studio

1. Navigate to the **Project -> Manage NuGet Packages...**

2. Search for **Mobile Center**, and select **Mobile Center Analytics**. Then Click **Add Packages**.

### 3.2 Package Manager Console

* Type the following commands:

   `PM> Install-Package Microsoft.Azure.Mobile.Analytics`

Now that you've integrated the SDK in your application, it's time to start the SDK and make use of the Mobile Center services.

## 4. Start the SDK

Note that, this documentation is only for Non-Xamarin UWP. If you want to use Xamarin.Forms for UWP, please follow Xamarin [Get started](~/sdk/getting-started/xamarin.md) documentation.

In order to use Mobile Center, you need to opt in to the services that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

### 4.1 Add the using statements

Add the appropriate namespaces before you get started with using our APIs.

```csharp
using Microsoft.Azure.Mobile;
using Microsoft.Azure.Mobile.Analytics;
```

### 4.2 Add the `Start()` method

Open your application's constructor and add the `Start()` call:

```csharp
MobileCenter.Start("{Your App Secret}", typeof(Analytics));
```

### 4.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page on the Mobile Center portal or through the **Manage App** button.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

The example above shows how to use the `Start()` method and includes Mobile Center Analytics.

Note that, unless you explicitly specify each service as parameters in the start method, you can't use that Mobile Center service. In addition, the `Start()` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the services included in the first call will be available.

Great, you are all set to visualize Analytics on the portal that the SDK collects automatically.

Look at the documentation for [Mobile Center Analytics](~/sdk/analytics/uwp.md) to learn how to customize and use more advanced functionalities.

