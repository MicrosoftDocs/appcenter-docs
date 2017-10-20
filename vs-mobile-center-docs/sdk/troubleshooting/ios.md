---
title: iOS SDK Troubleshooting
description: Troubleshooting the Mobile Center SDK for iOS
keywords: sdk
author: troublemakerben
ms.author: bereimol
ms.date: 07/13/2017
ms.topic: article
ms.assetid: 4ad55002-05c9-4f5b-82b7-d29ba1234ce1
ms.service: mobile-center
ms.custom: sdk
dev_langs:  
 - swift
 - objc 
---

# iOS SDK Troubleshooting

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

## Issues during setup

1. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully.
2. If you are using Cocoapods to integrate Mobile Center in your iOS app and run into an error with the message - `CocoaPods - Unable to find a specification for MobileCenter`, run `pod repo update` to update your local Cocoapods repository and then run `pod install` again.
3. If you are manually integrating the SDK binaries, make sure you have modules enabled for your project.

## Analytics data doesn't show up in the portal.

1. Make sure you have integrated the SDK modules correctly.
2. Make sure the correct App Secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:`-code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

  	```objc
  	[MSMobileCenter setLogLevel:MSLogLevelVerbose]
  	```
    ```swift
	MSMobileCenter.setLogLevel(MSLogLevel.Verbose)
	```
	
5. Make sure your device is online.
6. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
7. To check if Mobile Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it has been sent.

## Crashes don't show up in the portal.

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. You need to restart the app after a crash and Mobile Center Crashes will forward the crash log only after it is restarted. Also, the SDK will not forward any crash log if you are attached to the debugger. Make sure the debugger is not attached when you crash the app.
5. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

	```objc
 	[MSMobileCenter setLogLevel:MSLogLevelVerbose]
 	```
 	```swift
	MSMobileCenter.setLogLevel(MSLogLevel.Verbose)
	```

6. Don't use any other library that provides Crash Reporting functionality. You can only have one crash reporting SDK integrated in your app.
7. Make sure your device is online.
8. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
9. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server.
10. To check if Mobile Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it has been sent.

## The Alert that prompts users for an update doesn't contain strings, but just the keys for them.

This means that the `MobileCenterDistributeResources.bundle` wasn't added to the project. Make sure you have drag'n'dropped the file into your Xcode project, and it appears in your app target's `Copy Bundle Resources` build phase. The later should be the case if you have added the file through drag'n'drop – Xcode does it automatically for you. If the file is missing from the build phase, add it so it gets compiled into your app's bundle.

If you are using Cocoapods, it takes care of the resources automatically. Try re-installing the pod.

## You are seeing messages in the console that indicate that the database could not be opened

Starting with version 0.11.0 of the iOS SDK, Mobile Center uses SQLite to persist logs before they are sent to the backend. If you are bundling your application with your own SQLite library instead of using the one provided by the OS, you might see errors like this in the console `[MobileCenter] ERROR: -[MSDBStorage executeSelectionQuery:]/147 Failed to open database` and won't see any analytics or crash information in the backend. Please update the SDK to version 0.13.0 or later.

## Why is the SDK distributed as a "static library"?

The primary design goals for the Mobile Center SDK are to have a minimal impact on the app that is using Mobile Center and to have a modular SDK. This would result in the SDK being distributed as several dynamic linked shared libraries.
Historically, iOS didn't support dynamic linked shared libraries as Landon Fuller explains in a [great blogpost](http://landonf.bikemonkey.org/code/ios/Radar_15800975_iOS_Frameworks.20140112.html) but was added in iOS 8. Yet, Mobile Center is distributed as a static linked shared library that is wrapped in a "fat" fake framework. It means that the SDK is linked at **compile time** and not at launch time. The reason is straight forward: performance. Loading multiple dynamic linked shared libraries takes time. Apple recommends to optimize app launch to take not more than 400ms in a[WWDC session](https://developer.apple.com/videos/play/wwdc2016/406/). They specifically recommend static shared libraries over dynamic shared ones to achieve this goal. Distributing the Mobile Center SDK for iOS as a static linked shared library follows Apple's recommendation to provide the best performance and a minimal impact to the app that includes the SDK.

To learn more about static linked shared libraries vs. dynamic linked shared libraries, we recommend Apple's [general documentation on the topic](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/DynamicLibraries/100-Articles/OverviewOfDynamicLibraries.html). To learn more about the performance impact of dynamic linked shared libraries, read Eric Horacek's [blogpost](https://blog.automatic.com/how-we-cut-our-ios-apps-launch-time-in-half-with-this-one-cool-trick-7aca2011e2ea).
