---
title: SDK Troubleshooting
description: Troubleshooting the Mobile Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 4ad55002-05c9-4f5b-82b7-d29ba1234ce1
ms.service: mobile-center
---

# SDK Troubleshooting

Below are the steps you can follow to make sure the SDK is set up correctly and forwards Analytics and Crashes data to Mobile Center.

### Setup
1. For Xamarin Forms app, make sure the packages are installed in all the projects that reference any library. Otherwise you will see errors.
2. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully.
3. If you are using CocaPods to install Mobile Center in your iOS app and run into an error with the message - "CocoaPods - Unable to find a specification for `MobileCenter`", follow this [link](http://stackoverflow.com/questions/40785259/cocoapods-unable-to-find-a-specification-for-mobilecenter) to fix the issue.

### Analytics
1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the Analytics service when you start the SDK. You can copy the exact start API code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. If you want to see logs sent to the backend, change the log level to 'Verbose' in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

#### Android

    `MobileCenter.setLogLevel(Log.VERBOSE);`

#### Objective-C

    `[MSMobileCenter setLogLevel:MSLogLevelVerbose]`

#### Swift

    `MSMobileCenter.setLogLevel(MSLogLevel.Verbose)`

#### Xamarin

    `MobileCenter.LogLevel = LogLevel.Verbose;`

5. Make sure your device is connected to a working internet.
6. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
7. To check if Mobile Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it has been sent.

### Crashes
1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the Analytics service when you start the SDK. You can copy the exact start API code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. You need to restart the app after a crash and our SDK will forward the crash log only after its restarted. Also, the SDK will not forward crash log if you are attached to be debugger. So make sure you are not attached to a debugger when you re-open the app
5. If you want to see logs sent to the backend, change the log level to 'Verbose' in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

#### Android

    `MobileCenter.setLogLevel(Log.VERBOSE);`

#### Objective-C

    `[MSMobileCenter setLogLevel:MSLogLevelVerbose]`

#### Swift

    `MSMobileCenter.setLogLevel(MSLogLevel.Verbose)`

#### Xamarin

    `MobileCenter.LogLevel = LogLevel.Verbose;`

6. Don't use any other SDK that provides Crash Reporting functionality. You can only have one SDK integrated in your app.
7. Make sure your device is connected to a working internet.
8. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
9. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and show an alert. Or you can extend the crash callback to see if it was successfully sent to the server. Please refer to the ReadMe file in our GitHub repo for more information on the Crashes API.
10. To check if Mobile Center backend received the crash, go to the Log flow section in Analytics service. Your crash should appear there once it has been sent.
