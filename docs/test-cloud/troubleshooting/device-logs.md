---
title: Analyzing Device Logs in App Center Test
description: Using device logs to troubleshoot application issues
keywords: appcenter, test, device, logs
author: king-of-spades
ms.date: 06/15/2020
ms.topic: article
ms.assetid: 03c91b81-477c-43a5-9019-f99202776951
---

# Analyzing Device Logs in App Center Test
When your tests run in App Center Test, output is captured to log files for each device in the run. You can examine these logs after the test run completes. 

Device logs and stack traces contain output from the device and can be a great help in diagnosing application issues like your application failed to install, failed to start, was killed, crashed, or became unresponsive. 

For information on how to navigate to the logs and information on the other logs see [An Introduction to Logs in App Center Test](~/test-cloud/test-reports#test-logs).

## Searching the device log
The device log contains so much output it is usually impractical to read or even scan the whole file from beginning to end. To help identify areas for closer examination try searching for your app name or package name in the log files. Does your app produce diagnostic output? If so, searching for that may help.

What else can you look for? Here are a few search terms that have been found useful in diagnosing problems with applications in App Center Test. If you find these terms in your device log look at other nearby output for context to better understand the relevance and significance. While searching the device log you may discover terms that are useful for identifying issues specific to your app. Keep track of those for help in troubleshooting future test runs.

### iOS device log search terms
- `8badf00d`(ate bad food) - An iOS watchdog timeout occurred. 
    See: [Understanding and Analyzing Application Crash Reports](https://developer.apple.com/library/archive/technotes/tn2151/_index.html)

- `MISSING keychain entitlements 
    explicit accessGroup`
    These may indicate your application requires some advanced keychain access. If this appears to be an issue causing failures with your app contact support through the chat window.

- `OutOfMemoryException  
    Memory Pressure  
    failed to allocate   
    memory warning`    
    Any of these may indicate an issue with running low or out of memory. You may see this on some devices, but not others, based on the amount of memory in the devices.
    
- `assertion failed` 
    This indicates an assertion failure in your code or in library code.
    
- `frontmost` 
    If your app is stuck at an iOS privacy dialog and you see this error it generally indicates the dialog was encountered before the test framework was able to take control of the application. 
    See: [Managing Privacy Alerts: Location Services, APNS, Contacts](https://github.com/calabash/calabash-ios/wiki/Managing-Privacy-Alerts:--Location-Services,-APNS,-Contacts)
    
- `exited abnormally` 
    Look at the reason given and nearby output for context.
    
### Android device log search terms
- `ANR` 
    You may see this in the log file if your application has experienced an ANR (Application Not Responding) error. See: ANRs.
    
- `Unhandled exception` 
    You may see this for fatal errors.

- `FATAL` 
    Fatal errors.

- `segmentation fault
    Native crash 
    Crash` 
    Each of these typically represent a serious problem and looking at nearby messages and stack traces can help identify the specific source of the problem.
    
## Limiting device log size
One of the challenges in examining device logs is that there is a massive amount of information and most of it is not helpful when you are trying to find a specific issue concerning your application.

If your app crashes or freezes or acts "weird" for a particular test, try creating a test run that has only that test so there is less output to examine. If the behavior still happens for a single test in isolation then there is that much less material to look through in the device log.

## What's important versus what's noise
In the device log file it can be difficult to determine if something is relevant to an issue with your application.

One approach that can help determine relevance is to compare two device logs, one for a test that passed and one that failed or crashed. Using the same or similar device and OS version for the two tests helps. If the message appears in both sets of logs it is probably not a concern. If it only occurs in the device log for the failing test it may be an issue worth looking at further.