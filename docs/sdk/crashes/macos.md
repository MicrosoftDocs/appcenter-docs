---
title: App Center Crashes for macOS
description: App Center Crashes for macOS
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 02/19/2019
ms.topic: article
ms.assetid: 3f6481de-55d6-11e7-907b-a6006ad3dba0
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: macos
dev_langs:  
 - swift
 - objc
---

# App Center Crashes

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Unity](unity.md)
> * [UWP](uwp.md)
> * [Cordova](cordova.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/macos.md) section if you haven't set up the SDK in your application yet.

Also note that crash logs on macOS require Symbolication, please check out the [App Center Diagnostics documentation](~/diagnostics/iOS-symbolication.md) that explains how to provide symbols for your app.

[!include[](apple-common-methods-1.md)]

### Ask for the users' consent to send a crash log

If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to App Center. The SDK exposes a callback that tells App Center Crashes to await your users' confirmation before sending any crash reports.

If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of the following options: **Always send**, **Send**, and **Don't send**. Based on the input, you will tell the App Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> The SDK does not display a dialog for this, the app must provide its own UI to ask for user consent.

The following method shows how to set up a user confirmation handler:

```objc
[MSCrashes setUserConfirmationHandler:(^(NSArray<MSErrorReport *> *errorReports) {

  // Your code to present your UI to the user, e.g. an NSAlert.
  NSAlert *alert = [[NSAlert alloc] init];
  [alert setMessageText:@"Sorry about that!"];
  [alert setInformativeText:@"Do you want to send an anonymous crash report so we can fix the issue?"];
  [alert addButtonWithTitle:@"Always send"];
  [alert addButtonWithTitle:@"Send"];
  [alert addButtonWithTitle:@"Don't send"];
  [alert setAlertStyle:NSWarningAlertStyle];

  switch ([alert runModal]) {
  case NSAlertFirstButtonReturn:
    [MSCrashes notifyWithUserConfirmation:MSUserConfirmationAlways];
    break;
  case NSAlertSecondButtonReturn:
    [MSCrashes notifyWithUserConfirmation:MSUserConfirmationSend];
    break;
  case NSAlertThirdButtonReturn:
    [MSCrashes notifyWithUserConfirmation:MSUserConfirmationDontSend];
    break;
  default:
    break;
  }

  return YES; // Return YES if the SDK should await user confirmation, otherwise NO.
})];
```
```swift
MSCrashes.setUserConfirmationHandler({ (errorReports: [MSErrorReport]) in

  // Your code to present your UI to the user, e.g. an NSAlert.
  let alert: NSAlert = NSAlert()
  alert.messageText = "Sorry about that!"
  alert.informativeText = "Do you want to send an anonymous crash report so we can fix the issue?"
  alert.addButton(withTitle: "Always send")
  alert.addButton(withTitle: "Send")
  alert.addButton(withTitle: "Don't send")
  alert.alertStyle = NSWarningAlertStyle

  switch (alert.runModal()) {
  case NSAlertFirstButtonReturn:
    MSCrashes.notify(with: .always)
    break;
  case NSAlertSecondButtonReturn:
    MSCrashes.notify(with: .send)
    break;
  case NSAlertThirdButtonReturn:
    MSCrashes.notify(with: .dontSend)
    break;
  default:
    break;
  }

  return true // Return true if the SDK should await user confirmation, otherwise return false.
})
```

In case you return `YES`/`true` in the handler block above, your app should obtain user permission and message the SDK with the result using the following API. If you are using an alert for this, as we do in the sample above, you would call it from within your implementation of the `alertView:clickedButtonAtIndex:`-callback.

```objc
// Depending on the user's choice, call notifyWithUserConfirmation: with the right value.
[MSCrashes notifyWithUserConfirmation:MSUserConfirmationDontSend];
[MSCrashes notifyWithUserConfirmation:MSUserConfirmationSend];
[MSCrashes notifyWithUserConfirmation:MSUserConfirmationAlways];
```
```swift
// Depending on the user's choice, call notify(with:) with the right value.
MSCrashes.notify(with: .dontSend)
MSCrashes.notify(with: .send)
MSCrashes.notify(with: .always)
```

### Enable catching uncaught exceptions thrown on the main thread

AppKit catches exceptions thrown on the main thread, preventing the application from crashing on macOS, so the SDK cannot catch these crashes. To mimic iOS behavior, set `NSApplicationCrashOnExceptions` flag before SDK initialization, this will allow the application to crash on uncaught exceptions and the SDK can report them.

```objc
[[NSUserDefaults standardUserDefaults] registerDefaults:@{ @"NSApplicationCrashOnExceptions" : @YES }];
```
```swift
UserDefaults.standard.register(defaults: ["NSApplicationCrashOnExceptions": true])
```

> [!NOTE]
> App Center SDK set the flag automatically in versions 1.10.0 and below. Starting with version 1.11.0 this flag is no longer set automatically.

[!include[](apple-common-methods-2.md)]
