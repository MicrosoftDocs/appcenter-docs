---
title: Mobile Center Crashes
description: Mobile Center Crashes for iOS
keywords: sdk, crash
author: troublemakerben
ms.author: bereimol
ms.date: 04/17/2017
ms.topic: article
ms.assetid: 6be76d67-6870-41c4-875a-cf2d37d5e22e
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
---

1. [Generate a test crash](#1-generate-a-test-crash)
2. [Get more information about a previous crash](#2-get-more-information-about-a-previous-crash)
3. [Enable or disable Mobile Center Crashes at runtime](#3-enable-or-disable-mobile-center-crashes-at-runtime)
4. [Check if Mobile Center Crashes is enabled](#4-check-if-mobile-center-crashes-is-enabled)
5. [Customize your usage of Mobile Center Crashes](#5-customize-your-usage-of-mobile-center-crashes)
6. [Enabling Mach exception handling](#6-enabling-mach-exception-handling)

# Mobile Center Crashes

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)

Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/android.md) section if you haven't setup and started the SDK in your application yet.

Also not that Crash logs on iOS require Symbolication, please check out the [Mobile Center Crashes documentation](~/crashes/ios.md) that explains how to provide symbols for your app.

## 1. Generate a test crash

Mobile Center Crashes provides you with an API to generate a test crash for easy testing of the SDK:

**Objective-C**

```obj-c
[MSCrashes generateTestCrash];
```

**Swift**

```swift
MSCrashes.generateTestCrash()
```

This API can only be used in test/beta apps and won't do anything in production apps.

## 2. Get more information about a previous crash

Mobile Center Crashes has two API that give you more information in case your app has crashed.

### 2.1 Did the app crash in last session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

**Objective-C**

```obj-c
[MSCrashes hasCrashedInLastSession];
```

**Swift**

```swift
MSCrashes.hasCrashedInLastSession()
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occured. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occured. 

### 2.2 Details about the last crash

If your app crashed previously, you can get details about the last crash.

**Objective-C**

```obj-c
MSErrorReport *crashReport = [MSCrashes lastSessionCrashReport];
```

**Swift**

```swift
var crashReport = MSCrashes.lastSessionCrashReport()
```

There are numerous use cases for this API, the most common one is people who call this API and implement 
their custom [MSCrashesDelegate](#5-customize-your-usage-of-mobile-center-crashes). 

## 3. Enable or disable Mobile Center Crashes at runtime

You can enable and disable Mobile Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

**Objective-C**

```obj-c
[MSCrashes setEnabled:NO];
```

**Swift**

```swift
MSCrashes.setEnabled(false)
```

To enable Mobile Center Crashes again, use the same API but pass `YES`/`true` as a parameter.

**Objective-C**

```obj-c
[MSCrashes setEnabled:YES];
```

**Swift**

```swift
MSCrashes.setEnabled(true)
```

## 4. Check if Mobile Center Crashes is enabled

You can also check if Mobile Center Crashes is enabled or not:

**Objective-C**

```obj-c
BOOL enabled = [MSCrashes isEnabled];
```

**Swift**

```swift
var enabled = MSCrashes.isEnabled()
```

## 5. Customize your usage of Mobile Center Crashes

Mobile Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to Mobile Center.

To add your custom behavior, you need to adopt the `MSCrashesDelegate`-protocol, all of it's methods are optional.

### 5.1 Register as a delegate

**Objective-C**

```obj-c
[MSCrashes setDelegate:self];
```

**Swift**

```swift
MSCrashes.setDelegate(self)
```

### 5.2 Should the crash be processed?

Implement the `crashes:shouldProcessErrorReport:`-method in the class that adopts the `MSCrashesDelegate`-protocol if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and don't want to send to Mobile Center.

**Objective-C**

```obj-c
- (BOOL)crashes:(MSCrashes *)crashes shouldProcessErrorReport:(MSErrorReport *)errorReport {
	return YES; // return YES if the crash report should be processed, otherwise NO.
}
```

**Swift**

```swift
func crashes(_ crashes: MSCrashes!, shouldProcessErrorReport errorReport: MSErrorReport!) -> Bool {
	return true; // return true if the crash report should be processed, otherwise false.
}
```

    
### 5.3 Ask for the user's consent to send a crash log

If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to Mobile Center. The SDK exposes a callback that tells Mobile Center Crashes to await your user's confirmation before sending any crash reports.
If you chose to do so, you are responsible for obtaining the user confirmation, e.g. through a dialog prompt with one of these options - "Always Send", "Send", and "Don't send". Based on the user input, you will tell the Mobile Center Crashes what to do and the crash will then be handled accordingly. The method takes a block as a parameter, use it to pass in your logic to present the UI to ask for the user's consent.

**Objective-C**

```obj-c
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

**Swift**

```swift
MSCrashes.setUserConfirmationHandler({ (errorReports: [MSErrorReport]) in

	// Your code to present your UI to the user, e.g. an UIAlertView.
   UIAlertView.init(title: "Sorry we crashed!", message: "Do you want to send a Crash Report?", delegate: self, cancelButtonTitle: "No", otherButtonTitles:"Always send", "Send").show()

   return true // Return true if the SDK should await user confirmation, otherwise return false.
})
```

In case you return `YES`/`true` in the handler block above, your app should obtain user permission and message the SDK with the result using the following API. If you are using an alert for this, as we do in the sample above, you would call it from within your implementation of the `alertView:clickedButtonAtIndex:`-callback.

**Objective-C**

```obj-c
// Depending on the users's choice, call notifyWithUserConfirmation: with the right value.
[MSCrashes notifyWithUserConfirmation:MSUserConfirmationDontSend];
[MSCrashes notifyWithUserConfirmation:MSUserConfirmationAlways];
[MSCrashes notifyWithUserConfirmation:MSUserConfirmationSend];
```

**Swift**

```swift
// Depending on the user's choice, call notify(with:) with the right value.
MSCrashes.notify(with: MSUserConfirmation.dontSend)
MSCrashes.notify(with: MSUserConfirmation.send)
MSCrashes.notify(with: MSUserConfirmation.always)
```


### 5.4 Get information about the sending status for a crash log

In our experience, developers might be interested about the status of Mobile Center Crashes. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. The `MSCrashesDelegate`-protocol defines three different callbacks that you can use in your app to be notified of what is going on:

* Before a crash log is sent, the following callback will be invoked: 

	**Objective-C**

	```obj-c
	- (void)crashes:(MSCrashes *)crashes willSendErrorReport:(MSErrorReport *)errorReport {
   		// Your code, e.g. to present a custom UI.
	}
	```
	
	**Swift**

	```swift
	func crashes(_ crashes: MSCrashes!, willSend errorReport: MSErrorReport!) {
		// Your code, e.g. to present a custom UI.
   }
	```
	
* After sending a crash log was successful, the callback will be invoked :

	**Objective-C**

	```obj-c
	- (void)crashes:(MSCrashes *)crashes didSucceedSendingErrorReport:(MSErrorReport *)errorReport {
		// Your code, e.g. to hide the custom UI.
   }
	```
	
	**Swift**

	```swift
	func crashes(_ crashes: MSCrashes!, didSucceedSending errorReport: MSErrorReport!) {
		// Your code goes here.
   }
	```
   
* After sending a crash log failed, the following callback will be invoked:

	**Objective-C**

	```obj-c
	- (void)crashes:(MSCrashes *)crashes didFailSendingErrorReport:(MSErrorReport *)errorReport withError:(NSError *)error {
		// Your code goes here.
  }

	```
	
	**Swift**

	```swift
	func crashes(_ crashes: MSCrashes!, didSucceedSending errorReport: MSErrorReport!) {
		// Your code goes here.
   }
	```
    

## 6. Enabling Mach exception handling

By default, Mobile Center Crashes uses the safe and proven in-process BSD Signals for catching crashes. This means that some causes for crashes, e.g. stack overflows, cannot be detected. Using a Mach exception server instead allows to detect some of those crash causes but comes with the risk of using unsafe means to detect them.

The `enableMachExceptionMethod` provides an option to enable catching fatal signals via a Mach exception server instead.

The SDK will not check if the app is running in an AppStore environment or if a debugger was attached at runtime because some developers chose to do one or both at their own risk.

**We strongly advice AGAINST enabling the Mach exception handler in release versions of your apps!**

The Mach exception handler executes in-process and will interfere with debuggers when they attempt to suspend all active threads (which will include the Mach exception handler). Mach-based handling should _NOT_ be used when a debugger is attached. Mobile Center Crashes will not enable crash reporting if the app is **started** with the debugger running. If you attach the debugger **at runtime**, this may cause issues if the Mach exception handler is enabled!

If you want or need to enable the Mach exception handler, you _MUST_ call this method _BEFORE_ starting the SDK.

Your typical setup code would look like this:

**Objective-C**

```obj-c
[MSCrashes enableMachExceptionHandler];
[MSMobileCenter start:@"YOUR_APP_ID" withServices:@[[MSAnalytics class], [MSCrashes class]]];
```

**Swift**

```swift
MSCrashes.enableMachExceptionHandler()
MSMobileCenter.start("YOUR_APP_ID", withServices: [MSAnalytics.self, MSCrashes.self])
```