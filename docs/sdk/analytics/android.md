---
title: App Center Analytics for Android
description: App Center Analytics for Android
keywords: analytics
author: troublemakerben
ms.author: bereimol
ms.date: 08/21/2017
ms.topic: article
ms.assetid: 5392ac23-465d-464d-a533-262a94cf15c3
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
---

# App Center Analytics

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.

Please follow the [Get started](~/sdk/getting-started/android.md) section if you haven't set up the SDK in your application yet.

## Session and device information

Once you add App Center Analytics to your app and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc. without writing any additional code.

## Custom events

You can track your own custom events with **up to five properties** to know what's happening in your app, understand user actions, and see the aggregates in the App Center portal.

Once you have started the SDK, use the `trackEvent()` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 64 characters per event property name and event property value.

```java
Map<String, String> properties = new HashMap<>();
properties.put("Category", "Music");
properties.put("FileName", "favorite.avi");

Analytics.trackEvent("Video clicked", properties);
```

Properties for events are entirely optional – if you just want to track an event, use this sample instead:

```java
Analytics.trackEvent("Video clicked");
```

## Enable or disable App Center Analytics at runtime

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.

```java
Analytics.setEnabled(false);
```

To enable App Center Analytics again, use the same API but pass `true` as a parameter.

```java
Analytics.setEnabled(true);
```

[!include[](../android-see-async.md)]

## Check if App Center Analytics is enabled

You can also check if App Center Analytics is enabled or not.

```java
Analytics.isEnabled();
```

[!include[](../android-see-async.md)]
