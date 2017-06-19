---
title: Mobile Center Crashes for React Native
description: Mobile Center Crashes for React Native
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 06/07/2017
ms.topic: article
ms.assetid: 363f6dc6-8f04-4b63-83e0-56e9c10bc910
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# Mobile Center Crashes

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)

Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to Google Play. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/react-native.md) section if you haven't set up the SDK in your application yet.

Wherever you are using Mobile Center Crashes, add the following import at the top of the file.
```javascript
// Import Mobile Center Crashes at the top of the file.
import Crashes from "mobile-center-crashes";
```

## Generate a test crash

Mobile Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.

```
Crashes.generateTestCrash();
```

It's also easy to generate a JavaScript crash. Add the following line to your code, which throws a JavaScript error and causes a crash.

```javascript
throw new Error("This is a test javascript crash!");
```

> [!TIP]
> Your React Native app needs to be compiled in **release mode** for this crash to be sent to Mobile Center.

## Get more information about a previous crash

Mobile Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```javascript
Crashes.hasCrashedInLastSession();
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occured. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occured.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```javascript
ErrorReport crashReport = Crashes.lastSessionCrashReport();
```

## Processing crashes in JavaScript

During `react-native link`, the SDK will ask whether or not to send crash reports automatically or process crashes in JavaScript. Opting to process crashes first means more work for the developer, but greater control over user privacy and allows you to attach a message with a crash report.

Processing a crash in JavaScript requires you to use the `process` method from Mobile Center Crashes.

```javascipt
// import the Crashes library at the top of the file
import Crashes from "mobile-center-crashes";
```

Then, you can send all crashes that have been queued up since the last call to `process`.

```javascript
// send all queued crashes without additional processing
Crashes.process((report, sendCallback) => {sendCallback(true);}).catch((err) => {});
```

## Enable or disable Mobile Center Crashes at runtime

You can enable and disable Mobile Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

```javascript
Crashes.setEnabled(false);
```

To enable Mobile Center Crashes again, use the same API but pass `true` as a parameter.

```javascript
Crashes.setEnabled(true);
```

## Check if Mobile Center Crashes is enabled

You can also check if Mobile Center Crashes is enabled or not:

```java
Crashes.isEnabled();
```