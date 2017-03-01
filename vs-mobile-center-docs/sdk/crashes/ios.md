---
title: iOS Crashes
description: Using iOS crash reporting in Mobile Center
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 6be76d67-6870-41c4-875a-cf2d37d5e22e
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
---

# iOS Crashes

> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)
- [Xamarin](xamarin.md)
- [React Native](react-native.md)

Once you set up and start the Mobile Center SDK to use the Crashes module in your application, the SDK will automatically start logging any crashes in the devices local storage. When the user opens the application again after a crash, all pending crash logs will automatically be forwarded to Mobile Center and you can analyze the crash along with the stack trace on the Mobile Center portal. Refer to the section to [Get Started](~/sdk/getting-started/ios.md) if you haven't done so already.

* **Generate a test crash:** The SDK provides you with a static API to generate a test crash for easy testing of the SDK:

    **Objective-C**

        [MSCrashes generateTestCrash];

    **Swift**

        MSCrashes.generateTestCrash()


    Note that this API will only work for development and test apps. The method will not be functioning once the app is distributed through the App Store.

* **Did the app crash in the last session:** At any time after starting the SDK, you can check if the app crashed in the previous session:

    **Objective-C**

        [MSCrashes hasCrashedInLastSession];

    **Swift**

        MSCrashes.hasCrashedInLastSession()


* **Details about the last crash:** If your app crashed previously, you can get details about the last crash:

    **Objective-C**

        MSErrorReport *crashReport = [MSCrashes lastSessionCrashReport];

    **Swift**

        var crashReport = MSCrashes.lastSessionCrashReport()

* **Enable or disable the Crashes module:**  You can disable and opt out of using the Crashes module by calling the `setEnabled` API and the SDK will collect no more crashes for your app. Use the same API to re-enable it by passing `YES` or `true` as a parameter.

    **Objective-C**

        [MSCrashes setEnabled:NO];

    **Swift**

        MSCrashes.setEnabled(false)

    You can also check if the module is enabled or not using the `isEnabled` method:

    **Objective-C**

        BOOL enabled = [MSCrashes isEnabled];

    **Swift**

        var enabled = MSCrashes.isEnabled()

