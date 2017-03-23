---
title: React Native Crashes
description: Using React Native crash reporting in Mobile Center
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 363f6dc6-8f04-4b63-83e0-56e9c10bc910
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# React Native Crashes

> [!div class="op_single_selector"]
> * [iOS](ios.md)
> * [Android](android.md)
> * [Xamarin](xamarin.md)
> * [React Native](react-native.md)

Once you set up and start the Mobile Center SDK to use the Crashes module in your application, the SDK will automatically start logging any crashes in the devices local storage. When the user opens the application again after a crash, all pending crash logs will automatically be forwarded to Mobile Center and you can analyze the crash along with the stack trace on the Mobile Center portal. Refer to the section to [Get Started](~/sdk/getting-started/react-native.md) if you haven't done so already.

* **Using the Crashes API:**

   In files where you are using the Crashes SDK, import the library.

        // import the Crashes library at the top of the file
        import Crashes from "mobile-center-crashes";

* **Generate a test crash:** The SDK provides you with a static API to generate a native test crash for easy testing of the SDK:

        Crashes.generateTestCrash();

    Note that this API can only be used in test/beta apps and won't work in production apps.

    It's also easy to generate a JavaScript crash. Add the following line to your code, which throws a JavaScript error and causes a crash.

        throw new Error("Cannot read property");

    > **IMPORTANT**: Your React Native app needs to be compiled in release mode for this crash to be sent to Mobile Center.

* **Did the app crash in last session:** At any time after starting the SDK, you can check if the app crashed in the previous session:

        Crashes.hasCrashedInLastSession();

        This returns a boolean, true if the app had crashed in the previous session. False if it has not.

* **Details about the last crash:** If your app crashed previously, you can get details about the last crash:

        ErrorReport crashReport = Crashes.lastSessionCrashReport();

        This either returns a crashReport, a JavaScript object that gives details on the last crash. Or, undefined.

* **Enable or disable the Crashes module:**  You can disable and opt out of using the Crashes module by calling the `setEnabled()` API and the SDK will collect no crashes for your app. Use the same API to re-enable it by passing `true` as a parameter.

        Crashes.setEnabled(false);

    This function returns a promise, in which the success case returns an empty string, and the error case returns the error.

    You can also check if the module is enabled or not using the `isEnabled()` method:

        boolean isEnabled = Crashes.isEnabled();

    This function returns a promise, in which the success case returns a `boolean`, and the error case returns the error.

    This function returns a promise,

* <a name="process-javascript"></a>**Processing crashes in JavaScript:** During `react-native link`, the SDK will ask whether or not to send crash reports automatically or process crashes in JavaScript. Opting to process crashes first means more work for the developer, but greater control over user privacy and allows you to attach a message with a crash report.

   Processing a crash in JavaScript requires you to use the `process` method from the Crashes SDK.

        // import the Crashes library at the top of the file
        import Crashes from "mobile-center-crashes";

   Then, you can send all crashes that have been queued up since the last call to `process`.

        // send all queued crashes without additional processing
        Crashes.process((report, sendCallback) => {sendCallback(true);}).catch((err) => {});
