---
title: App Center Crashes for React Native
description: App Center Crashes for React Native
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 10/29/2018
ms.topic: article
ms.assetid: 363f6dc6-8f04-4b63-83e0-56e9c10bc910
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# App Center Crashes

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [UWP](uwp.md)
> * [Cordova](cordova.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to Google Play. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/react-native.md) section if you haven't set up the SDK in your application yet.

Wherever you are using App Center Crashes, add the following import at the top of the file.
```javascript
// Import App Center Crashes at the top of the file.
import Crashes from 'appcenter-crashes';
```

## Generate a test crash

App Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.

```
Crashes.generateTestCrash();
```

It's also easy to generate a JavaScript crash. Add the following line to your code, which throws a JavaScript error and causes a crash.

```javascript
throw new Error('This is a test javascript crash!');
```

> [!TIP]
> Your React Native app needs to be compiled in **release mode** for this crash to be sent to App Center.

> [!NOTE]
> It is best practice to avoid JavaScript `throw` statement with a string value (e.g.: `throw 'message'`), as [React Native doesn't preserve full JavaScript stack](https://github.com/facebook/react-native/blob/v0.57.1/Libraries/Core/ExceptionsManager.js#L67-L71) in this scenario. Please `throw` a JavaScript `Error` (e.g.: `throw Error('message')`) instead.

## Get more information about a previous crash

App Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```javascript
const didCrash = await Crashes.hasCrashedInLastSession();
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occurred. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occurred.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```javascript
const crashReport = await Crashes.lastSessionCrashReport();
```

## Customize your usage of App Center Crashes

App Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to App Center.

### <a name="process"></a> Processing crashes in JavaScript

During `react-native link`, the SDK will ask whether or not to send crash reports automatically or process crashes in JavaScript. You need to answer
to process in Javascript for any of the `Crashes.setListener` methods to work as expected.

All the different callbacks of the event listener are discussed one by one
in this document, but you need to set one event listener that define all callbacks at once.

### Should the crash be processed?

Implement this callback if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to App Center.

```javascript
Crashes.setListener({

    shouldProcess: function (report) {
        return true; // return true if the crash report should be processed, otherwise false.
    },

    // Other callbacks must also be defined at the same time if used.
    // Default values are used if a method with return parameter is not defined.
});
```

> [!NOTE]
> To use that feature you need to have answered **Processed in JavaScript by user** when executing `react-native link` for the Crash service configuration.
> 
> This feature is thus dependent on [Processing crashes in JavaScript](#process).

### Ask for the users' consent to send a crash log

If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to App Center. The SDK exposes a callback that tells App Center Crashes to await your users' confirmation before sending any crash reports.

If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of the following options: **Always Send**, **Send**, and **Don't send**. Based on the input, you will tell the App Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> No dialog is shown by the SDK, it is up to you to provide UI code if you want to ask for users' consent.

The following callback shows how to tell the SDK to wait for user confirmation before sending crashes:

```javascript
Crashes.setListener({

    shouldAwaitUserConfirmation: function (report) {

        // Build your own UI to ask for user consent here. SDK does not provide one by default.

        // Return true if you just built a UI for user consent and are waiting for user input on that custom UI, otherwise false.
        return true;
    },

    // Other callbacks must also be defined at the same time if used.
    // Default values are used if a method with return parameter is not defined.
});
```

If you return `true`, your app must obtain (using your own code) the user's permission and message the SDK with the result using the following API:

```javascript
import Crashes, { UserConfirmation } from 'appcenter-crashes';

// Depending on the user's choice, call Crashes.notifyUserConfirmation() with the right value.
Crashes.notifyUserConfirmation(UserConfirmation.DONT_SEND);
Crashes.notifyUserConfirmation(UserConfirmation.SEND);
Crashes.notifyUserConfirmation(UserConfirmation.ALWAYS_SEND);
```

> [!NOTE]
> To use that feature you need to have answered **Processed in JavaScript by user** when executing `react-native link` for the Crash service configuration.
> 
> This feature is thus dependent on [Processing crashes in JavaScript](#process).

### Get information about the sending status for a crash log

At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. App Center Crashes has three different callbacks that you can use in your app to be notified of what is going on.

To do that you have to define an event listener in your code as in the following example:

```javascript
Crashes.setListener({
    onBeforeSending: function (report) {
        // called after Crashes.process and before sending the crash.
    },
    onSendingSucceeded: function (report) {
        // called when crash report sent successfully.
    },
    onSendingFailed: function (report) {
        // called when crash report could not be sent.
    }

    // Other callbacks must also be defined at the same time if used.
    // Default values are used if a method with return parameter is not defined.
});
```

All callbacks are optional. You don't have to provide all 3 methods in the event listener object, for example you can implement only `onBeforeSending`.

> [!NOTE]
> To use that feature you need to have answered **Processed in JavaScript by user** when executing `react-native link` for the Crash service configuration.
> 
> This feature is thus dependent on [Processing crashes in JavaScript](#process).

> [!NOTE]
> If `Crashes.setListener` is called more than once, the last one wins--it overrides listeners previously set by `Crashes.setListener`.

### Add attachments to a crash report

You can add **one binary** and **one text** attachment to a crash report. The SDK will send it along with the crash so that you can see it in App Center portal. The following callback will be invoked if you want to add attachments to a crash report. Here is an example to attach a text and an image to a crash:

```javascript
import Crashes, { ErrorAttachmentLog } from 'appcenter-crashes';

Crashes.setListener({
    getErrorAttachments(report) {
        const textAttachment = ErrorAttachmentLog.attachmentWithText('Hello text attachment!', 'hello.txt');
        const binaryAttachment = ErrorAttachmentLog.attachmentWithBinary(`${imageAsBase64string}`, 'logo.png', 'image/png');
        return [textAttachment, binaryAttachment];
    }

    // Other callbacks must also be defined at the same time if used.
    // Default values are used if a method with return parameter is not defined.
});
```

In case you want to setup the `getErrorAttachments` callback to work with ES2017 async/await functions, you can return a fulfilled Promise instead. The following example attaches a text and an image to a crash in an async fashion:

```javascript
import Crashes, { ErrorAttachmentLog } from 'appcenter-crashes';

Crashes.setListener({
    getErrorAttachments(report) {
        return (async () => {
            const textContent = await readTextFileAsync(); // use your async function to read text file
            const binaryContent = await readBinaryFileAsync(); // use your async function to read binary file
            const textAttachment = ErrorAttachmentLog.attachmentWithText(textContent, 'hello.txt');
            const binaryAttachment = ErrorAttachmentLog.attachmentWithBinary(binaryContent, 'logo.png', 'image/png');
            return [textAttachment, binaryAttachment];
        })();
    }

    // Other callbacks must also be defined at the same time if used.
    // Default values are used if a method with return parameter is not defined.
});
```

> [!NOTE]
> To use that feature you need to have answered **Processed in JavaScript by user** when executing `react-native link` for the Crash service configuration.
> 
> This feature is thus dependent on [Processing crashes in JavaScript](#process).
> 
> [!NOTE]
> The size limit is currently 1.4 MB on Android and 7 MB on iOS. Attempting to send a larger attachment will trigger an error.

## Enable or disable App Center Crashes at runtime

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

```javascript
await Crashes.setEnabled(false);
```

To enable App Center Crashes again, use the same API but pass `true` as a parameter.

```javascript
await Crashes.setEnabled(true);
```

## Check if App Center Crashes is enabled

You can also check if App Center Crashes is enabled or not:

```java
const enabled = await Crashes.isEnabled();
```
