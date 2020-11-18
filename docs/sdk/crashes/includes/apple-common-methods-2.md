---
title: Shared docs for Apple Crashes SDK
description:  Shared docs for Apple Crashes SDK
keywords: sdk, crash
author: king-of-spades
ms.author: kegr
ms.date: 10/22/2020
ms.topic: include
ms.assetid: 1c1391e4-0c39-4141-893e-766ad22266d7
ms.custom: sdk
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---

### Get information about the sending status for a crash log

At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. The `CrashesDelegate`-protocol defines three different callbacks that you can use in your app to be notified of what's going on:

#### The following callback will be invoked before the SDK sends a crash log

```objc
- (void)crashes:(MSACCrashes *)crashes willSendErrorReport:(MSACErrorReport *)errorReport {
  // Your code, e.g. to present a custom UI.
}
```
```swift
func crashes(_ crashes: Crashes, willSend errorReport: ErrorReport) {
  // Your code, e.g. to present a custom UI.
}
```
In case we have network issues or an outage on the endpoint, and you restart the app, `willSendErrorReport` is triggered again after process restart.

#### The following callback will be invoked after the SDK sent a crash log successfully

```objc
- (void)crashes:(MSACCrashes *)crashes didSucceedSendingErrorReport:(MSACErrorReport *)errorReport {
  // Your code, e.g. to hide the custom UI.
}
```
```swift
func crashes(_ crashes: Crashes, didSucceedSending errorReport: ErrorReport) {
  // Your code goes here.
}
```

#### The following callback will be invoked if the SDK failed to send a crash log

```objc
- (void)crashes:(MSACCrashes *)crashes didFailSendingErrorReport:(MSACErrorReport *)errorReport withError:(NSError *)error {
  // Your code goes here.
}
```
```swift
func crashes(_ crashes: Crashes, didFailSending errorReport: ErrorReport, withError error: Error) {
  // Your code goes here.
}
```

Receiving `didFailSendingErrorReport` means a non-recoverable error such as a **4xx** code occurred. For example, **401** means the `appSecret` is wrong.

Note that this callback isn't triggered if it's a network issue. In this case, the SDK keeps retrying (and also pauses retries while the network connection is down).

### Add attachments to a crash report

You can add binary and text attachments to a crash report. The SDK will send them along with the crash so that you can see them in App Center portal. The following callback will be invoked right before sending the stored crash from previous application launches. It will not be invoked when the crash happens. Here is an example of how to attach text and an image to a crash:

```objc
- (NSArray<MSACErrorAttachmentLog *> *)attachmentsWithCrashes:(MSACCrashes *)crashes
                                             forErrorReport:(MSACErrorReport *)errorReport {
  MSACErrorAttachmentLog *attachment1 = [MSACErrorAttachmentLog attachmentWithText:@"Hello world!" filename:@"hello.txt"];
  MSACErrorAttachmentLog *attachment2 = [MSACErrorAttachmentLog attachmentWithBinary:[@"Fake image" dataUsingEncoding:NSUTF8StringEncoding] filename:@"fake_image.jpeg" contentType:@"image/jpeg"];
  return @[ attachment1, attachment2 ];
}
```
```swift
func attachments(with crashes: Crashes, for errorReport: ErrorReport) -> [ErrorAttachmentLog] {
  let attachment1 = ErrorAttachmentLog.attachment(withText: "Hello world!", filename: "hello.txt")
  let attachment2 = ErrorAttachmentLog.attachment(withBinary: "Fake image".data(using: String.Encoding.utf8), filename: nil, contentType: "image/jpeg")
  return [attachment1!, attachment2!]
}
```

> [!NOTE]
> The size limit is currently 7 MB. Attempting to send a larger attachment will trigger an error.

## Enable or disable App Center Crashes at runtime

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

```objc
[MSACCrashes setEnabled:NO];
```
```swift
Crashes.enabled = false
```

To enable App Center Crashes again, use the same API but pass `YES`/`true` as a parameter.

```objc
[MSACCrashes setEnabled:YES];
```
```swift
Crashes.enabled = true
```

The state is persisted in the device's storage across application launches.

> [!NOTE]
> This method must only be used after `Crashes` has been started.

## Check if App Center Crashes is enabled

You can also check if App Center Crashes is enabled or not:

```objc
BOOL enabled = [MSACCrashes isEnabled];
```
```swift
var enabled = Crashes.enabled
```

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `false` before start.
