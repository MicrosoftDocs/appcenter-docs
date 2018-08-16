---
title: App Center Analytics for Apache Cordova
description: App Center Analytics for Apache Cordova
keywords: sdk, analytics
author: ruslan-bikkinin
ms.author: v-rubikk
ms.date: 04/25/2018
ms.topic: article
ms.assetid: 8900A8A7-92E0-4904-890F-97E4831118F8
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

Please follow the [Get Started](~/sdk/getting-started/cordova.md) section if you haven't set up the SDK in your application yet.

## Session and device information

Once you add App Center Analytics to your app and the SDK is started, it will automatically track sessions and device properties like OS Version, model, etc. You don’t need to write any additional code.

## Custom events

You can track your own custom events with **up to twenty properties** to understand the interaction between your users and the app.

Once you have started the SDK, use the `trackEvent` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 125 characters per event property name and event property value.

```js
var success = function() {
    console.log("Event tracked");
}

var error = function(error) {
    console.error(error);
}
AppCenter.Analytics.trackEvent('Video clicked', { Category: 'Music', FileName: 'favorite.avi' }, success, error);
```

This function uses third parameter as success callback which returns an empty string and fourth parameter as error callback which returns an error.

Properties for events are entirely optional. If you just want to track an event, use this sample instead:

```js
var success = function() {
    console.log("Event tracked");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Analytics.trackEvent('Video clicked', success, error);
```

## Enable or disable App Center Analytics at runtime

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK will not collect analytics information for the app anymore.

```js
var success = function() {
    console.log("Analytics disabled");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Analytics.setEnabled(false, success, error);
```

This function uses second parameter as success callback which returns an empty string and third parameter as error callback which returns an error.
To enable App Center Analytics again, use the same API but pass `true` as a parameter.

```js
var success = function() {
    console.log("Analytics enabled");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Analytics.setEnabled(true, success, error);
```

## Check if App Center Analytics is enabled

You can also check whether App Center Analytics is enabled.

```js
var success = function(result) {
    console.log("analytics " + (result) ? "enabled" : "disabled");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Analytics.isEnabled(success, error);
```

This function uses first parameter as success callback which returns a `boolean` and second parameter as error callback which returns an  error.

## Wait for JS to enable App Center Analytics

In some cases, an application may want to ask users whether they want to share analytics information. In that case, you should change preference `APPCENTER_ANALYTICS_ENABLE_IN_JS` to `true` in your `config.xml`

```xml
<preference name="APPCENTER_ANALYTICS_ENABLE_IN_JS" value="true" />
```

This means that for any information to be sent to App Center (even basic session information), the developer must first enable App Center Analytics inside the app by adding the following line to his code.


```js
var success = function() {
    console.log("analytics disabled");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Analytics.setEnabled(true, success, error);
```


