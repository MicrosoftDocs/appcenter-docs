---
title: Mobile Center Crashes for iOS
description: Mobile Center Crashes for iOS
keywords: sdk, crash
author: troublemakerben
ms.author: bereimol
ms.date: 07/19/2017
ms.topic: article
ms.assetid: 6be76d67-6870-41c4-875a-cf2d37d5e22e
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:  
 - swift
 - objc 
---

# Mobile Center Crashes

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)

Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/ios.md) section if you haven't set up the SDK in your application yet.

Also note that Crash logs on iOS require Symbolication, please check out the [Mobile Center Crashes documentation](~/crashes/ios.md) that explains how to provide symbols for your app.

## Generate a test crash

Mobile Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.

```objc
[MSCrashes generateTestCrash];
```
```swift
MSCrashes.generateTestCrash()
```

## Get more information about a previous crash

Mobile Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```objc
[MSCrashes hasCrashedInLastSession];
```
```swift
MSCrashes.hasCrashedInLastSession()
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occured. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occured.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```objc
MSErrorReport *crashReport = [MSCrashes lastSessionCrashReport];
```
```swift
var crashReport = MSCrashes.lastSessionCrashReport()
```

There are numerous use cases fpr this API, the most common one is people who call this API and implement their custom [MSCrashesDelegate](#customize-your-usage-of-mobile-center-crashes).

### Customize your usage of Mobile Center Crashes

Mobile Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to Mobile Center.

To add your custom behavior, you need to adopt the `MSCrashesDelegate`-protocol, all of it's methods are optional.

### Register as a delegate

```objc
[MSCrashes setDelegate:self];
```
```swift
MSCrashes.setDelegate(self)
```

### Should the crash be processed?

Implement the `crashes:shouldProcessErrorReport:`-method in the class that adopts the `MSCrashesDelegate`-protocol if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to Mobile Center.

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

### Ask for the users' consent to send a crash log

If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to Mobile Center. The SDK exposes a callback that tells Mobile Center Crashes to await your users' confirmation before sending any crash reports.

If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of these options - "Always Send", "Send", and "Don't send". Based on the input, you will tell the Mobile Center Crashes what to do and the crash will then be handled accordingly.

The following method shows how to set up a user confirmation handler:

```objc
MSCrashes setUserConfirmationHandler:(^(NSArray<MSErrorReport *> *errorReports) {

	// Your code to present your UI to the user, e.g. an UIAlertView.
   [[[UIAlertView alloc] initWithTitle:@"Sorry we crashed."
   							   message:@"Do you want to send a report about the crash to the developer?"
                              delegate:self
                     cancelButtonTitle:@"Don't send"
                     otherButtonTitles:@"Always send", @"Send", nil] show];

	return YES; // Return YES if the SDK should await user confirmation, otherwise NO.
}
```
```swift
MSCrashes.setUserConfirmationHandler({ (errorReports: [MSErrorReport]) in

	// Your code to present your UI to the user, e.g. an UIAlertView.
   UIAlertView.init(title: "Sorry we crashed!", message: "Do you want to send a Crash Report?", delegate: self, cancelButtonTitle: "No", otherButtonTitles:"Always send", "Send").show()

   return true // Return true if the SDK should await user confirmation, otherwise return false.
})
```

In case you return `YES`/`true` in the handler block above, your app should obtain user permission and message the SDK with the result using the following API. If you are using an alert for this, as we do in the sample above, you would call it from within your implementation of the `alertView:clickedButtonAtIndex:`-callback.

```objc
// Depending on the users's choice, call notifyWithUserConfirmation: with the right value.
[MSCrashes notifyWithUserConfirmation:MSUserConfirmationDontSend];
[MSCrashes notifyWithUserConfirmation:MSUserConfirmationSend];
[MSCrashes notifyWithUserConfirmation:MSUserConfirmationAlways];
```
```swift
// Depending on the user's choice, call notify(with:) with the right value.
MSCrashes.notify(with: MSUserConfirmation.dontSend)
MSCrashes.notify(with: MSUserConfirmation.send)
MSCrashes.notify(with: MSUserConfirmation.always)
```

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
func crashes(_ crashes: MSCrashes!, didSucceedSending errorReport: MSErrorReport!) {
	// Your code goes here.
}
```

#### The following callback will be invoked if you want to add attachments to a crash report

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

## Disabling Mach exception handling

By default, Mobile Center Crashes uses the Mach exception handler to catch fatal signals, e.g. stack overflows, via a Mach exception server.

The `disableMachExceptionHandler`-method provides an option to disable catching fatal signals via a Mach exception server. If you want to disable the Mach exception handler, you should call this method _BEFORE_ starting the SDK. Your typical setup code would look like this:

```objc
[MSCrashes disableMachExceptionHandler];
[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
```
```swift
MSCrashes.disableMachExceptionHandler()
MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
```

## Enable or disable Mobile Center Crashes at runtime

You can enable and disable Mobile Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

```objc
[MSCrashes setEnabled:NO];
```
```swift
MSCrashes.setEnabled(false)
```

To enable Mobile Center Crashes again, use the same API but pass `YES`/`true` as a parameter.

```objc
[MSCrashes setEnabled:YES];
```
```swift
MSCrashes.setEnabled(true)
```

## Check if Mobile Center Crashes is enabled

You can also check if Mobile Center Crashes is enabled or not:

```objc
BOOL enabled = [MSCrashes isEnabled];
```
```swift
var enabled = MSCrashes.isEnabled()
```
