---
title: Mobile Center Analytics for Xamarin
description: Mobile Center Analytics for Xamarin
keywords: analytics
author: troublemakerben
ms.author: bereimol
ms.date: 06/02/2017
ms.topic: article
ms.assetid: d70cdd52-e53c-45df-89df-6394ed887174
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin
---

# Mobile Center Analytics

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

Mobile Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the Mobile Center portal for you to analyze the data.

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up the SDK in your application yet.

## 1. Session and device information

Once you add Mobile Center Analytics to your app and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc. without writing any additional code.

## 2. Custom events

You can track your own custom events with **up to five properties** to know what's happening in your app, understand user actions, and see the aggregates in the Mobile Center portal.

Once you have started the SDK, use the `TrackEvent()` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 64 characters per event property name and event property value.

```csharp
Analytics.TrackEvent("Video clicked", new Dictionary<string, string> {
	{ "Category", "Music" },
	{ "FileName", "favorite.avi"}
});
```

Properties for events are entirely optional – if you just want to track an event, use this sample instead:

```csharp
Analytics.TrackEvent("Video clicked");
```

## 3. Enable or disable Mobile Center Analytics at runtime

You can enable and disable Mobile Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.

```csharp
Analytics.Enabled = false;
```

To enable Mobile Center Analytics again, use the same API but pass `true` as a parameter.

```csharp
Analytics.Enabled = true;
```

## 4. Check if Mobile Center Analytics is enabled

You can also check if Mobile Center Analytics is enabled or not.

```csharp
bool isEnabled = Analytics.Enabled;
```
