---
title: macOS SDK Troubleshooting
description: Troubleshooting the App Center SDK for macOS
keywords: sdk
author: jaelim-ms
ms.author: jaelim
ms.date: 1/3/2018
ms.topic: article
ms.assetid: 170bfa7a-55de-11e7-907b-a6006ad3dba0
ms.service: vs-appcenter
ms.custom: sdk
dev_langs:  
 - swift
 - objc 
---

# macOS SDK Troubleshooting

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [React Native](react-native.md)

## Issues during setup

1. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This verifies that the SDK is configured successfully.
2. If you are using Cocoapods to integrate App Center in your iOS app and run into an error with the message - `CocoaPods - Unable to find a specification for AppCenter`, run `pod repo update` to update your local Cocoapods repository and then run `pod install` again.
3. If you are manually integrating the SDK binaries, make sure you have modules enabled for your project.

## Analytics data doesn't show up in the portal.

1. Make sure you have integrated the SDK modules correctly.
2. Make sure the correct App Secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:`-code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

    ```objc
    [MSAppCenter setLogLevel:MSLogLevelVerbose]
    ```
    ```swift
    MSAppCenter.setLogLevel(.verbose)
    ```
	
5. Make sure your device is online and the app has internet access.

	>[!Note]
	> If your app is using the App Sandbox, you have to set the capability to allow incoming (Server) and outgoing (Client) connections to allow the app to have access to the internet.
	Xcode 9 enables the App Sandbox by default but the capabilities for incoming and outgoing connections need to be set explicitly.
	>
	> Select your project in the project navigator, select the **Capabilities** tab and if your app is using the sandbox, add the capabilities for incoming and outgoing connections.

6. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
7. To check if App Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it has been sent.

## Crashes don't show up in the portal.

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. You need to restart the app after a crash and App Center Crashes will forward the crash log only after it is restarted. Also, the SDK will not forward any crash log if you are attached to the debugger. Make sure the debugger is not attached when you crash the app.
5. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

    ```objc
    [MSAppCenter setLogLevel:MSLogLevelVerbose]
    ```
    ```swift
    MSAppCenter.setLogLevel(.verbose)
    ```

6. Don't use any other library that provides Crash Reporting functionality. You can only have one crash reporting SDK integrated in your app.
7. Make sure your device is online and the app has internet access.

	>[!Note]
	> If your app is using the App Sandbox, you have to set the capability to allow incoming (Server) and outgoing (Client) connections to allow the app to have access to the internet.
	Xcode 9 enables the App Sandbox by default but the capabilities for incoming and outgoing connections need to be set explicitly.
	>
	> Select your project in the project navigator, select the **Capabilities** tab and if your app is using the sandbox, enable incoming and outgoing connections.

8. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
9. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server.
10. To check if App Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it has been sent.
