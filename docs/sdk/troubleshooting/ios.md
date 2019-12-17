---
title: iOS SDK Troubleshooting
description: Troubleshooting the App Center SDK for iOS
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 12/17/2019
ms.topic: article
ms.assetid: 0388bac8-fe1a-477d-adc4-125cf9bfc334
ms.service: vs-appcenter
ms.custom: sdk
dev_langs:  
 - swift
 - objc
---

# iOS SDK Troubleshooting

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

1. In the console, look for an Assert log with the message - "App Center SDK configured successfully". The message implies that the SDK is configured successfully.
2. If you're using **Cocoapods** to integrate App Center in your iOS app and run into an error with the message - `CocoaPods - Unable to find a specification for AppCenter`, run `pod repo update` to update your local Cocoapods repository and then run `pod install` again.
3. If you're integrating the SDK binaries manually, make sure you have modules enabled for your project.

## Analytics data doesn't show up in the portal

1. Make sure you've integrated the SDK modules correctly.
2. Make sure the correct App Secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:`-code by opening the app in the portal and navigating to **Getting Started** page.
3. If you want to see the logs that are sent to the backend, change the log level to **Verbose** in your application. The SDK will then print the logs in the **Console**. Insert the following call before the SDK start:

    ```objc
    [MSAppCenter setLogLevel:MSLogLevelVerbose]
    ```

    ```swift
    MSAppCenter.setLogLevel(.verbose)
    ```

    Make sure "App Center SDK configured successfully" appears in the logs (at **INFO** log level), then check if you see HTTPS request logs.

4. Make sure your device is online.
5. Sometimes, logs might take a few minutes to surface in the portal. Wait for some time if that's the case.
6. To check if App Center backend has received your data, go to the **Log flow** section in **Analytics** service. Your events should appear once it has been sent.

## Crashes don't show up in the portal

1. Make sure you've integrated the SDK modules correctly.
2. Make sure the correct app secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:` code by opening the app in the portal and navigating to **Getting Started** page.
3. **App Center Crashes** will forward the crash log only after the app restarts. Also, the SDK won't forward any crash logs if you're attached to the debugger. Make sure the debugger is not attached when you crash the app.
4. If you want to see the logs that are sent to the backend, change the log level to **Verbose** in your application. The SDK will then print the logs in the **Console**. Insert the following call before the SDK start:

    ```objc
    [MSAppCenter setLogLevel:MSLogLevelVerbose]
    ```

    ```swift
    MSAppCenter.setLogLevel(.verbose)
    ```

    Make sure "App Center SDK configured successfully" appears in the logs (at **INFO** log level), then check if you see HTTPS request logs.

5. Don't use any other libraries that provide Crash Reporting functionality. You can only have one crash reporting SDK integrated in your app.
6. Make sure your device is online.
7. At times, logs might take few minutes to surface in the portal. Wait for some time if that's the case.
8. Check if the SDK detected the crash on the next app start. You can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash `didSucceedSendingErrorReport` callback to see if it was successfully sent to the server.
9. To check if App Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it has been sent.

## The Alert that prompts users for an update doesn't contain strings, but just the keys for them

This means that the `AppCenterDistributeResources.bundle` wasn't added to the project. Make sure you've dropped the file into your Xcode project, and it appears in your app target's `Copy Bundle Resources` build phase. It should appear there if you added the file through drag and drop – Xcode does it automatically for you. If the file is missing from the build phase, add it so it gets compiled into your app's bundle.

If you're using Cocoapods, it takes care of the resources automatically. Try reinstalling the pod.

## You see messages in the console that indicate that the database could not be opened

Starting with version 0.11.0 of the iOS SDK, App Center uses SQLite to persist logs before it sends them to the backend. If you're bundling your application with your own SQLite library instead of using the one provided by the OS, you might see errors like this in the console `[AppCenter] ERROR: -[MSDBStorage executeSelectionQuery:]/147 Failed to open database` and won't see any analytics or crash information in the backend. Update the SDK to version 0.13.0 or later.

## Distribute and in-app updates are blocking my automated UI tests

If in-app updates are enabled, they will block your automated UI tests. The update process will try to authenticate against the App Center backend. We recommend to not enable App Center Distribute for your UI test target.

## Why the SDK is distributed as a "static library"

The primary design goals for the App Center SDK are to have a minimal impact on the app that is using App Center and to have a modular SDK. This would result in the SDK being distributed as several dynamic linked shared libraries.
Historically, iOS didn't support dynamic linked shared libraries as Landon Fuller explains in a [great blog post](http://landonf.bikemonkey.org/code/ios/Radar_15800975_iOS_Frameworks.20140112.html) but was added in iOS 8. Yet, App Center is distributed as a statically-linked shared library that is wrapped in a "fat" fake framework. It means that the SDK is linked at **compile time** and not at launch time. The reason is straight forward: performance. Loading multiple dynamic linked shared libraries takes time. Apple recommends optimizing the app launch to take not more than 400 ms in a [WWDC session](https://developer.apple.com/videos/play/wwdc2016/406/). They specifically recommend static shared libraries over dynamic shared ones to achieve this goal. Distributing the App Center SDK for iOS as a statically-linked shared library follows Apple's recommendation to provide the best performance and a minimal impact to the app that includes the SDK.

To learn more about statically-linked shared libraries vs. dynamic linked shared libraries, we recommend Apple's [general documentation on the topic](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/DynamicLibraries/100-Articles/OverviewOfDynamicLibraries.html). To learn more about the performance impact of dynamic linked shared libraries, read Eric Horacek's [blog post](https://blog.automatic.com/how-we-cut-our-ios-apps-launch-time-in-half-with-this-one-cool-trick-7aca2011e2ea).

## Why are the SDK binaries so large? I'm concerned about my app's size

The AppCenter binaries are distributed as "fat" frameworks that contain slices for all iPhone architectures and for the iPhone simulator. This is why for example *AppCenter.framework* is 10.5 MB to download.

The compiled size of the SDK binaries will be much smaller than the `.framework` that you add to your app in Xcode. Also bear in mind that release builds will be smaller than debug builds, too.

To illustrate this, we created an empty Objective-C application with Xcode 9.2, added the App Center binaries to the app, and distributed release builds to an iPhone 7 running iOS 11.3.

We ran the tests **without Bitcode** enabled and did not use **App Thinning**. You can use those techniques to shrink your app's binary size even more.

Note that the numbers below can vary and depend on your build settings, so consider them a rough guide. That said, adding the App Center SDK to your app has a minimal impact on the size of your application binary.

| App Center modules used | Exported IPA size | Installation size |
|-------------------------|-------------------|-------------------|
|    None (blank app)     |       24 KB       |       132 KB      |
|  App Center Analytics   |       120 KB      |       377 KB      |
|    App Center Crash     |       239 KB      |       705 KB      |
|  App Center Distribute  |       163 KB      |       528 KB      |
|     App Center Push     |       115 KB      |       377 KB      |
| All App Center modules  |       314 KB      |       930 KB      |
