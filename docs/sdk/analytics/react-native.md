---
title: App Center Analytics for React Native
description: App Center Analytics for React Native
keywords: analytics
author: elamalani
ms.author: emalani
ms.date: 05/08/2019
ms.topic: article
ms.assetid: fde989ce-6c8b-4ec5-9efb-07d14bc22afb
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# App Center Analytics

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.

Please follow the [Getting started section](~/sdk/getting-started/react-native.md) if you haven't set up the SDK in your application yet.

## Session and device information

Once you add App Center Analytics to your app and the SDK is started, it automatically tracks sessions and device properties like OS Version, model, etc. You don’t need to write any additional code.

## Custom events

Track your own custom events with **up to twenty properties** to understand the interaction between your users and the app.

Once you have started the SDK, use the `trackEvent` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 125 characters per event property name and event property value.

```javascript
// import App Center Analytics at the top of the file.
import Analytics from 'appcenter-analytics';

Analytics.trackEvent('Video clicked', { Category: 'Music', FileName: 'favorite.avi' });
```

This function returns a promise, the success case returns an empty string and the error case returns the error.

Properties for events are optional; if you just want to track an event, use this instead:

```javascript
Analytics.trackEvent('Video clicked');
```

## Enable or disable App Center Analytics at runtime

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.

```javascript
await Analytics.setEnabled(false);
```

This function returns a promise that resolves to void.

To enable App Center Analytics again, use the same API but pass `true` as a parameter.

```javascript
await Analytics.setEnabled(true);
```

The state is persisted in the device's storage across application launches.

## Check if App Center Analytics is enabled

You can also check if App Center Analytics is enabled or not.

```javascript
const enabled = await Analytics.isEnabled();
```

This function returns a promise that resolves to a `boolean`.

## Wait for JS to enable App Center Analytics

If you wish to collect analytics information for your app users but want to get user permission first, you have the option to not enable analytics on startup, but wait until the right time and enable it in JavaScript instead.

1. Open the project's `ios/YourAppName/AppDelegate.m` file and replace `[AppCenterReactNativeAnalytics registerWithInitiallyEnabled:true];` with `[AppCenterReactNativeAnalytics registerWithInitiallyEnabled:false];`.
2. Open the project's `android/app/src/main/res/values/strings.xml` file and replace `<string name="appCenterAnalytics_whenToEnableAnalytics" moduleConfig="true" translatable="false">ALWAYS_SEND</string>` with `<string name="appCenterAnalytics_whenToEnableAnalytics" moduleConfig="true" translatable="false">ENABLE_IN_JS</string>`.

This means that for any information to be sent to App Center (even basic session information), you must first enable App Center Analytics inside the app by adding the following line to their code.

```javascript
await Analytics.setEnabled(true);
```

## Local storage size

By default, the SDK stores up to 10MB of logs in the storage.

## No internet access

When there is no network connectivity, the SDK saves up to 10MB of logs in the local storage. Once the storage is full, the SDK will start discarding old logs to make room for the new logs. Once the device gets internet access back, the SDK will send logs in the batch of 50 or after every 3 seconds.

## Batching event logs

The App Center SDK uploads logs in a batch of 50 and if the SDK doesn't have 50 logs to send, it will still send logs after 3 seconds. There can be a maximum of 3 batches sent in parallel.

## Retry and back-off logic

App Center SDK supports back-off retries on recoverable network errors. Below is the retry logic:
* 3 tries maximum per request.
* Each request has its own retry state machine.
* All the transmission channels are disabled (until next app process) after 1 request exhausts all its retries.

Back-off logic
* 50% randomization, 1st retry between 5 and 10s, second retry between 2.5 and 5 minutes, last try between 10 and 20 minutes.
* If network switches from off to on (or from wi-fi to mobile), retry states are reset and requests are retried immediately.