---
title: Analyzing Device Logs in App Center Test
description: Using device logs to troubleshoot application issues
keywords: appcenter, test, device, logs
author: lucen-ms
ms.author: lucen
ms.date: 07/27/2020
ms.topic: article
ms.assetid: 03c91b81-477c-43a5-9019-f99202776951
---

# Analyzing Device Logs in App Center Test
When your tests run in App Center Test, output is captured to log files for each device in the run. You can examine these logs after the test run completes. 

Device logs and stack traces contain output from the device and can be a great help in diagnosing application issues like your application:
- failed to install 
- failed to start 
- was killed 
- crashed 
- became unresponsive

For information on how to navigate to the logs and information on the other logs see [An Introduction to Logs in App Center Test](~/test-cloud/test-reports.md#test-logs).

## Searching the device log
The device log contains so much output it's impractical to read or even scan the whole file from beginning to end. To identify areas for closer examination, try searching for your app name or package name in the log files. Does your app produce diagnostic output? If so, searching for that may help.

What else can you look for? Here are a few search terms that have been found useful in diagnosing problems with applications in App Center Test. If you find these terms in your device log, look at other nearby output for context on the relevance and significance. While searching the device log, you may discover entries that are useful for identifying issues specific to your app. Keep track of those entries for troubleshooting future test runs.

### iOS device log search terms
- `8badf00d`(ate bad food) - An iOS watchdog timeout occurred. 
    See: [Understanding and Analyzing Application Crash Reports](https://developer.apple.com/library/archive/technotes/tn2151/_index.html)

- `MISSING keychain entitlements 
    explicit accessGroup`
    These may indicate your application requires some advanced keychain access. If this error appears to be an issue causing failures with your app, click the help menu (?) in the upper right corner of the App Center portal, then select **Contact support**.

- `OutOfMemoryException  
    Memory Pressure  
    failed to allocate   
    memory warning`    
    Any of these errors may indicate an issue with running low or out of memory. You may see memory problems on some devices, but not others, based on the amount of memory in each device.
    
- `assertion failed` 
    This indicates an assertion failure in your code or in library code.
    
- `frontmost` 
    If your app is stuck at an iOS privacy dialog and you see this error, it usually means the dialog appeared before the test framework was able to take control of the application. 
    See: [Managing Privacy Alerts: Location Services, APNS, Contacts](https://github.com/calabash/calabash-ios/wiki/Managing-Privacy-Alerts:--Location-Services,-APNS,-Contacts)
    
- `exited abnormally` 
    Look at the reason given and nearby output for context.
    
### Android device log search terms
- `ANR` 
    You may see this error in the log file if your application has experienced an Application Not Responding (ANR) error. See: ANRs.
    
- `Unhandled exception` 
    You may see this message for fatal errors.

- `FATAL` 
    Fatal errors.

- `segmentation fault
    Native crash 
    Crash` 
    Each of these typically represent a serious problem. Looking at nearby messages and stack traces can help identify the specific source of the problem.
    
## Limiting device log size
One of the challenges in examining device logs is the massive amount of information, most of which isn't helpful when you're trying to find a specific issue in your application.

If your app crashes, freezes, or acts unpredictably for a particular test, try creating a test run with only one test, so there's less output to examine. If the behavior still happens for a single test in isolation, then there's less material to look through in the device log.

## What's important versus what's noise
In the device log file, it can be difficult to determine if something is relevant to an issue with your application.

One approach that can help determine relevance is to compare two device logs, one for a test that passed and one that failed or crashed. Using the same or similar device and OS version for the two tests helps. If the message appears in both sets of logs, it's probably not a concern. If it only occurs in the device log for the failing test, it may be an issue worth looking at further.