---
title: Get Started with Xamarin
description: Get Started with Xamarin
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 11/24/2022
ms.topic: article
ms.assetid: 466c0195-c2c7-491b-83dc-2ec03dd9ab18
ms.tgt_pltfrm: xamarin
---

# Get Started with MAUI and Xamarin

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [iOS Extensions](ios-extensions.md)
> * [React Native](react-native.md)
> * [MAUI/Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [macOS Extensions](macos-extensions.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center .NET SDK in your app to use App Center Analytics and App Center Crashes. To add App Center Distribute to your app, have a look at the [documentation for App Center Distribute](~/sdk/distribute/xamarin.md).

## 1. Prerequisites

Before you begin, make sure that the following prerequisites are met:

* Your project is set up in Visual Studio or Visual Studio for Mac.
* You're targeting devices running iOS 11.0 or later or Android 5.0 (API level 21) or later.
* You're not using any other SDK that provides Crash Reporting functionality.

Supporting platforms:

* MAUI iOS
* MAUI Android
* MAUI Windows
* .NET 6.0 macOS
* Xamarin.Android
* Xamarin.iOS
* Xamarin.Mac
* Xamarin.Forms (iOS, macOS Android, UWP and Windows Desktop applications)

### 1.1 MAUI

> [!NOTE]
> Currently there is no **MAUI** platform on the App Center portal. Please use **Xamarin** for iOS and Android and **UWP** for Windows.


### 1.2 About Xamarin.Android

Create an app on the App Center portal with the **Android** as the OS and **Xamarin** as the platform.

### 1.3 About Xamarin.iOS

Create an app on the App Center portal with **iOS** as the OS and **Xamarin** as the platform.

### 1.4 About Xamarin.Mac

Create an app on the App Center portal with **macOS** as the OS and **Xamarin** as the platform.

> [!WARNING]
> There is a known issue that prevents an app from being uploaded to the App Store.
> Follow the progress on [github](https://github.com/microsoft/appcenter-sdk-dotnet/issues/1620).

### 1.5 About Xamarin.Forms (iOS, macOS, Android, UWP and Windows Desktop)

Create 5 apps on the App Center – one for each OS.

You need to select **Xamarin** as the platform for Android, iOS and macOS applications (UWP and Desktop applications doesn't have a Xamarin option).

For the **Windows Desktop** and **macOS** applications you have to configure your project for compatibility with the **Xamarin.Forms** platform. 

## 2. Create your app in the App Center Portal to obtain the App Secret

If you've already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select the appropriate OS and platform depending on your project as described above.
5. Hit the button at the bottom right that says **Add new app**.

Once you've created an app, you can obtain its **App Secret** on the **Settings** page on the App Center Portal. At the top right hand corner of the **Settings** page, click on the **triple vertical dots** and select `Copy app secret` to get your App Secret.

## 3. Add the App Center SDK to your solution

The App Center SDK can be integrated using Visual Studio or the Package Manager Console.

> [!NOTE]
> App Center SDK uses [strong-named assemblies](/dotnet/standard/assembly/strong-named) for compatibility with applications that use strong-named sign.

### Visual Studio for Mac

* Open Visual Studio.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click the **Packages** section, and choose **Add NuGet packages...**.
* Search for **App Center**, and select **App Center Analytics** and **App Center Crashes**.
* Click **Add Packages**.

### Visual Studio for Windows

* Open Visual Studio.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click **References** and choose **Manage NuGet Packages**.
* Search for **App Center**, and install **Microsoft.AppCenter.Analytics** and **Microsoft.AppCenter.Crashes** packages.

### Package Manager Console

* Open the console in [Visual Studio](https://visualstudio.microsoft.com/vs/). To do this, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.
* If you're working in **Visual Studio for Mac**, make sure you've installed **NuGet Package Management Extensions**. For this, choose **Visual Studio** > **Extensions**, search for **NuGet** and install, if necessary.
* Type the following command in the console:

```shell
Install-Package Microsoft.AppCenter.Analytics
Install-Package Microsoft.AppCenter.Crashes
```

Now that you've integrated the SDK in your application, it's time to start the SDK and make use of the App Center services.

> [!NOTE]
> If you use the App Center SDK in a portable project (such as **Xamarin.Forms**), you must install the packages in each of the projects: the portable, Android, and iOS ones. To do that, you should open each sub-project and follow the corresponding steps described in [Visual Studio for Mac](#visual-studio-for-mac) or [Visual Studio for Windows](#visual-studio-for-windows) sections.

## 4. Start the SDK

To use App Center, you must opt in to the module(s) that you want to use. By default, no modules are started and you must explicitly call each of them when starting the SDK.

### 4.1 Add the using statements

Add the appropriate namespaces in the following files:

* **MAUI** and **Xamarin.Forms** - `App.xaml.cs`
* **Xamarin.iOS** and **Xamarin.Mac**  - `AppDelegate.cs`
* **Xamarin.Android** - `MainActivity.cs`

```csharp
using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;
```

### 4.2 Add the `Start()` method

### 4.2.1 MAUI and Xamarin.Forms

You need to create different applications for each platform on the App Center portal. For each app you will have a different app secret. Open the project's **App.xaml.cs** file and add the following line in the constructor (or in the `OnStart()` method for Xamarin.Forms).

```csharp
AppCenter.Start("ios={Your App Secret};macos={Your App Secret};android={Your App Secret};uwp={Your App Secret};windowsdesktop={Your App Secret}", typeof(Analytics), typeof(Crashes));
```

If you need to start App Center services separately, you should:

1. Configure or start it with the App Secret.
1. If the code can be called multiple times, check if the App Center is already configured.
1. Start the required service(s) without the App Secret.

```csharp
AppCenter.Configure("ios={Your App Secret};macos={Your App Secret};android={Your App Secret};uwp={Your App Secret};windowsdesktop={Your App Secret}");
if (AppCenter.Configured)
{
    AppCenter.Start(typeof(Analytics));
    AppCenter.Start(typeof(Crashes));
}
```

#### 4.2.2 Xamarin.Android

> [!NOTE]
> In case you're using the HockeyApp SDK for Android, make sure to initialize the HockeyApp SDK **AFTER** the App Center SDK.

Open the project's **MainActivity.cs** file and add the `Start()` call inside the `OnCreate()` method

```csharp
AppCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Crashes));
```

> [!NOTE]
> If your application has background services or multiple entry points like a broadcast receiver, exported activities or content providers, it's recommended to start `AppCenter` in the `Application.OnCreate` callback instead.

#### 4.2.3 Xamarin.iOS and Xamarin.Mac

> [!NOTE]
> It isn't possible to have more than one active crash reporting SDK in your app. Disable the other SDKs' crash reporting functionality to make sure App Center can catch the crashes.

Open the project's `AppDelegate.cs` file and add the `Start()` call inside the `FinishedLaunching()` method

```csharp
AppCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Crashes));
```

> [!NOTE]
> If using Crashes, you must call this method in the UI/main thread and avoid starting background tasks until the `Start` method returns.
> The reason is that any null reference exception caught from another thread while Crashes is initializing may trigger a native crash and ignore the catch clause.
> Once the `AppCenter.Start` method returns, it's safe to try/catch null reference exceptions again.
> You can read more about the cause of this timing issue in the [Signals and third-party crash reporters](https://www.mono-project.com/docs/advanced/signals/) article.


[!INCLUDE [app secret warning](../includes/app-secret-warning.md)]

> [!IMPORTANT]
> The curly braces show where to place the actual app secrets, don't put curly braces in the `Start` call.
> 
> [!NOTE]
> For an iOS application, it isn't possible to have more than one active crash reporting SDK in your app. Disable the other SDKs' crash reporting functionality to make sure App Center can catch the crashes.

### 4.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can copy-paste the whole sample.

The example above shows how to use the `Start()` method and include both App Center Analytics and App Center Crashes.

If you don't want to use one of the two services, remove the corresponding parameter from the method call above.

Unless you explicitly specify each module as parameters in the start method, you can't use that App Center service. In addition, the `Start()` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you want to onboard to App Center Analytics, you should modify the `Start()` call as follows:

#### 4.3.1 MAUI and Xamarin.Forms

```csharp
AppCenter.Start("ios={Your App Secret};macos={Your App Secret};android={Your App Secret};uwp={Your App Secret};windowsdesktop={Your App Secret}", typeof(Analytics));
```

#### 4.3.2 Xamarin Native

```csharp
AppCenter.Start("{Your App Secret}", typeof(Analytics));
```

---

Great, you're all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [App Center Analytics](~/sdk/analytics/xamarin.md) and [App Center Crashes](~/sdk/crashes/xamarin.md) to learn how to customize and use more advanced functionalities of both services.

To learn how to get started with in-app updates, read the documentation of [App Center Distribute](~/sdk/distribute/xamarin.md).

> [!NOTE]
> Using the portable APIs from Xamarin Forms, you'll see APIs from all modules, however not all those APIs are supported on the **UWP** and **Windows Desktop** platforms and are doing nothing when running on your **UWP** and **Windows Desktop** applications. In particular UWP and Windows Desktop doesn't support the following module: **Distribute**. Any method with a return type would return either `null` (for objects), `0` (for numbers), or `false` (for booleans) on UWP and Windows Desktop application.

## 5. Backup rules (Android only)

> [!NOTE]
> Apps that target Android 6.0 (API level 23) or higher have Auto Backup automatically enabled. 

> [!NOTE]
> If you already have a custom file with backup rules, switch to the third step.

If you use auto-backup to avoid getting incorrect information about devices, follow the next steps:

### 5.1. For Android 11 (API level 30) or lower.

1. Create **appcenter_backup_rule.xml** file in the **Resources/xml** folder.

[!INCLUDE [android backup rules](includes/android-backup-rules-android.md)]

### 5.2. For Android 12 (API level 31) or higher.

1. Create **appcenter_backup_rule.xml** file in the **Resources/xml** folder.

[!INCLUDE [android backup rules](includes/android-backup-rules-android-12.md)]
