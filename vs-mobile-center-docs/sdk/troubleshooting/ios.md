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
2. If you are using Cocoapods to integrate Mobile Center in your iOS app and run into an error with the message - `CocoaPods - Unable to find a specification for MobileCenter`, follow this [link](http://stackoverflow.com/questions/40785259/cocoapods-unable-to-find-a-specification-for-mobilecenter) to fix the issue.
3. If you are manually integrating the SDK binaries, make sure you have modules enabled for your project.

## Analytics data doesn't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:`-code by opening the app in the portal and navigating to Getting Started page.
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

## Crashes don't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start:withServices:` method call. You can copy the exact `start:withServices:` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. You need to restart the app after a crash and Mobile Center Crashes will forward the crash log only after it is restarted. Also, the SDK will not forward any crash log if you attached to be debugger. Make sure the debugger is not attached when you crash the app.
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

## The Alert that prompts users for an update doesn't contain strings, but just the keys for them?

This means that the `MobileCenterDistributeResources.bundle` wasn't added to the project. Make sure you have drag'n'dropped the file into your Xcode project, and it appears in your app target's `Copy Bundle Resources` build phase. The later should be the case if you have added the file through drag'n'drop – Xcode does it automatically for you. If the file is missing from the build phase, add it so it gets compiled into your app's bundle.

If you are using Cocoapods, it takes care of the resources automatically. Try re-installing the pod.

## You are seeing messages in the console that indicate that the data base could not be opened (using SDK version 0.11.0 and later)

Starting with version 0.11.0 of the iOS SDK, Mobile Center uses SQLite to persist logs before they are sent to the backend. If you are bundling your application with your own SQLite database instead of using the one provided by the OS, you might see errors like this in the console `[MobileCenter] ERROR: -[MSDBStorage executeSelectionQuery:]/147 Failed to open database` and won't be seeing no analytics or crash information in the backend. The reason for this is that bundling your own version of SQLite is something that should be done carefully and only when necessary. Bundling your own build of SQLite requires additional measures have to be taken when building and linking your own version of SQLite into your app. Eric Sink explains the issues pretty well in [this blogpost](http://ericsink.com/entries/sqlite_android_n.html) and [that one](http://ericsink.com/entries/multiple_sqlite_problem.html). Section 2.2.1 of the [official SQLite documentation](http://sqlite.org/howtocorrupt.html) points that out problem, too.

While the Mobile Center SDK is not doing anything wrong per se, as we are using SQLite as provided by iOS, we are looking into improving Mobile Center to work even for cases where a developer's SQLite build is not hiding its own symbols and isolating your custom copy of SQLite.

Unfortunately, there is no ETA from our side for this as we are exploring various solutions and we are waiting for more user feedback. If you are running into this issue, please get in touch with us on Intercom by using the blue button on the bottom right of the Mobile Center portal. We'd love to learn more about why you are bundling your own build of SQLite with your app.

If you really need to ship your custom version of SQLite with your app, you need to make sure, as pointed out above, that your custom SQLite build has hidden its symbols and isolated itself properly.

If you were to link SQLite dynamically on iOS, the following steps would be necessary: 

1. Make sure you utilize `__attribute__((visibility("hidden")))`/`-fvisibility=hidden` and `-fvisibility-inlines-hidden`to hide any API to avoid symbol collisions.
2. Leverage two-level namespaces in `dyld` which is a topic of its own and which is explained, e.g. in Apple's Guide on [Executing Mach-O Files](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/MachOTopics/1-Articles/executing_files.html).

As static linking is the way to go on iOS, there is really only one way to isolate your custom build of SQLite properly: Rename all the SQLite symbols manually with your own symbols.

That said, depending on your custom SQLite build configuration, even more changes might be necessary, even for dynamic linking, which we cannot cover.

In addition, please note that building your own `sqlite3.c` should always be used in `release mode` as a build of SQLite in `debug mode` will balloon your apps' debug build by several MB instead of tens of KB.