* **Advanced Scenarios:**  If you are using the Crashes service, you can customize the way the SDK handles crashes. The `MSCrashesDelegate` protocol describes methods to attach data to a crash, wait for user confirmation and register for callbacks that inform your app about the sending status. The Crashes module provides callbacks for developers to perform additional actions before and when sending crash reports to Mobile Center. This gives you added flexibility on the crash reports that will be sent.

    Register as a delegate:

    **Objective-C**

        [MSCrashes setDelegate:self];

    **Swift**

        MSCrashes.setDelegate(self)

    The following delegate methods are provided:

    * **Should the crash be processed:** Implement the following delegate methods if you'd like to decide if a particular crash needs to be processed or not. For example - there could be some system level crashes that you'd want to ignore and don't want to send to Mobile Center.

        **Objective-C**

            - (BOOL)crashes:(MSCrashes *)crashes shouldProcessErrorReport:(MSErrorReport *)errorReport {
            return YES; // return YES if the crash report should be processed, otherwise NO.
            }

        **Swift**

            func crashes(_ crashes: MSCrashes!, shouldProcessErrorReport errorReport: MSErrorReport!) -> Bool {
                objectivecreturn true; // return true if the crash report should be processed, otherwise false.
            }

    * **User Confirmation:** If user privacy is important to you as a developer, you might want to get user confirmation before sending a crash report to Mobile Center. The SDK exposes a callback where you can tell it to await user confirmation before sending any crash reports.
    Your app is then responsible for obtaining confirmation, e.g. through a dialog prompt with one of these options - "Always Send", "Send", and "Don't send". You need inform the SDK about the users input and the crash will handled accordingly. The method takes a block as a parameter, use it to pass in your logic to present the UI to confirm a crash report.

        **Objective-C**

            [MSCrashes setUserConfirmationHandler:(^(NSArray<MSErrorReport *> *errorReports) {
                // Your code to present your UI to the user, e.g. an UIAlertView.
                [[[UIAlertView alloc] initWithTitle:@"Sorry we crashed."
                                            message:@"Do you want to send a report about the crash to the developer?"
                                        delegate:self
                                cancelButtonTitle:@"Don't send"
                                otherButtonTitles:@"Always send", @"Send", nil] show];

                // 2. You could also iterate over the array of error reports and base your decision on them.

            return YES; // Return YES if the SDK should await user confirmation, otherwise NO.
            }

        **Swift**

            // Crashes Delegate
            MSCrashes.setUserConfirmationHandler({ (errorReports: [MSErrorReport]) in

                // Your code to present your UI to the user, e.g. an UIAlertView.
                UIAlertView.init(title: "Sorry we crashed!", message: "Do you want to send a Crash Report?", delegate: self, cancelButtonTitle: "No", otherButtonTitles:"Always send", "Send").show()

                return true // Return true if the SDK should await user confirmation, otherwise return false.
            })

        If you return YES/true, your app should obtain user permission and message the SDK with the result using the following API. If you are using an alert for this, you would call it from within your implementation of the `alertView:clickedButtonAtIndex:`-callback.

        **Objective-C**

            // Depending on the users's choice, call notifyWithUserConfirmation: with the right value.
            [MSCrashes notifyWithUserConfirmation:MSUserConfirmationDontSend];
            [MSCrashes notifyWithUserConfirmation:MSUserConfirmationAlways];
            [MSCrashes notifyWithUserConfirmation:MSUserConfirmationSend];

        **Swift**

            // Depending on the user's choice, call notify(with:) with the right value.
            MSCrashes.notify(with: MSUserConfirmation.dontSend)
            MSCrashes.notify(with: MSUserConfirmation.send)
            MSCrashes.notify(with: MSUserConfirmation.always)

    * **Before sending a crash report:** This callback will be invoked just before the crash is sent to Mobile Center:

        **Objective-C**

            - (void)crashes:(MSCrashes *)crashes willSendErrorReport:(MSErrorReport *)errorReport {
                // Your code, e.g. to present a custom UI.
            }

        **Swift**

            func crashes(_ crashes: MSCrashes!, willSend errorReport: MSErrorReport!) {
                // Your code, e.g. to present a custom UI.
            }

    * **When sending a crash report succeeded:** This callback will be invoked after sending a crash report succeeded:

        **Objective-C**

            - (void)crashes:(MSCrashes *)crashes didSucceedSendingErrorReport:(MSErrorReport *)errorReport {
                // Your code, e.g. to hide the custom UI.
            }

        **Swift**

            func crashes(_ crashes: MSCrashes!, didSucceedSending errorReport: MSErrorReport!) {
                // Your code, e.g. to hide the custom UI.
            }

    * **When sending a crash report failed:** This callback will be invoked after sending a crash report failed:

        **Objective-C**

            - (void)crashes:(MSCrashes *)crashes didFailSendingErrorReport:(MSErrorReport *)errorReport withError:(NSError *)error {
                // Your code, e.g. to hide the custom UI.
            }

        **Swift**

            func crashes(_ crashes: MSCrashes!, didFailSending errorReport: MSErrorReport!, withError error: Error!) {
                    // Your code, e.g. to hide the custom UI.
            }
            
            

### Enabling Mach exception handling

By default, the SDK is using the safe and proven in-process BSD Signals for catching crashes. This means, that some causes for crashes, e.g. stack overflows, cannot be detected. Using a Mach exception server instead allows to detect some of those crash causes but comes with the risk of using unsafe means to detect them.

The `enableMachExceptionMethod` provides an option to enable catching fatal signals via a Mach exception server instead.

The SDK will not check if the app is running in an AppStore environment or if a debugger was attached at runtime because some developers chose to do one or both at their own risk.

**We strongly advice NOT to enable Mach exception handler in release versions of your apps!**

The Mach exception handler executes in-process and will interfere with debuggers when they attempt to suspend all active threads (which will include the Mach exception handler). Mach-based handling should _NOT_ be used when a debugger is attached. The SDK will not enable crash reporting if the app is **started** with the debugger running. If you attach the debugger **at runtime**, this may cause issues if the Mach exception handler is enabled!

If you want or need to enable the Mach exception handler, you _MUST_ call this method _BEFORE_ starting the SDK.

Your typical setup code would look like this:

**Objective-C**

      [MSCrashes enableMachExceptionHandler];
      [MSMobileCenter start:@"YOUR_APP_ID" withServices:@[[MSAnalytics class], [MSCrashes class]]];

**Swift**

      MSCrashes.enableMachExceptionHandler()
      MSMobileCenter.start("YOUR_APP_ID", withServices: [MSAnalytics.self, MSCrashes.self])
       
