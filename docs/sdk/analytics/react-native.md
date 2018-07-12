---
title: App Center Analytics for React Native
description: App Center Analytics for React Native
keywords: analytics
author: elamalani
ms.author: elamalani
ms.date: 07/04/2018
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
> * [macOS](macos.md)
> * [Cordova](cordova.md)

App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.

Please follow the [Get started](~/sdk/getting-started/react-native.md) section if you haven't set up the SDK in your application yet.

## Session and device information

Once you add App Center Analytics to your app and the SDK is started, it will automatically track sessions and device properties like OS Version, model, etc. You don’t need to write any additional code.

## Custom events

You can track your own custom events with **up to twenty properties** to understand the interaction between your users and the app.

Once you have started the SDK, use the `trackEvent` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 125 characters per event property name and event property value.

```javascript
// import App Center Analytics at the top of the file.
import Analytics from 'appcenter-analytics';

Analytics.trackEvent('Video clicked', { Category: 'Music', FileName: 'favorite.avi' });
```

This function returns a promise, in which the success case returns an empty string, and the error case returns the error.

Properties for events are entirely optional. If you just want to track an event, use this sample instead:

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

## Check if App Center Analytics is enabled

You can also check if App Center Analytics is enabled or not.

```javascript
const enabled = await Analytics.isEnabled();
```

This function returns a promise that resolves to a `boolean`.

## Wait for JS to enable App Center Analytics

If you wish to collect analytics information for your app users but want to get user permission first, you have the option to not enable analytics on startup, but wait until the right time and enable it in JavaScript instead. In that case, during installation, you should select `Enable in JavaScript` instead of `Enable Automatically` during `react-native link`.

```
For the [platform] app, should user tracking be enabled automatically ? (Use arrow keys)
          Enable Automatically
        > Enable in JavaScript
```

This means that for any information to be sent to App Center (even basic session information), you must first enable App Center Analytics inside the app by adding the following line to their code.

```javascript
await Analytics.setEnabled(true);
```
