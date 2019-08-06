---
title: HockeySDK for UWP Migration
description: Migrate from the HockeySDK to App Center SDK for UWP
author: elamalani
ms.author: emalani
ms.date: 08/06/2019
ms.topic: article
ms.assetid: f64881e5-b999-4f13-93a5-5caa6eb6ac41
ms.service: vs-appcenter
ms.tgt_pltfrm: uwp
---

# Migrate from the HockeySDK to App Center UWP

[!include[](sdk-migration-dropdown.md)]

## 1. Update the libraries

> [!NOTE] 
> Platforms like WinRT, Windows Phone 8.0 and 8.1, WPF and PCL are not supported in App Center SDK. Please continue to use the HockeySDK with them.

Replace HockeySDK.UWP NuGet package with the App Center ones in all projects in your solution.

### Visual Studio for Windows

* Open Visual Studio for Windows.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click **References** and choose **Manage NuGet Packages**.
* Remove the **HockeySDK.UWP** package.
* Search for **App Center**, and install **Microsoft.AppCenter.Analytics**, and **Microsoft.AppCenter.Crashes** packages.

### Package Manager Console

* Open the console in [Visual Studio](https://visualstudio.microsoft.com/vs/). To do this, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.
* If you're working in **Visual Studio for Mac**, make sure you have **NuGet Package Management Extensions** installed. For this, choose **Visual Studio** > **Extensions**, search for **NuGet** and install, if necessary.
* Type the following command in the console:

```shell
Uninstall-Package HockeySDK.UWP
Install-Package Microsoft.AppCenter.Analytics
Install-Package Microsoft.AppCenter.Crashes
```

The App Center SDK uses a modular approach – you can integrate only those services that you're interested in. You must add each SDK module as a separate dependency in this section.

## 2. Update the SDK setup code

### 2.1 Convert the application identifier

The App Center SDK uses application identifiers in the globally unique identifier (GUID) format. Your HockeyApp App ID can be used by App Center but you need to convert it to a different format. To convert the identifier you must add four hyphens to get `8-4-4-4-12` representation.

Before (HockeyApp):  

`00112233445566778899aabbccddeeff`

After (App Center):  

`00112233-4455-6677-8899-aabbccddeeff`

### 2.2 Replace SDK initialization in the application code

1. Remove the old HockeyApp registration code.

    In the `using` statement declaration, remove the following line:

    ```csharp
    using Microsoft.HockeyApp;
    ```

    In the beginning of the App class constructor, remove the following line:

    ```csharp
    HockeyClient.Current.Configure("Your_App_ID");
    ```

2. Start the App Center SDK

    Add the appropriate namespaces before you use our APIs.

    ```csharp
    using Microsoft.AppCenter;
    using Microsoft.AppCenter.Analytics;
    using Microsoft.AppCenter.Crashes;
    ```
    
    Add the following call to your application's constructor:

    ```csharp
    AppCenter.Start("{Your App Secret}",  typeof(Analytics), typeof(Crashes));
    ```

## 3. Services and feature comparison

### Core

Feature | HockeyApp | App Center
------- | --------- | ---
Adjust the log level | [Documentation](https://support.hockeyapp.net/kb/client-integration-windows-and-windows-phone/hockeyapp-for-applications-on-windows#4-1-enable-diagnostics-) | [AppCenter.LogLevel](~/sdk/other-apis/uwp.md#adjust-the-log-level)

### Analytics

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically track sessions | [Documentation](https://support.hockeyapp.net/kb/client-integration-windows-and-windows-phone/hockeyapp-for-applications-on-windows#3-3-user-tracking) | [Documentation](~/sdk/analytics/uwp.md#session-and-device-information)
Custom events with properties | [HockeyClient.TrackEvent](https://support.hockeyapp.net/kb/client-integration-windows-and-windows-phone/hockeyapp-for-applications-on-windows#3-6-event-tracking) | [Analytics.TrackEvent](~/sdk/analytics/uwp.md#custom-events)

### Crashes

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically send crashes | [Documentation (enabled by default)](https://support.hockeyapp.net/kb/client-integration-windows-and-windows-phone/hockeyapp-for-applications-on-windows#3-1-crash-reporting) | [Documentation](~/sdk/crashes/uwp.md)
Attach additional meta data | [Documentation](https://support.hockeyapp.net/kb/client-integration-windows-and-windows-phone/how-to-instrument-applications-on-windows-for-crash-reporting#2-2-collectors-api) | Not supported
Track handled exceptions | `HockeyClient.Current.TrackException` | Not supported

### Distribution

App Center SDK doesn't support distribution for UWP apps yet.

### Feedback

This service wont be supported in App Center.

## 4. Contact us

If you have any questions or feedback related to the SDK migration, please contact us via support by clicking on the blue chat icon in the lower-right corner of every App Center page.
