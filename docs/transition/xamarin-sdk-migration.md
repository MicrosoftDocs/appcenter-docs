---
title: HockeySDK for Xamarin Migration
description: Migrate from the HockeySDK to App Center Xamarin SDK
author: king-of-spades
ms.author: kegr
ms.date: 03/30/2020
ms.topic: article
ms.assetid: 7d805e37-cc78-4930-af3f-b0d9b57dceea
ms.service: vs-appcenter
ms.tgt_pltfrm: xamarin
---

# Migrate from the HockeySDK to App Center Xamarin SDK

[!INCLUDE [sdk migration dropdown](includes/sdk-migration-dropdown.md)]

## 1. Update the libraries

Replace **HockeySDK.Xamarin** NuGet package with App Center ones in all projects in your solution.

### Visual Studio for Mac

* Open Visual Studio for Mac.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right click the **Packages** section, and choose **Add NuGet packages...**.
* Remove the **HockeySDK.Xamarin** package.
* Search for **App Center**, and select **App Center Analytics**, **App Center Crashes**, and **App Center Distribute**.
* Click **Add Packages**.

### Visual Studio for Windows

* Open Visual Studio for Windows.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click **References** and choose **Manage NuGet Packages**.
* Remove the **HockeySDK.Xamarin** package.
* Search for **App Center**, and install **Microsoft.AppCenter.Analytics**, **Microsoft.AppCenter.Crashes**, and **Microsoft.AppCenter.Distribute** packages.

### Package Manager Console

