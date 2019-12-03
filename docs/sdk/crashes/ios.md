---
title: App Center Crashes for iOS
description: App Center Crashes for iOS
keywords: sdk, crash
author: winnieli
ms.author: yuli1
ms.date: 09/25/2019
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

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [React Native](react-native.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Unity](unity.md)
> * [Cordova](cordova.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Follow the [Getting Started](~/sdk/getting-started/ios.md) section if you haven't set up the SDK in your application yet.

Also note that crash logs on iOS require Symbolication, check out the [App Center Diagnostics documentation](~/diagnostics/iOS-symbolication.md) that explains how to provide symbols for your app.

> [!NOTE]
> The SDK will not forward any crash log if you are attached to the debugger. Make sure the debugger is not attached when you crash the app.

> [!NOTE]
> To receive properly symbolicated stack traces, please ensure bitcode is disabled. You can learn more about bitcode in App Center's [iOS Symbolication documentation](~/diagnostics/ios-symbolication.md#bitcode).

### Crash reporting in extensions

App Center supports crash reporting in iOS extensions. The usage is the same as in the container application.

[!INCLUDE [apple common methods](includes/apple-common-methods-1.md)]

### Ask for the user's consent to send a crash log

If user privacy is important to you, you might want to get user confirmation before sending a crash report to App Center. The SDK exposes a callback that tells App Center Crashes to await user confirmation before sending any crash reports.

If you chose to do so, you are responsible for obtaining the user's confirmation, for example, through a dialog prompt with one of the following options: **Always send**, **Send**, and **Don't send**. Based on the input, you will tell App Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> The SDK does not display a dialog for this, the app must provide its own UI to ask for user consent.

> [!NOTE]
> The app should not call `notifyWithUserConfirmation` explicitly if it does not implement a user confirmation dialog; the Crashes module will handle sending logs for you implicitly.

The following method shows how to set up a user confirmation handler:

```objc
[MSCrashes setUserConfirmationHandler:(^(NSArray<MSErrorReport *> *errorReports) {

  // Your code to present your UI to the user, e.g. an UIAlertController.
  UIAlertController *alertController = [UIAlertController
      alertControllerWithTitle:@"Sorry about that!"
                      message:@"Do you want to send an anonymous crash report so we can fix the issue?"
                preferredStyle:UIAlertControllerStyleAlert];

  [alertController
      addAction:[UIAlertAction actionWithTitle:@"Don't send"
                                        style:UIAlertActionStyleCancel
                                      handler:^(UIAlertAction *action) {
                                        [MSCrashes notifyWithUserConfirmation:MSUserConfirmationDontSend];
                                      }]];

  [alertController
      addAction:[UIAlertAction actionWithTitle:@"Send"
                                        style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction *action) {
                                        [MSCrashes notifyWithUserConfirmation:MSUserConfirmationSend];
                                      }]];

  [alertController
      addAction:[UIAlertAction actionWithTitle:@"Always send"
                                        style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction *action) {
                                        [MSCrashes notifyWithUserConfirmation:MSUserConfirmationAlways];
                                      }]];
  // Show the alert controller.
  [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
  return YES; // Return YES if the SDK should await user confirmation, otherwise NO.
})];
```
```swift
MSCrashes.setUserConfirmationHandler({ (errorReports: [MSErrorReport]) in

  // Your code to present your UI to the user, e.g. an UIAlertController.
  let alertController = UIAlertController(title: "Sorry about that!",
                                          message: "Do you want to send an anonymous crash report so we can fix the issue?",
                                          preferredStyle:.alert)

  alertController.addAction(UIAlertAction(title: "Don't send", style: .cancel) {_ in
    MSCrashes.notify(with: .dontSend)
  })

  alertController.addAction(UIAlertAction(title: "Send", style: .default) {_ in
    MSCrashes.notify(with: .send)
  })

  alertController.addAction(UIAlertAction(title: "Always send", style: .default) {_ in
    MSCrashes.notify(with: .always)
  })

  // Show the alert controller.
  self.window?.rootViewController?.present(alertController, animated: true)
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
MSCrashes.notify(with: .dontSend)
MSCrashes.notify(with: .send)
MSCrashes.notify(with: .always)
```

[!INCLUDE [apple common methods](includes/apple-common-methods-2.md)]

## Disabling Mach exception handling

By default, App Center Crashes uses the Mach exception handler to catch fatal signals, e.g. stack overflows, via a Mach exception server.

The `disableMachExceptionHandler`-method provides an option to disable catching fatal signals via a Mach exception server. If you want to disable the Mach exception handler, you should call this method *BEFORE* starting the SDK. Your typical setup code would look like this:

```objc
[MSCrashes disableMachExceptionHandler];
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
```
```swift
MSCrashes.disableMachExceptionHandler()
MSAppCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
```
