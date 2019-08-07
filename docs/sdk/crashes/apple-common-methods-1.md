---
title: Shared docs for Apple Crashes SDK
description:  Shared docs for Apple Crashes SDK
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 07/22/2019
ms.topic: article
ms.assetid: c94f633d-7e90-40f9-aeb7-c97043d6ada4
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---

## Generate a test crash

App Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.

```objc
[MSCrashes generateTestCrash];
```
```swift
MSCrashes.generateTestCrash()
```

## Get more information about a previous crash

App Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app receive a low memory warning in the previous session?

At any time after starting the SDK, you can check if the app received a memory warning in the previous session:

```objc
[MSCrashes hasReceivedMemoryWarningInLastSession];
```
```swift
MSCrashes.hasReceivedMemoryWarningInLastSession()
```

> [!NOTE]
> This method must only be used after `MSCrashes` has been started, it will always return `NO` or `false` before start.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```objc
[MSCrashes hasCrashedInLastSession];
```
```swift
MSCrashes.hasCrashedInLastSession()
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occurred.

> [!NOTE]
> This method must only be used after `MSCrashes` has been started, it will always return `NO` or `false` before start.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```objc
MSErrorReport *crashReport = [MSCrashes lastSessionCrashReport];
```
```swift
var crashReport = MSCrashes.lastSessionCrashReport()
```

> [!NOTE]
> This method must only be used after `MSCrashes` has been started, it will always return `nil` before start.

There are numerous use cases for this API, the most common one is people who call this API and implement their custom [MSCrashesDelegate](#customize-your-usage-of-app-center-crashes).

## Customize your usage of App Center Crashes

App Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to App Center.

To add your custom behavior, you need to adopt the `MSCrashesDelegate`-protocol, all of its methods are optional.

### Register as a delegate

```objc
[MSCrashes setDelegate:self];
```
```swift
MSCrashes.setDelegate(self)
```

> [!NOTE]
> You must set the delegate *before* calling `[MSAppCenter start]`, since App Center starts processing crashes immediately after the start.

### Should the crash be processed?

Implement the `crashes:shouldProcessErrorReport:`-method in the class that adopts the `MSCrashesDelegate`-protocol if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to App Center.

```objc
- (BOOL)crashes:(MSCrashes *)crashes shouldProcessErrorReport:(MSErrorReport *)errorReport {
  return YES; // return YES if the crash report should be processed, otherwise NO.
}
```
```swift
func crashes(_ crashes: MSCrashes!, shouldProcessErrorReport errorReport: MSErrorReport!) -> Bool {
  return true; // return true if the crash report should be processed, otherwise false.
}
```
