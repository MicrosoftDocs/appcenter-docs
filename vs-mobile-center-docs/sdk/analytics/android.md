---
title: Mobile Center Analytics
description: Mobile Center Analytics for Android
keywords: analytics
author: troublemakerben
ms.author: bereimol
ms.date: 04/14/2017
ms.topic: article
ms.assetid: 5392ac23-465d-464d-a533-262a94cf15c3
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

1. [Session and device information](#1-session-and-device-information)
2. [Custom events](#2-custom-events)
3. [Enable or disable Mobile Center Analytics at runtime](#3-enable-or-disable-mobile-center-analytics-at-runtime)
4. [Check if Mobile Center Analytics is enabled](#4-check-if-mobile-center-analytics-is-enabled)

# Mobile Center Analytics

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)

Mobile Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count, device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the Mobile Center portal for you to analyze the data.

Please follow the [Getting Started](~/sdk/getting-started/android.md) section if you haven't setup and started the SDK in your application yet.

For more information about custom events in Mobile Center, go to [Events Metrics](~/analytics/understand-events.md). 

## 1. Session and device information

Once you add Mobile Center Analytics to your app and the SDK is started, it will automatically track sessions and device properties like OS Version, model, manufacturer etc. You don’t need to add any additional code.

## 2. Custom events

You can track your own custom events with **up to five properties** to know what's happening in your app, understand user actions, and see the aggregates in the Mobile Center portal.

Once you have started the SDK, use the `trackEvent()` method to track your events with properties. You can send **up to 200 distinct event names**. Also, note that there is a maximum of 256 characters supported per event name and 64 characters per event property name and event property value.

```java
Map<String,String>properties=new HashMap<String,String>();
properties.put("Category", "Music");
properties.put("FileName", "favorite.avi");

Analytics.trackEvent("Video clicked", properties);
```

Properties for events are entirely optional – if you just want to track an event, use this sample instead:

```java
Analytics.trackEvent("Video clicked");
```

For more information about custom events in Mobile Center, go to [Events Metrics](~/analytics/understand-events.md). 

## 3. Enable or disable Mobile Center Analytics at runtime

You can enable and disable Mobile Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.

```java
Analytics.setEnabled(false);
```

To enable Mobile Center Analytics again, use the same API but pass `true` as a parameter.

```java
Analytics.setEnabled(true);
```

## 4. Check if Mobile Center Analytics is enabled

You can also check if Mobile Center Analytics is enabled or not:

```java
Analytics.isEnabled();
```