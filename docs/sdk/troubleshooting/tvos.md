---
title: tvOS SDK Troubleshooting
description: Troubleshooting the App Center SDK for tvOS
keywords: sdk
author: ahdbilal
ms.author: ahbilal
ms.date: 12/04/2019
ms.topic: article
ms.assetid: aaedb72a-3fb1-4c5c-b53b-4e3bf189656d
ms.service: vs-appcenter
ms.custom: sdk
dev_langs:  
 - swift
 - objc
---

# tvOS SDK Troubleshooting

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [React Native](react-native.md)
> * [Cordova](cordova.md)
> * [tvOS](tvOS.md)

## Issues during setup

1. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This verifies that the SDK is configured successfully.
2. If you are using **Cocoapods** to integrate App Center in your tvOS app and run into an error with the message - `CocoaPods - Unable to find a specification for AppCenter`, run `pod repo update` to update your local Cocoapods repository and then run `pod install` again.
3. If you are integrating the SDK binaries manually, make sure you have modules enabled for your project.

## Analytics data doesn't show up in the portal.

1. Make sure you have integrated the SDK modules correctly.
2. Make sure the correct App Secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:`-code by opening the app in the portal and navigating to **Getting Started** page.
3. If you want to see the logs that are sent to the backend, change the log level to **Verbose** in your application and the SDK will print the logs in the **Console** . CInsert the following call before the SDK start:

    ```objc
    [MSAppCenter setLogLevel:MSLogLevelVerbose]
    ```
    ```swift
    MSAppCenter.setLogLevel(.verbose)
    ```

    Make sure "App Center SDK configured successfully" appears in the logs (at **INFO** log level), then check if you see HTTPS request logs.

4. Make sure your device is online and the app has internet access.
5. Sometimes, logs might take a few minutes to surface in the portal. Please wait for some time if that’s the case.
6. To check if App Center backend has received your data, go to the **Log flow** section in **Analytics** service. Your events should appear once it has been sent.

## Crashes don't show up in the portal.

1. Make sure you have integrated the SDK modules correctly.
2. Make sure the correct app secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:` code by opening the app in the portal and navigating to **Getting Started** page.
3. You need to restart the app after a crash. **App Center Crashes** will forward the crash log only after the app is restarted. Also, the SDK will not forward any crash logs if you are attached to the debugger. Make sure the debugger is not attached when you crash the app.
4. If you want to see the logs that are sent to the backend, change the log level to **Verbose** in your application and the SDK will print the logs in the **Console**. Insert the following call before the SDK start:

    ```objc
    [MSAppCenter setLogLevel:MSLogLevelVerbose]
    ```
    ```swift
    MSAppCenter.setLogLevel(.verbose)
    ```

    Make sure "App Center SDK configured successfully" appears in the logs (at **INFO** log level), then check if you see HTTPS request logs.

5. Don't use any other libraries that provide Crash Reporting functionality. You can only have one crash reporting SDK integrated in your app.
6. Make sure your device is online and the app has internet access.
7. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
8. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server.
9. To check if App Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it has been sent.
