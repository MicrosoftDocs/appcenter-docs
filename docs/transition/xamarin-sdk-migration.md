---
title: HockeySDK for Xamarin Migration
description: Migrate from the HockeySDK to App Center Xamarin SDK
author: elamalani
ms.author: emalani
ms.date: 02/12/2019
ms.topic: article
ms.assetid: 7d805e37-cc78-4930-af3f-b0d9b57dceea
ms.service: vs-appcenter
ms.tgt_pltfrm: xamarin
---

# Migrate from the HockeySDK to App Center Xamarin SDK

[!include[](sdk-migration-dropdown.md)]

## 1. Update the libraries

Replace **HockeySDK.Xamarin** NuGet package with App Center ones in all projects in your solution.

### Visual Studio for Mac

* Under your project, select **Packages**, open context menu on **HockeySDK.Xamarin** package and click the **Remove** option.
* Open context menu on **Packages** and click the **Add packages** option.
* Search for **App Center** and select **App Center Analytics**, **App Center Crashes**, and **App Center Distribute**.
* Click **Add Packages**.

### Visual Studio on Windows

* Navigate to the **Project > Manage NuGet Packages...**
* Remove the installed **HockeySDK.Xamarin** package.
* Search for **App Center**, then install **Microsoft.AppCenter.Analytics**, **Microsoft.AppCenter.Crashes**, and **Microsoft.AppCenter.Distribute** packages.

### Package Manager Console

Type the following commands:

```Text
PM> Uninstall-Package HockeySDK.Xamarin
PM> Install-Package Microsoft.AppCenter.Analytics
PM> Install-Package Microsoft.AppCenter.Crashes
PM> Install-Package Microsoft.AppCenter.Distribute
```

Please note that the App Center SDK is designed with a modular approach – you can integrate only those services that you're interested in. Each SDK module needs to be added as a separate dependency in this section. See the equivalences in the next table:

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

    * **Xamarin.Android** - Open your **MainActivity.cs** and remove the lines below:

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

    * **Xamarin.iOS** - Open your **AppDelegate.cs** and remove the lines below:

        ```csharp
        using HockeyApp.iOS;

        ...

        var manager = BITHockeyManager.SharedHockeyManager;
        manager.Configure("APP_IDENTIFIER");
        manager.StartManager();
        manager.Authenticator.AuthenticateInstallation();
        ```

1. Start the App Center SDK

    * **Xamarin.iOS** - Open your project's **AppDelegate.cs** file and add the lines below the existing `using` statements
    * **Xamarin.Android** - Open your project's **MainActivity.cs** file and add the lines below the existing `using` statements
    * **Xamarin.Forms** - You can initialize the App Center SDK only in one place. Open the **App.xaml.cs** file in your shared project and add the following `using` statements:

    ```csharp
    using Microsoft.AppCenter;
    using Microsoft.AppCenter.Analytics;
    using Microsoft.AppCenter.Crashes;
    using Microsoft.AppCenter.Distribute;
    ```

    **Xamarin.Android** and **Xamarin.iOS**:

    ```csharp
    AppCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute));
    ```

    **Xamarin.Forms**:

    ```csharp
    AppCenter.Start("ios={Your App Secret};android={Your App Secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute));
    ```

1. [For distribute iOS only] Modify the project's **Info.plist** file

    * Add a new key for `URL types` or `CFBundleURLTypes` in your **Info.plist** file (in case Xcode displays your Info.plist as source code).
    * Change the key of the first child item to `URL Schemes` or `CFBundleURLSchemes`.
    * Enter `appcenter-${Your App Secret}` as the URL scheme and replace `${Your App Secret}` with the App Secret of your app.

    For more information on this, refer to [App Center Distribute documentation](https://docs.microsoft.com/en-us/appcenter/sdk/distribute/ios#23-modify-your-infoplist).

1. Replace all HockeyApp API calls throughout the application. The detailed API mapping tables are given below.

## 3. Services and feature comparison

### Core

Feature | HockeyApp | App Center
------- | --------- | ---
Adjust the log level | [SharedHockeyManager.LogLevel (iOS) or HockeyLog.LogLevel (Android)](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#3-3-control-output-to-the-console-or-logcat) | [AppCenter.LogLevel](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/xamarin#adjust-the-log-level)
Identify installations | iOS only | [AppCenter.GetInstallIdAsync](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/xamarin#identify-installations)
Identify users | Crash only | [AppCenter.SetUserId](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/xamarin#identify-users)

### Analytics

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically track sessions | Yes, can be disabled only on Android | [Documentation (cannot be disabled)](https://docs.microsoft.com/en-us/appcenter/sdk/analytics/xamarin#session-and-device-information)
Custom events with properties | [HockeyApp.MetricsManager.TrackEvent](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#2-5-add-custom-events) | [Analytics.TrackEvent](https://docs.microsoft.com/en-us/appcenter/sdk/analytics/xamarin#custom-events)
Disable service at runtime | `MetricsManager.DisableUserMetrics` (Android) or [SharedHockeyManager.DisableMetricsManager (iOS)](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#for-ios_1) | [Analytics.SetEnabledAsync](https://docs.microsoft.com/en-us/appcenter/sdk/analytics/xamarin#enable-or-disable-app-center-analytics-at-runtime)

### Crashes

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically send crashes | Disabled by default | [Documentation (enabled by default)](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/xamarin#should-the-crash-be-processed)
Generate a test crash | `CrashManager.GenerateTestCrash` (iOS Only) | [Crashes.GenerateTestCrash](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/xamarin#generate-a-test-crash)
Attach additional meta data | Yes | [Documentation (can be attached from listener)](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/xamarin#add-attachments-to-a-crash-report)
Customize user dialog | Yes | [Documentation (not provided by default)](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/xamarin#ask-for-the-users-consent-to-send-a-crash-log)
Get info about the sending status | Android only | [Documentation](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/xamarin#get-information-about-the-sending-status-for-a-crash-log)
Info about a previous crash | `CrashManager.GetLastCrashDetails` (Android) or `CrashManager.LastSessionCrashDetails` (iOS) | [Crashes.GetLastSessionCrashReportAsync](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/xamarin#details-about-the-last-crash)
Disable service at runtime | `SharedHockeyManager.DisableCrashManager` (iOS only) | [Crashes.SetEnabledAsync](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/xamarin#enable-or-disable-app-center-crashes-at-runtime)

### Distribute

Feature | HockeyApp | App Center
------- | --------- | ---
Restricted in-app updates | [LoginManager.VerifyLogin (Android) or Authenticator.AuthenticateInstallation (iOS)](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#2-8-add-authentication) | [Documentation (works out of the box)](https://docs.microsoft.com/en-us/appcenter/sdk/distribute/xamarin#how-do-in-app-updates-work)
Disable service at runtime | [UpdateManager.Unregister (Android) or SharedHockeyManager.DisableUpdateManager (iOS)](https://support.hockeyapp.net/kb/client-integration-cross-platform/how-to-integrate-hockeyapp-with-xamarin#2-6-add-update-distribution) | [Distribute.SetEnabledAsync](https://docs.microsoft.com/en-us/appcenter/sdk/distribute/xamarin#enable-or-disable-app-center-distribute-at-runtime)
Customize the update dialog | Yes | [Distribute.ReleaseAvailable](https://docs.microsoft.com/en-us/appcenter/sdk/distribute/xamarin#customize-or-localize-the-in-app-update-dialog)

### Feedback

This service wont be supported in App Center.

## 4. Contact us

In case you have any questions or feedback related to the SDK migration, please contact us via support by clicking on the blue icon in App Center portal or leaving us a note in the docs itself.