* Open the console in [Visual Studio](https://visualstudio.microsoft.com/vs/). To do this, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.
* If you're working in **Visual Studio for Mac**, make sure you have **NuGet Package Management Extensions** installed. For this, choose **Visual Studio** > **Extensions**, search for **NuGet** and install, if necessary.
* Type the following command in the console:

```shell
Uninstall-Package HockeySDK.Xamarin
Install-Package Microsoft.AppCenter.Analytics
Install-Package Microsoft.AppCenter.Crashes
Install-Package Microsoft.AppCenter.Distribute
```

Note that the App Center SDK is designed with a modular approach – you can integrate only those services that you're interested in. Each SDK module needs to be added as a separate dependency in this section. See the equivalences in the next table:

HockeyApp class  | App Center module
---------------- | -----------------
`MetricsManager` | `Analytics`
`CrashManager`   | `Crashes`
`UpdateManager`  | `Distribute`

## 2. Update the SDK setup code

### 2.1 Convert the application identifier

The App Center SDK uses application identifiers in the globally unique identifier (GUID) format. Your HockeyApp App ID can be used by App Center but you need to convert it to a different format. To convert the identifier you must add four hyphens to get 8-4-4-4-12 representation.

Before (HockeyApp):
`00112233445566778899aabbccddeeff`

After (App Center):
`00112233-4455-6677-8899-aabbccddeeff`

### 2.2 Replace SDK initialization in the application code

1. Remove old HockeyApp registration code.

    * **Xamarin.Android** - Open the project's **MainActivity.cs** and remove the lines below:

        ```csharp
        using HockeyApp.Android;

        ...

        CrashManager.Register(this, "APP_IDENTIFIER");
        MetricsManager.Register(Application, "APP_IDENTIFIER");
        UpdateManager.Register(this, "APP_IDENTIFIER");
        ```

        Remove the following assembly level attribute in **Properties/AssemblyInfo.cs**:

        ```csharp
        [assembly: MetaData ("net.hockeyapp.android.appIdentifier", Value="APP_IDENTIFIER")]
        ```

    * **Xamarin.iOS** - Open the project's **AppDelegate.cs** and remove the lines below:

        ```csharp
        using HockeyApp.iOS;

        ...

        var manager = BITHockeyManager.SharedHockeyManager;
        manager.Configure("APP_IDENTIFIER");
        manager.StartManager();
        manager.Authenticator.AuthenticateInstallation();
        ```

1. Start the App Center SDK

    * The initialization code mentioned later in this section requires adding the following lines below the existing `using` statements:

    ```csharp
    using Microsoft.AppCenter;
    using Microsoft.AppCenter.Analytics;
    using Microsoft.AppCenter.Crashes;
    using Microsoft.AppCenter.Distribute;
    ```

    **Xamarin.Android**:

    Open the project's **MainActivity.cs** file and add the `Start()` call inside the `OnCreate()` method

    ```csharp
    AppCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute));
    ```

    > [!NOTE]
    > If your application has background services or multiple entry points like a broadcast receiver, exported activities or content providers, it's recommended to start `AppCenter` in the `Application.OnCreate` callback instead. If this remark applies to your application and you don't already have the callback, look at [this Application.OnCreate code sample](https://forums.xamarin.com/discussion/comment/7243/#Comment_7243).

    **Xamarin.iOS**:
    
    Open the project's `AppDelegate.cs` file and add the `Start()` call inside the `FinishedLaunching()` method

    ```csharp
    AppCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute));
    ```

    > [!NOTE]
    > If using Crashes, you must call this method in the UI/main thread and avoid starting background tasks until the `Start` method returns.
    > The reason is that any null reference exception caught from another thread while Crashes is initializing may trigger a native crash and ignore the catch clause.
    > Once the `AppCenter.Start` method returns, it's safe to try/catch null reference exceptions again.
    > You can read more about the cause of this timing issue in the [Signals and third-party crash reporters](https://www.mono-project.com/docs/advanced/signals/) article.

    **Xamarin.Forms**:

    To use a Xamarin.Forms application targeting iOS, Android and UWP platforms, you need to create three applications in the App Center portal - one for each platform. Creating three apps will give you three App secrets - one for each. Open the project's **App.xaml.cs** file (or your class that inherits from `Xamarin.Forms.Application`) in your shared or portable project and add the method below in the `OnStart()` method.

    ```csharp
    AppCenter.Start("ios={Your App Secret};android={Your App Secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute));
    ```

    > [!IMPORTANT]
    > The curly braces is just to document you have to replace that content with the actual app secrets, don't put curly braces in the `Start` call.

    > [!NOTE]
    > In case you're using the HockeyApp SDK for Android, make sure to initialize the HockeyApp SDK **AFTER** the App Center SDK. For your iOS application, remember that it isn't possible to have more than one active crash reporting SDK in your app. Disable the other SDKs' crash reporting functionality to make sure App Center can catch the crashes.

    > [!NOTE]
    > The notes from both the previous sections about iOS and Android apply to Xamarin.Forms as well. If those remarks apply to your application, you might need to initialize AppCenter in different places per platform.

1. [For distribute iOS only] Modify the project's **Info.plist** file

    * Add a new key for `URL types` or `CFBundleURLTypes` in your **Info.plist** file (in case Xcode displays your Info.plist as source code).
    * Change the key of the first child item to `URL Schemes` or `CFBundleURLSchemes`.
    * Enter `appcenter-${Your App Secret}` as the URL scheme and replace `${Your App Secret}` with the App Secret of your app.

    For more information on this, refer to [App Center Distribute documentation](~/sdk/distribute/ios.md#23-modify-the-projects-infoplist).

1. Replace all HockeyApp API calls throughout the application. The detailed API mapping tables are given below.

## 3. Services and feature comparison

### Core

Feature | HockeyApp | App Center
------- | --------- | ---
Adjust the log level | [SharedHockeyManager.LogLevel (iOS) or HockeyLog.LogLevel (Android)](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#3-3-control-output-to-the-console-or-logcat) | [AppCenter.LogLevel](~/sdk/other-apis/xamarin.md#adjust-the-log-level)
Identify installations | iOS only | [AppCenter.GetInstallIdAsync](~/sdk/other-apis/xamarin.md#identify-installations)
Identify users | Crash only | [AppCenter.SetUserId](~/sdk/other-apis/xamarin.md#identify-users)

### Analytics

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically track sessions | Yes, can be disabled only on Android | [Documentation (can't be disabled)](~/sdk/analytics/xamarin.md#session-and-device-information)
Custom events with properties | [HockeyApp.MetricsManager.TrackEvent](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#2-5-add-custom-events) | [Analytics.TrackEvent](~/sdk/analytics/xamarin.md#custom-events)
Disable service at runtime | `MetricsManager.DisableUserMetrics` (Android) or [SharedHockeyManager.DisableMetricsManager (iOS)](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#for-ios_1) | [Analytics.SetEnabledAsync](~/sdk/analytics/xamarin.md#enable-or-disable-app-center-analytics-at-runtime)

### Crashes

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically send crashes | Disabled by default | [Documentation (enabled by default)](~/sdk/crashes/xamarin.md#should-the-crash-be-processed)
Generate a test crash | `CrashManager.GenerateTestCrash` (iOS Only) | [Crashes.GenerateTestCrash](~/sdk/crashes/xamarin.md#generate-a-test-crash)
Attach additional meta data | Yes | [Documentation (can be attached from listener)](~/sdk/crashes/xamarin.md#add-attachments-to-a-crash-report)
Customize user dialog | Yes | [Documentation (not provided by default)](~/sdk/crashes/xamarin.md#ask-for-the-users-consent-to-send-a-crash-log)
Get info about the sending status | Android only | [Documentation](~/sdk/crashes/xamarin.md#get-information-about-the-sending-status-for-a-crash-log)
Info about a previous crash | `CrashManager.GetLastCrashDetails` (Android) or `CrashManager.LastSessionCrashDetails` (iOS) | [Crashes.GetLastSessionCrashReportAsync](~/sdk/crashes/xamarin.md#details-about-the-last-crash)
Disable service at runtime | `SharedHockeyManager.DisableCrashManager` (iOS only) | [Crashes.SetEnabledAsync](~/sdk/crashes/xamarin.md#enable-or-disable-app-center-crashes-at-runtime)

### Distribute

> [!NOTE]
> Unlike in HockeyApp, App Center in-app updates feature only works with **RELEASE** builds (by default) that are distributed using the **App Center Distribute** service.
If the app is using a private distribution group, once the app is installed and opened for the first time after the App Center Distribute SDK has been added, a browser will open to authenticate the user and enable in-app updates. This browser will also open if you set the private in-app update track at runtime. This is a ONE-TIME step that won't occur for subsequent releases of your app. Refer to the [App Center Distribute Documentation](~/sdk/distribute/xamarin.md#how-do-in-app-updates-work) for more details.

Feature | HockeyApp | App Center
------- | --------- | ---
Restricted in-app updates | [LoginManager.VerifyLogin (Android) or Authenticator.AuthenticateInstallation (iOS)](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#2-8-add-authentication) | [Distribute.UpdateTrack](~/sdk/distribute/xamarin.md#use-private-distribution-group)
Disable service at runtime | [UpdateManager.Unregister (Android) or SharedHockeyManager.DisableUpdateManager (iOS)](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#2-6-add-update-distribution) | [Distribute.SetEnabledAsync](~/sdk/distribute/xamarin.md#enable-or-disable-app-center-distribute-at-runtime)
Customize the update dialog | Yes | [Distribute.ReleaseAvailable](~/sdk/distribute/xamarin.md#customize-or-localize-the-in-app-update-dialog)

### Feedback Service
The feedback service won't be supported in App Center. See [HockeyApp feedback](feedback.md).
