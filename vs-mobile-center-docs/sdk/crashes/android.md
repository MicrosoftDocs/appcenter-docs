---
title: Android Crashes
description: Using Android crash reporting in Mobile Center
keywords: sdk, crash
author: elamalani
---

# Android Crashes

Once you set up and start the Mobile Center SDK to use the Crashes module in your application, the SDK will automatically start logging any crashes in the device's local storage. When the user opens the application again, all pending crash logs will automatically be forwarded to Mobile Center and you can analyze the crash along with the stack trace on the Mobile Center portal. Refer to the [Getting Started](/sdk/Android/getting-started) section to set up and start the SDK if you haven't done so already.

* **Generate a test crash:** The SDK provides you with a static API to generate a test crash for easy testing of the SDK:

        Crashes.generateTestCrash();

    Note that this API can only be used in test/beta apps and won't work in production apps.

* **Did the app crash in last session:** At any time after starting the SDK, you can check if the app crashed in the previous session:

        Crashes.hasCrashedInLastSession();

* **Details about the last crash:** If your app crashed previously, you can get details about the last crash:

        ErrorReport crashReport = Crashes.getLastSessionCrashReport();

* **Enable or disable the Crashes module:**  You can disable and opt out of using the Crashes module by calling the `setEnabled()` API and the SDK will collect no crashes for your app. Use the same API to re-enable it by passing `true` as a parameter.

        Crashes.setEnabled(false);

    You can also check if the module is enabled or not using the `isEnabled()` method:

        Crashes.isEnabled();

* **Advanced Scenarios:**  The Crashes module provides callbacks for developers to perform additional actions before and when sending crash reports to Mobile Center. This gives you added flexibility on the crash reports that will be sent.
To handle the callbacks, you must either implement all methods in the `CrashesListener` interface, or override the `AbstractCrashesListener` class and pick only the ones you're interested in.
You create your own Crashes listener and assign it like this:


        CrashesListener customListener = new CrashesListener() {
          // implement callbacks as seen below
        };
        Crashes.setListener(customListener);

    The following callbacks are provided:

    * **Should the crash be processed:** Implement this callback if you'd like to decide if a particular crash needs to be processed or not. For example - there could be some system level crashes that you'd want to ignore and don't want to send to Mobile Center.

          boolean CrashesListener.shouldProcess(ErrorReport report) {
            return true; // return true if the crash report should be processed, otherwise false.
          }

    * **User Confirmation:** If user privacy is important to you as a developer, you might want to get user confirmation before sending a crash report to Mobile Center. The SDK exposes a callback where you can tell it to await user confirmation before sending any crash reports.
    Your app is then responsible for obtaining confirmation, e.g. through a dialog prompt with one of these options - "Always Send", "Send", and "Don't send". Based on the user input, you will tell the SDK and the crash will then respecetively be forwarded to Mobile Center or not.

          boolean CrashesListener.shouldAwaitUserConfirmation() {
            return true; // Return true if the SDK should await user confirmation, otherwise false.
          }

        If you return `true`, your app should obtain user permission and message the SDK with the result using the following API:

          Crashes.notifyUserConfirmation(int userConfirmation);

        Pass one option of `SEND`, `DONT_SEND` or `ALWAYS_SEND`.

    * **Binary attachment:**  If you'd like to attach text/binary data to a crash report, implement this callback. Before sending the crash, our SDK will add the attachment to the crash report and you can view it on the Mobile Center portal.


          ErrorAttachment CrashesListener.getErrorAttachment(ErrorReport report) {
            // return your own created ErrorAttachment object
          }

    * **Before sending a crash report:** This callback will be invoked just before the crash is sent to Mobile Center:

          void CrashesListener.onBeforeSending(ErrorReport report) {
            …
          }

    * **When sending a crash report succeeded:** This callback will be invoked after sending a crash report succeeded:

          void CrashesListener.onSendingSucceeded(ErrorReport report) {
            …
          }

    * **When sending a crash report failed:** This callback will be invoked after sending a crash report failed:

          void CrashesListener.onSendingFailed(ErrorReport report, Exception e) {
            …
          }
