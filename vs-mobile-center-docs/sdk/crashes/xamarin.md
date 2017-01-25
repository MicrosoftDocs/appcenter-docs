---
title: Xamarin Crashes
description: Using Xamarin crash reporting in Mobile Center
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 01/20/17
ms.topic: article
ms.assetid: 6a102584-57ad-4b84-9fa1-8c2fd8b903ef
ms.service: mobile-center
---

# Xamarin Crashes

> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)
- [Xamarin](xamarin.md)
- [React Native](react-native.md)

Once you set up and start the Mobile Center SDK to use the Crashes module in your application, the SDK will automatically start logging any crashes in the device's local storage. When the user opens the application again, all pending crash logs will automatically be forwarded to Mobile Center and you can analyze the crash along with the stack trace on the Mobile Center portal. Refer to the [Getting Started](/sdk/Xamarin/getting-started) section to set up and start the SDK if you haven't done so already.

* **Generate a test crash:** The SDK provides you with a static API to generate a test crash for easy testing of the SDK:

        Crashes.GenerateTestCrash();

    Note that this API checks for debug vs release configurations. So you can use only use it when debuging as it won't work for release apps.

* **Did the app crash in last session:** At any time after starting the SDK, you can check if the app crashed in the previous session:

        bool didAppCrash = Crashes.HasCrashedInLastSession;

* **Enable or disable the Crashes module:**  You can disable and opt out of using the Crashes module by calling the `Enabled` property and the SDK will collect no crashes for your app. Use the same API to re-enable it by setting property as `true`.

        Crashes.Enabled = true;

    You can also check if the module is enabled or not using:

        bool isEnabled = Crashes.Enabled;

* **Details about the last crash:** If your app crashed previously, you can get details about the last crash:

        ErrorReport crashReport = Crashes.LastSessionCrashReport;

* **Advanced Scenarios:**  The Crashes service provides events and callbacks for developers to perform additional actions before and when sending crash reports to Mobile Center. This gives you added flexibility on the crash reports that will be sent.
Note that the events must be subscribed to and callbacks must be set before Mobile Center is started.

The following callbacks are provided:

* **Should the crash be processed:** Set this callback if you'd like to decide if a particular crash needs to be processed or not. For example - there could be some system level crashes that you'd want to ignore and don't want to send to Mobile Center.

        Crashes.ShouldProcessErrorReport = (report) =>
        {
                return true; // return true if the crash report should be processed, otherwise false.
        };

* **Error attachment:**  If you'd like to attach text/binary data to a crash report, implement this callback. Before sending the crash, our SDK will add the attachment to the crash report and you can view it on the Mobile Center portal.

        Crashes.GetErrorAttachment = (report) =>
        {
            // return your own created ErrorAttachment object
       	}

* **User Confirmation:** By default the SDK automatically sends crash reports to Mobile Center. However, the SDK exposes a callback where you can tell it to await user confirmation before sending any crash reports.
    Your app is then responsible for obtaining confirmation, e.g. through a alert with one of these options - "Always Send", "Send", and "Don't Send". Based on the user input, you will tell the SDK and the crash will then respectively be forwarded to Mobile Center or not.

        Crashes.ShouldAwaitUserConfirmation = () =>
        {
            return true; // Return true if the SDK should await user confirmation, otherwise false.
        };

 If you return `true`, your app should obtain user permission and message the SDK with the result using the following API:

        Crashes.NotifyUserConfirmation(UserConfirmation confirmation);

 Pass one of `UserConfirmation.Send`, `UserConfirmation.DontSend` or `UserConfirmation.AlwaysSend`.

 The following events are provided:

 * **Before sending a crash report:** This callback will be invoked just before the crash is sent to Mobile Center:

        Crashes.SendingErrorReport += (sender, e) =>
        {
        	...
        };

 * **When sending a crash report succeeded:** This callback will be invoked after sending a crash report succeeded:

        Crashes.SentErrorReport += (sender, e) =>
        {
        	...
        };

 * **When sending a crash report failed:** This callback will be invoked after sending a crash report failed:

        Crashes.FailedToSendErrorReport += (sender, e) =>
        {
        	...
        };
