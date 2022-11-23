---
title: App Center Crashes for Apache Cordova
description: App Center Crashes for Apache Cordova
keywords: sdk, crash
author: lucen-ms
ms.author: lucen
ms.date: 01/12/2021
ms.topic: article
ms.assetid: B4CF1969-CD4B-44E0-A59D-634A6A0A6FA1
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# App Center Crashes (Cordova)
> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [MAUI/Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

> [!NOTE] 
> Support for Cordova Apps has ended in April 2022. Find more information in the [App Center blog](https://devblogs.microsoft.com/appcenter/announcing-apache-cordova-retirement/).

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Follow the [Getting Started](~/sdk/getting-started/cordova.md) section if you haven't set up the SDK in your application yet.

## Generate a test crash

App Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.

```js
AppCenter.Crashes.generateTestCrash();
```

> [!NOTE]
> Your Cordova app needs to be compiled in release mode for this crash to be sent to App Center.

## Get more information about a previous crash

App Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app receive a low memory warning in the previous session?

At any time after starting the SDK, you can check if the app received a memory warning in the previous session:

```js
var success = function(hadLowMemoryWarning) {
    console.log(`there was ${hadLowMemoryWarning ? "a" : "no"} memory warning`);
}

var error = function(error) {
    console.error(error);
}

AppCenter.Crashes.hasReceivedMemoryWarningInLastSession(success, error);
```

> [!NOTE]
> In some cases, running a device's memory low may not trigger trackable events.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```js
var success = function(didCrash) {
    console.log("there was " + (didCrash ? "a" : "no") + " crash");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Crashes.hasCrashedInLastSession(success, error);
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occurred. Some developers may want to show something to apologize to their users, or to get in touch after a crash has occurred.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```js
var success = function(crashReport) {
    //do something with crash report
}

var error = function(error) {
    console.error(error);
}

AppCenter.Crashes.lastSessionCrashReport(success, error);
```

## Customize your usage of App Center Crashes

App Center Crashes provides abilities for developers to perform additional actions before and when sending crash logs to App Center.

### Processing crashes in JavaScript

You can configure SDK to send crash reports automatically or process crashes in JavaScript by changing preference `APPCENTER_CRASHES_ALWAYS_SEND` value in **config.xml**. To process crashes in JavaScript set it to `false`.

```xml
<preference name="APPCENTER_CRASHES_ALWAYS_SEND" value="false" />
```

Then you can use `AppCenter.Crashes.process(processFunction, errorCallback)` method to customize crashes procession.

### Should the crash be processed?

Pass `false` to the `sendCallback` if you want to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to App Center.

```js
var errorCallback = function(error) {
    console.error(error);
};

var processFunction = function(attachments, sendCallback) {
    sendCallback(false); //crash won't be sent
};

AppCenter.Crashes.process(processFunction, errorCallback);
```

Otherwise, pass `true` to the `sendCallback` function, and the crash will be sent.

```js
var errorCallback = function(error) {
    console.error(error);
};

var processFunction = function(attachments, sendCallback) {
    sendCallback(true); //crash will be sent
};

AppCenter.Crashes.process(processFunction, errorCallback);
```

> [!NOTE]
> To use this feature you need to set `APPCENTER_CRASHES_ALWAYS_SEND` preference value in **config.xml** to `false`.
> 
> This feature is thus dependent on [Processing Crashes](#processing-crashes-in-javascript) in JavaScript.

### Add attachments to a crash report

You can add binary and text attachments to a crash report. The SDK will send them along with the crash so that you can see them in App Center portal. The following callback will be invoked right before sending stored crash from previous application launches, but not at the crash time. Be sure the attachment file is **not** named `minidump.dmp` as that name is reserved for minidump files. Here is an example of how to attach a text and an image to a crash:

```js
var errorCallback = function(error) {
    console.error(error);
};

var processFunction = function(attachments, sendCallback) {
    for (var i = 0; i < attachments.length; i++) {
        attachments[i].addTextAttachment('Hello text attachment!', 'hello.txt');
        var imageAsBase64string = '...';
        attachments[i].addBinaryAttachment(imageAsBase64string, 'logo.png', 'image/png');
    }
    sendCallback(true); //crash will be sent
};

AppCenter.Crashes.process(processFunction, errorCallback);
```

> [!NOTE]
> To use that feature you need to set `APPCENTER_CRASHES_ALWAYS_SEND` preference value in **config.xml** to `false`.
> 
> This feature is thus dependent on [Processing Crashes](#processing-crashes-in-javascript) in JavaScript.
> 
> [!NOTE]
> The size limit is currently 1.4 MB on Android and 7 MB on iOS. Attempting to send a larger attachment will trigger an error.

## Enable or disable App Center Crashes at runtime

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK won't do any crash reporting for the app.

```js
var success = function() {
    console.log("crashes disabled");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Crashes.setEnabled(false, success, error);
```

To enable App Center Crashes again, use the same API but pass `true` as a parameter.

```js
var success = function() {
    console.log("crashes enabled");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Crashes.setEnabled(true, success, error);
```

The state is persisted in the device's storage across application launches.

## Check if App Center Crashes is enabled

You can also check whether App Center Crashes is enabled:

```js
var success = function(result) {
    console.log("crashes " + (result) ? "enabled" : "disabled");
}

var error = function(error) {
    console.error(error);
}
AppCenter.Crashes.isEnabled(success, error);
```
