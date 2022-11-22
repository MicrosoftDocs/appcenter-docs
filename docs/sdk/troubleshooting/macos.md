---
title: macOS SDK Troubleshooting
description: Troubleshooting the App Center SDK for macOS
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 10/22/2020
ms.topic: article
ms.assetid: 170bfa7a-55de-11e7-907b-a6006ad3dba0
dev_langs:  
 - swift
 - objc
---

# macOS SDK Troubleshooting

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [macOS](macos.md)
> * [tvOS](tvOS.md)
> * [React Native](react-native.md)
> * [Cordova](cordova.md)
> * [Unity](unity.md)
> * [Windows](uwp.md)
> * [Xamarin/MAUI](xamarin.md)

## Issues during setup

1. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This verifies that the SDK is configured successfully.
2. If you're using **Cocoapods** to integrate App Center in your macOS app and run into an error with the message - `CocoaPods - Unable to find a specification for AppCenter`, run `pod repo update` to update your local Cocoapods repository and then run `pod install` again.
3. If you're integrating the SDK binaries manually, make sure your modules are enabled for your project.

## Analytics data doesn't show up in the portal.

1. Make sure you've integrated the SDK modules correctly.
2. Make sure the correct App Secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:`-code by opening the app in the portal and navigating to **Getting Started** page.
3. If you want to see the logs sent to the backend, change the log level to **Verbose** in your application and the SDK will print the logs in the **Console**. Insert the following call before the SDK start:

    ```objc
    [MSACAppCenter setLogLevel:MSACLogLevelVerbose]
    ```
    ```swift
    AppCenter.logLevel = .verbose
    ```

    Make sure "App Center SDK configured successfully" appears in the logs (at **INFO** log level), then check if you see HTTPS request logs.
	
4. Make sure your device is online and the app has internet access.

   > [!Note]
   > If your app is using the App Sandbox, you must set the capability to allow incoming (Server) and outgoing (Client) connections to allow the app to have access to the internet.
   >  Xcode 9 enables the App Sandbox by default but the capabilities for incoming and outgoing connections need to be set explicitly.
   > 
   > Select your project in the project navigator, select the **Capabilities** tab and if your app is using the sandbox, add the capabilities for incoming and outgoing connections.

5. Sometimes, logs might take a few minutes to surface in the portal. Wait for some time if that’s the case.
6. To check if App Center backend has received your data, go to the **Log flow** section in **Analytics** service. Your events should appear once it's been sent.

## Crashes don't show up in the portal.

1. Make sure you've integrated the SDK modules correctly.
2. Make sure the correct app secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:` code by opening the app in the portal and navigating to **Getting Started** page.
3. Restart the app after a crash. **App Center Crashes** will forward the crash log only after the app is restarted. Also, the SDK won't forward any crash logs if you're attached to the debugger. Make sure the debugger isn't attached when you crash the app.
4. If you want to see the logs sent to the backend, change the log level to **Verbose** in your application and the SDK will print the logs in the **Console**. Insert the following call before the SDK start:

    ```objc
    [MSACAppCenter setLogLevel:MSACLogLevelVerbose]
    ```
    ```swift
    AppCenter.logLevel = .verbose
    ```

    Make sure "App Center SDK configured successfully" appears in the logs (at **INFO** log level), then check if you see HTTPS request logs.

5. Don't use any other libraries that provide Crash Reporting functionality. You can only have one crash reporting SDK integrated in your app.
6. Make sure your device is online and the app has internet access.

   > [!Note]
   > If your app is using the App Sandbox, you must set the capability to allow incoming (Server) and outgoing (Client) connections to allow the app to have access to the internet.
   >  Xcode 9 enables the App Sandbox by default but the capabilities for incoming and outgoing connections need to be set explicitly.
   > 
   > Select your project in the project navigator, select the **Capabilities** tab and if your app is using the sandbox, enable incoming and outgoing connections.

7. At times, logs might take few minutes to surface in the portal. Wait for some time if that’s the case.
8. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash `didSucceedSendingErrorReport` callback to see if it was successfully sent to the server.
9. To check if App Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it's been sent.

## Protect the App Center secret value

[!INCLUDE [app secret secure](../includes/app-secret-secure.md)]
