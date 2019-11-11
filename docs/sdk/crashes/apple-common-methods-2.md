---
title: Shared docs for Apple Crashes SDK
description:  Shared docs for Apple Crashes SDK
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 11/11/2019
ms.topic: article
ms.assetid: 1c1391e4-0c39-4141-893e-766ad22266d7
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---

### Get information about the sending status for a crash log

At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. The `MSCrashesDelegate`-protocol defines three different callbacks that you can use in your app to be notified of what is going on:

#### The following callback will be invoked before the SDK sends a crash log

```objc
- (void)crashes:(MSCrashes *)crashes willSendErrorReport:(MSErrorReport *)errorReport {
  // Your code, e.g. to present a custom UI.
}
```
```swift
func crashes(_ crashes: MSCrashes!, willSend errorReport: MSErrorReport!) {
  // Your code, e.g. to present a custom UI.
}
```

In the event we have network issues or we have an outage on the endpoint and you restart the app, `willSendErrorReport` is replayed after process restart.

#### The following callback will be invoked after the SDK sent a crash log successfully

```objc
- (void)crashes:(MSCrashes *)crashes didSucceedSendingErrorReport:(MSErrorReport *)errorReport {
  // Your code, e.g. to hide the custom UI.
}
```
```swift
func crashes(_ crashes: MSCrashes!, didSucceedSending errorReport: MSErrorReport!) {
  // Your code goes here.
}
```

#### The following callback will be invoked if the SDK failed to send a crash log

```objc
- (void)crashes:(MSCrashes *)crashes didFailSendingErrorReport:(MSErrorReport *)errorReport withError:(NSError *)error {
  // Your code goes here.
}
```
```swift
func crashes(_ crashes: MSCrashes!, didFailSending errorReport: MSErrorReport!, withError error: Error!) {
  // Your code goes here.
}
```

When you receive `didFailSendingErrorReport`, it's a non recoverable error such as a **4XX** code which means something seriously wrong happened, for example wrong `appSecret` that cannot be retried.

Note that this callback will not be triggered if it's a network issue. In this case, it would keep retrying (and also pause retries while network is offline and wait for it to become up again). 

### Add attachments to a crash report

You can add **one binary** and **one text** attachment to a crash report. The SDK will send it along with the crash so that you can see it in App Center portal. The following callback will be invoked right before sending the stored crash from previous application launches. It will not be invoked when the crash happens. Here is an example of how to attach text and an image to a crash:

```objc
- (NSArray<MSErrorAttachmentLog *> *)attachmentsWithCrashes:(MSCrashes *)crashes
                                             forErrorReport:(MSErrorReport *)errorReport {
  MSErrorAttachmentLog *attachment1 = [MSErrorAttachmentLog attachmentWithText:@"Hello world!" filename:@"hello.txt"];
  MSErrorAttachmentLog *attachment2 = [MSErrorAttachmentLog attachmentWithBinary:[@"Fake image" dataUsingEncoding:NSUTF8StringEncoding] filename:@"fake_image.jpeg" contentType:@"image/jpeg"];
  return @[ attachment1, attachment2 ];
}
```
```swift
func attachments(with crashes: MSCrashes, for errorReport: MSErrorReport) -> [MSErrorAttachmentLog] {
  let attachment1 = MSErrorAttachmentLog.attachment(withText: "Hello world!", filename: "hello.txt")
  let attachment2 = MSErrorAttachmentLog.attachment(withBinary: "Fake image".data(using: String.Encoding.utf8), filename: nil, contentType: "image/jpeg")
  return [attachment1!, attachment2!]
}
```

> [!NOTE]
> The size limit is currently 7 MB. Attempting to send a larger attachment will trigger an error.

## Enable or disable App Center Crashes at runtime

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

```objc
[MSCrashes setEnabled:NO];
```
```swift
MSCrashes.setEnabled(false)
```

To enable App Center Crashes again, use the same API but pass `YES`/`true` as a parameter.

```objc
[MSCrashes setEnabled:YES];
```
```swift
MSCrashes.setEnabled(true)
```

The state is persisted in the device's storage across application launches.

> [!NOTE]
> This method must only be used after `Crashes` has been started.

## Check if App Center Crashes is enabled

You can also check if App Center Crashes is enabled or not:

```objc
BOOL enabled = [MSCrashes isEnabled];
```
```swift
var enabled = MSCrashes.isEnabled()
```

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `false` before start.
