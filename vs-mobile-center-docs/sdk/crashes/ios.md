---
title: App Center Crashes for iOS
description: App Center Crashes for iOS
keywords: sdk, crash
author: troublemakerben
ms.author: bereimol
ms.date: 08/21/2017
ms.topic: article
ms.assetid: 6be76d67-6870-41c4-875a-cf2d37d5e22e
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:  
 - swift
 - objc 
---

# App Center Crashes

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/ios.md) section if you haven't set up the SDK in your application yet.

Also note that crash logs on iOS require Symbolication, please check out the [App Center Crashes documentation](~/crashes/ios.md) that explains how to provide symbols for your app.

[!include[](apple-common-methods-1.md)]

### Ask for the users' consent to send a crash log

If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to App Center. The SDK exposes a callback that tells App Center Crashes to await your users' confirmation before sending any crash reports.

If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of the following options: **Always send**, **Send**, and **Don't send**. Based on the input, you will tell the App Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> No dialog is shown by the SDK, it is up to you to provide UI code if you want to ask for users' consent.

The following method shows how to set up a user confirmation handler:

```objc
[MSCrashes setUserConfirmationHandler:(^(NSArray<MSErrorReport *> *errorReports) {

  // Your code to present your UI to the user, e.g. an UIAlertView.
  [[[UIAlertView alloc] initWithTitle:@"Sorry we crashed."
                              message:@"Do you want to send a report about the crash to the developer?"
                             delegate:self
                    cancelButtonTitle:@"Don't send"
                    otherButtonTitles:@"Always send", @"Send", nil] show];

  return YES; // Return YES if the SDK should await user confirmation, otherwise NO.
})];
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

[!include[](apple-common-methods-2.md)]
