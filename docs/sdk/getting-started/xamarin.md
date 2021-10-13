---
title: Get Started with Xamarin
description: Get Started with Xamarin
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 10/06/2021
ms.topic: article
ms.assetid: 466c0195-c2c7-491b-83dc-2ec03dd9ab18
ms.tgt_pltfrm: xamarin
---

# Get Started with Xamarin

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [iOS Extensions](ios-extensions.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [macOS Extensions](macos-extensions.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center Xamarin SDK in your app to use App Center Analytics and App Center Crashes. To add App Center Distribute to you app, have a look at the [documentation for App Center Distribute](~/sdk/distribute/xamarin.md).

## 1. Prerequisites

Before you begin, make sure that the following prerequisites are met:

* Your project is set up in Visual Studio 2017 or Visual Studio for Mac.
* You're targeting devices running iOS 9.0 or later or Android 5.0 (API level 21) or later.
* You're not using any other SDK that provides Crash Reporting functionality.

The App Center SDK for Xamarin supports the following platforms:

* Xamarin.Android
* Xamarin.iOS
* Xamarin.Forms (iOS, Android, UWP and Windows Desktop applications)

### 1.1 About Xamarin.Android

Choose this option if you target only Android platform. You need to create one app in the App Center portal with the **Android** as the OS and **Xamarin** as the platform.

### 1.2 About Xamarin.iOS

Choose this option if you target only iOS platform. You need to create one app in the App Center portal with **iOS** as the OS and **Xamarin** as the platform.

### 1.3 About Xamarin.Forms (iOS, Android, UWP and Windows Desktop)

Choose this option if you want to create a cross platform app for iOS, Android, UWP and Windows Desktop devices. You need to create 4 apps in App Center – one for each OS.

You need to select **Xamarin** as the platform for Android and iOS applications (UWP doesn't have a Xamarin option).

For the **Windows Desktop** applications you have to configure your project for compatibility with the **Xamarin** platform. 

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
> App Center SDK uses [strong-named assemblies](https://docs.microsoft.com/dotnet/standard/assembly/strong-named) for compatibility with applications that use strong-named sign.

### Visual Studio for Mac

* Open Visual Studio for Mac.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click the **Packages** section, and choose **Add NuGet packages...**.
* Search for **App Center**, and select **App Center Analytics** and **App Center Crashes**.
* Click **Add Packages**.

### Visual Studio for Windows

* Open Visual Studio for Windows.
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

Add the appropriate namespaces before you get started with using our APIs.

* **Xamarin.iOS** - Open the project's `AppDelegate.cs` and add the following lines below the existing `using` statements
* **Xamarin.Android** - Open the project's `MainActivity.cs` and add the following lines below the existing `using` statements
* **Xamarin.Forms** - Open the project's `App.xaml.cs` and add the following lines below the existing `using` statements

```csharp
using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;
```

### 4.2 Add the `Start()` method

#### 4.2.1 Xamarin.Android

> [!NOTE]
> In case you're using the HockeyApp SDK for Android, make sure to initialize the HockeyApp SDK **AFTER** the App Center SDK.

Open the project's **MainActivity.cs** file and add the `Start()` call inside the `OnCreate()` method

```csharp
AppCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Crashes));
```

> [!NOTE]
> If your application has background services or multiple entry points like a broadcast receiver, exported activities or content providers, it's recommended to start `AppCenter` in the `Application.OnCreate` callback instead. If this remark applies to your application and you don't already have the callback, look at [this Application.OnCreate code sample](https://forums.xamarin.com/discussion/comment/7243/#Comment_7243).

#### 4.2.2 Xamarin.iOS

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

##### 4.2.3 Xamarin.Forms

To use a Xamarin.Forms application targeting iOS, Android and UWP platforms, you need to create three applications in the App Center portal - one for each platform. Creating three apps will give you three App secrets - one for each. Open the project's **App.xaml.cs** file (or your class that inherits from `Xamarin.Forms.Application`) in your shared or portable project and add the method below in the `OnStart()` method.

```csharp
AppCenter.Start("ios={Your App Secret};android={Your App Secret};uwp={Your App Secret};windowsdesktop={Your App Secret}", typeof(Analytics), typeof(Crashes));
```

If you need to start App Center services separately, you should:

1. Configure or start it with the App Secret.
1. If the code can be called multiple times, check if the App Center is already configured.
1. Start the required service(s) without the App Secret.

```csharp
AppCenter.Configure("ios={Your App Secret};android={Your App Secret};uwp={Your App Secret};windowsdesktop={Your App Secret}");
if (AppCenter.Configured)
{
    AppCenter.Start(typeof(Analytics));
    AppCenter.Start(typeof(Crashes));
}
```

> [!IMPORTANT]
> The curly braces show where to place the actual app secrets, don't put curly braces in the `Start` call.
> 
> [!NOTE]
> In case you're using the HockeyApp SDK for Android, make sure to initialize the HockeyApp SDK **AFTER** the App Center SDK. For your iOS application, it isn't possible to have more than one active crash reporting SDK in your app. Disable the other SDKs' crash reporting functionality to make sure App Center can catch the crashes.

> [!NOTE]
> The notes from both the previous sections about iOS and Android apply to Xamarin.Forms as well. If those remarks apply to your application, you might need to initialize AppCenter in different places per platform.

### 4.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can copy-paste the whole sample.

The example above shows how to use the `Start()` method and include both App Center Analytics and App Center Crashes.

If you don't want to use one of the two services, remove the corresponding parameter from the method call above.

Unless you explicitly specify each module as parameters in the start method, you can't use that App Center service. In addition, the `start()` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you want to onboard to App Center Analytics, you should modify the `Start()` call as follows:

#### 4.3.1 Xamarin.Android and Xamarin.iOS

```csharp
AppCenter.Start("{Your App Secret}", typeof(Analytics));
```

#### 4.3.2 Xamarin.Forms

```csharp
AppCenter.Start("ios={Your App Secret};android={Your App Secret};uwp={Your App Secret};windowsdesktop={Your App Secret}", typeof(Analytics));
```

---

Great, you're all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [App Center Analytics](~/sdk/analytics/xamarin.md) and [App Center Crashes](~/sdk/crashes/xamarin.md) to learn how to customize and use more advanced functionalities of both services.

To learn how to get started with in-app updates, read the documentation of [App Center Distribute](~/sdk/distribute/xamarin.md).

> [!NOTE]
> Using the portable APIs from Xamarin Forms, you'll see APIs from all modules, however not all those APIs are supported on the **UWP** and **Windows Desktop** platforms and are doing nothing when running on your **UWP** and **Windows Desktop** applications. In particular UWP and Windows Desktop doesn't support the following module: **Distribute**. Any method with a return type would return either `null` (for objects), `0` (for numbers), or `false` (for booleans) on UWP and Windows Desktop application.

## 5. Backup rules (Android only)

If you use auto-backup to avoid getting incorrect information about devices, follow the next steps:

> [!NOTE]
> Apps that target Android 6.0 (API level 23) or higher have Auto Backup automatically enabled. 

> [!NOTE]
> If you already have a custom file with backup rules, switch to the third step.

1. Create **appcenter_backup_rule.xml** file in the **Resources/xml** folder.

2.1 For Android 11 (API level 30) or lower open the project’s **AndroidManifest.xml** file. Add the `android:fullBackupContent` attribute to the `<application>` element. It should point to the **appcenter_backup_rule.xml** resource file.

```text
android:fullBackupContent="@xml/appcenter_backup_rule"
```

2.2 For Android 12 (API level 31) or higher open the project’s **AndroidManifest.xml** file. Add the `android:dataExtractionRules` attribute to the `<application>` element. It should point to the **appcenter_backup_rule.xml** resource file.

```text
android:dataExtractionRules="@xml/appcenter_backup_rule"
```

3.1 Add the following backup rules to the **appcenter_backup_rule.xml** file for Android 11 (API level 30) or lower:

```xml
<full-backup-content xmlns:tools="http://schemas.android.com/tools">
    <exclude domain="sharedpref" path="AppCenter.xml"/>
    <exclude domain="database" path="com.microsoft.appcenter.persistence"/>
    <exclude domain="database" path="com.microsoft.appcenter.persistence-journal"/>
    <exclude domain="file" path="error" tools:ignore="FullBackupContent"/>
    <exclude domain="file" path="appcenter" tools:ignore="FullBackupContent"/>
</full-backup-content>
```
3.2 Add the following backup rules to the **appcenter_backup_rule.xml** file for Android 12 (API level 31) or higher:

```xml
<data-extraction-rules xmlns:tools="http://schemas.android.com/tools">
    <cloud-backup>
        <exclude domain="sharedpref" path="AppCenter.xml"/>
        <exclude domain="database" path="com.microsoft.appcenter.persistence"/>
        <exclude domain="database" path="com.microsoft.appcenter.persistence-journal"/>
        <exclude domain="file" path="error" tools:ignore="FullBackupContent"/>
        <exclude domain="file" path="appcenter" tools:ignore="FullBackupContent"/>
    </cloud-backup>
    <device-transfer>
        <exclude domain="sharedpref" path="AppCenter.xml"/>
        <exclude domain="database" path="com.microsoft.appcenter.persistence"/>
        <exclude domain="database" path="com.microsoft.appcenter.persistence-journal"/>
        <exclude domain="file" path="error" tools:ignore="FullBackupContent"/>
        <exclude domain="file" path="appcenter" tools:ignore="FullBackupContent"/>
    </device-transfer>
</data-extraction-rules>
```
