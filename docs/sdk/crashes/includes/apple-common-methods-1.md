---
title: Shared docs for Apple Crashes SDK
description:  Shared docs for Apple Crashes SDK
keywords: sdk, crash
author: lucen-ms
ms.author: lucen
ms.date: 07/09/2021
ms.topic: include
ms.assetid: c94f633d-7e90-40f9-aeb7-c97043d6ada4
ms.custom: sdk
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---

## Generate a test crash

App Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.

```objc
[MSACCrashes generateTestCrash];
```
```swift
Crashes.generateTestCrash()
```

## Get more information about a previous crash

App Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app receive a low memory warning in the previous session?

At any time after starting the SDK, you can check if the app received a memory warning in the previous session:

```objc
[MSACCrashes hasReceivedMemoryWarningInLastSession];
```
```swift
Crashes.hasReceivedMemoryWarningInLastSession
```

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `NO` or `false` before start.

> [!NOTE]
> In some cases, a device with low memory can't send events.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```objc
[MSACCrashes hasCrashedInLastSession];
```
```swift
Crashes.hasCrashedInLastSession
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occurred.

> [!NOTE]
> This method must only be used after `MSACCrashes` has been started, it will always return `NO` or `false` before start.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```objc
MSACErrorReport *crashReport = [MSACCrashes lastSessionCrashReport];
```
```swift
var crashReport = Crashes.lastSessionCrashReport
```

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `nil` before start.

There are numerous use cases for this API, the most common one is people who call this API and implement their custom [CrashesDelegate](#customize-your-usage-of-app-center-crashes).

## Customize your usage of App Center Crashes

App Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to App Center.

To add your custom behavior, you need to adopt the `CrashesDelegate`-protocol, all of its methods are optional.

### Register as a delegate

```objc
[MSACCrashes setDelegate:self];
```
```swift
Crashes.delegate = self
```

> [!NOTE]
> You must set the delegate *before* calling `AppCenter.start`, since App Center starts processing crashes immediately after the start.

### Should the crash be processed?

Implement the `crashes:shouldProcessErrorReport:`-method in the class that adopts the `CrashesDelegate`-protocol if you want to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to App Center.

```objc
- (BOOL)crashes:(MSACCrashes *)crashes shouldProcessErrorReport:(MSACErrorReport *)errorReport {
  return YES; // return YES if the crash report should be processed, otherwise NO.
}
```
```swift
func crashes(_ crashes: Crashes, shouldProcess errorReport: ErrorReport) -> Bool {
  return true; // return true if the crash report should be processed, otherwise false.
}
```

## Handled Errors

App Center also allows you to track errors by using handled exceptions via `trackError` method. An app can optionally attach properties or/and attachments to a handled error report to provide further context.

```objc
@try {
  // Throw error.
} @catch (NSError *error) {

  // Init attachments.
  NSArray<MSACErrorAttachmentLog *> attachments = @[ MSACErrorAttachmentLog attachmentWithText:@"Hello world!" filename:@"hello.txt"] ]

  // Init properties.
  NSDictionary *properties = @{ "Category" : "Music", "Wifi" : "On" };

  // Track errors.
  [MSACCrashes trackError:error withProperties:properties attachments:attachments];
  [MSACCrashes trackError:error withProperties:properties attachments:nil];
  [MSACCrashes trackError:error withProperties:nil attachments:attachments];
  [MSACCrashes trackError:error withProperties:nil attachments:nil];
}
```
```swift
do {
  // Throw error.
} catch {

  // Init attachments.
  let attachments = [ErrorAttachmentLog.attachment(withText: "Hello world!", filename: "hello.txt")]

  // Init properties.
  let properties:Dictionary<String, String> = ["Category" : "Music", "Wifi" : "On"]

  // Track errors.
  Crashes.trackError(error, properties: properties, attachments: attachments)
  Crashes.trackError(error, properties: properties, attachments: nil)
  Crashes.trackError(error, properties: nil, attachments: attachments)
  Crashes.trackError(error, properties: nil, attachments: nil)
}
```

For track exceptions you can use `trackException` method:

```objc
@try {
  // Throw exceptions.
} @catch (NSException *exception) {

  // Init exceptions.
  MSACExceptionModel *customException1 = [MSACExceptionModel initWithType:@"Custom exception" exceptionMessage:"Track custom exception.", stackTrace:exception.callStackSymbols];
  MSACExceptionModel *customException2 = [MSACExceptionModel initWithException:exception];

  // Track exceptions.
  [MSACCrashes trackException:customException1 withProperties:properties attachments:nil];
  [MSACCrashes trackException:customException2 withProperties:properties attachments:nil];
}
```
```swift
do {
  // Throw exception.
} catch {

  // Init exception.
  let exception = ExceptionModel(withType: "Custom exception", exceptionMessage: "Track custom exception.", stackTrace: Thread.callStackSymbols)

  // Track exception.
  Crashes.trackException(exception, properties: properties, attachments: nil)
}
```
