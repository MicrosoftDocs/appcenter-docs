---
title: SDK Troubleshooting
description: Troubleshooting the Mobile Center SDK for iOS
keywords: sdk
author: troublemakerben
ms.author: bereimol
ms.date: 04/17/2017
ms.topic: article
ms.assetid: 4ad55002-05c9-4f5b-82b7-d29ba1234ce1
ms.service: mobile-center
ms.custom: sdk
---

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

# iOS SDK Troubleshooting

## 1. Issues during setup

1. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully.
2. If you are using Cocoapods to integrate Mobile Center in your iOS app and run into an error with the message - `CocoaPods - Unable to find a specification for MobileCenter`, follow this [link](http://stackoverflow.com/questions/40785259/cocoapods-unable-to-find-a-specification-for-mobilecenter) to fix the issue.
3. If you are manually integrating the SDK binaries, make sure you have modules enabled for your project.

## 2. Analytics data doesn't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start()`-method call. You can copy the exact `start()`-code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

	**Objective-C**

  ```obj-c
  [MSMobileCenter setLogLevel:MSLogLevelVerbose]`
  ```
  
  **Swift**
	
 	```swift
	MSMobileCenter.setLogLevel(MSLogLevel.Verbose)`
	```
	
5. Make sure your device is online.
6. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
7. To check if Mobile Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it has been sent.

## 3. Crashes don't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start()`-method call. You can copy the exact `start()`-code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. You need to restart the app after a crash and Mobile Center Crashes will forward the crash log only after its restarted. Also, the SDK will not forward any crash log if you attached to be debugger. So make sure you are not attached to a debugger when you re-open the app
5. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

	**Objective-C**

 	```obj-c
 	[MSMobileCenter setLogLevel:MSLogLevelVerbose]`
 	```
  
 	**Swift**
	
 	```swift
	MSMobileCenter.setLogLevel(MSLogLevel.Verbose)`
	```

6. Don't use any other library that provides Crash Reporting functionality. You can only have one crash reporting SDK integrated in your app.
7. Make sure your device is online.
8. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
9. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server.
10. To check if Mobile Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it has been sent.

## 4. The Alert that prompts users for an update doesn't contain strings, but just the keys for them?

This means that the `MobileCenterDistributeResources.bundle` wasn't added to the project. Make sure you have drag'n'dropped the file into your Xcode project, and it appears in your app target's `Copy Bundle Resources` build phase. The later should be the case if you have added the file through drag'n'drop – Xcode does it automatically for you. If the file is missing from the build phase, add it so it gets compiled into your app's bundle. 

In case you are using Cocoapods, it takes care of the resources automatically. Try re-installing the pod.
