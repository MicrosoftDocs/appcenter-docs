---
title: App Center Crashes for tvOS
description: App Center Crashes for tvOS
keywords: sdk, crash
author: lucen-ms
ms.author: lucen
ms.date: 10/22/2020
ms.topic: article
ms.assetid: 2f6481de-55d6-11e7-907b-a6006ad3dba0
ms.custom: sdk
ms.tgt_pltfrm: tvOS
dev_langs:  
 - swift
 - objc
---

# App Center Crashes (tvOS)
[!INCLUDE [Retirement announcement for App Center](../../includes/retirement.md)]
> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [MAUI/Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [React Native](react-native.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Unity](unity.md)
> * [Cordova](cordova.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Follow the [Getting Started](~/sdk/getting-started/tvos.md) section if you haven't set up the SDK in your application yet.

Also, crash logs on tvOS require Symbolication, check out the [App Center Diagnostics documentation](~/diagnostics/iOS-symbolication.md) that explains how to provide symbols for your app.

> [!NOTE]
> To receive properly symbolicated stack traces, ensure bitcode is disabled. You can learn more about bitcode in App Center's [iOS Symbolication documentation](~/diagnostics/ios-symbolication.md#bitcode).

> [!NOTE]
> In the `4.0.0` version of App Center breaking changes were introduced. Follow the [Migrate to App Center SDK 4.0.0 and higher](../getting-started/migration/apple-sdk-update.md) section to migrate App Center from previous versions.

[!INCLUDE [apple common methods](includes/apple-common-methods-1.md)]

### Ask for the users' consent to send a crash log

If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to App Center. The SDK exposes a callback that tells App Center Crashes to await your users' confirmation before sending any crash reports.

If you chose to do so, you're responsible for obtaining the user's confirmation, for example, through a dialog prompt with one of the following options: **Always send**, **Send**, and **Don't send**. Based on the input, you'll tell the App Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> The SDK doesn't display a dialog for this, the app must provide its own UI to ask for user consent.

> [!NOTE]
> The app shouldn't call `notifyWithUserConfirmation` explicitly if it doesn't implement a user confirmation dialog; the Crashes module will handle sending logs for you implicitly.

The following method shows how to set up a user confirmation handler:

```objc
[MSACCrashes setUserConfirmationHandler:(^(NSArray<MSACErrorReport *> *errorReports) {

  // Your code to present your UI to the user, e.g. an UIAlertController.
  UIAlertController *alertController = [UIAlertController
      alertControllerWithTitle:@"Sorry about that!"
                      message:@"Do you want to send an anonymous crash report so we can fix the issue?"
                preferredStyle:UIAlertControllerStyleAlert];

  [alertController
      addAction:[UIAlertAction actionWithTitle:@"Don't send"
                                        style:UIAlertActionStyleCancel
                                      handler:^(UIAlertAction *action) {
                                        [MSACCrashes notifyWithUserConfirmation:MSACUserConfirmationDontSend];
                                      }]];

  [alertController
      addAction:[UIAlertAction actionWithTitle:@"Send"
                                        style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction *action) {
                                        [MSACCrashes notifyWithUserConfirmation:MSACUserConfirmationSend];
                                      }]];

  [alertController
      addAction:[UIAlertAction actionWithTitle:@"Always send"
                                        style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction *action) {
                                        [MSACCrashes notifyWithUserConfirmation:MSACUserConfirmationAlways];
                                      }]];
  // Show the alert controller.
  [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
  return YES; // Return YES if the SDK should await user confirmation, otherwise NO.
})];
```
```swift
MSACCrashes.setUserConfirmationHandler({ (errorReports: [MSACErrorReport]) in

  // Your code to present your UI to the user, e.g. an UIAlertController.
  let alertController = UIAlertController(title: "Sorry about that!",
                                          message: "Do you want to send an anonymous crash report so we can fix the issue?",
                                          preferredStyle:.alert)

  alertController.addAction(UIAlertAction(title: "Don't send", style: .cancel) {_ in
    MSACCrashes.notify(with: .dontSend)
  })

  alertController.addAction(UIAlertAction(title: "Send", style: .default) {_ in
    MSACCrashes.notify(with: .send)
  })

  alertController.addAction(UIAlertAction(title: "Always send", style: .default) {_ in
    MSACCrashes.notify(with: .always)
  })

  // Show the alert controller.
  self.window?.rootViewController?.present(alertController, animated: true)
  return true // Return true if the SDK should await user confirmation, otherwise return false.
})
```

In case you return `YES`/`true` in the handler block above, your app should obtain user permission and message the SDK with the result using the following API. If you're using an alert for this, as we do in the sample above, you'd call it from within your implementation of the `alertView:clickedButtonAtIndex:`-callback.

```objc
// Depending on the users's choice, call notifyWithUserConfirmation: with the right value.
[MSACCrashes notifyWithUserConfirmation:MSACUserConfirmationDontSend];
[MSACCrashes notifyWithUserConfirmation:MSACUserConfirmationSend];
[MSACCrashes notifyWithUserConfirmation:MSACUserConfirmationAlways];
```
```swift
// Depending on the user's choice, call notify(with:) with the right value.
MSACCrashes.notify(with: .dontSend)
MSACCrashes.notify(with: .send)
MSACCrashes.notify(with: .always)
```

[!INCLUDE [apple common methods](includes/apple-common-methods-2.md)]
