---
title: App Center Analytics for Xamarin
description: App Center Analytics for Xamarin
keywords: analytics
author: troublemakerben
ms.author: bereimol
ms.date: 11/20/2018
ms.topic: article
ms.assetid: d70cdd52-e53c-45df-89df-6394ed887174
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: xamarin
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

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up the SDK in your application yet.

## Session and device information

Once you add App Center Analytics to your app and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc. without writing any additional code.

## Custom events

You can track your own custom events with **up to twenty properties** to understand the interaction between your users and the app.

Once you have started the SDK, use the `TrackEvent()` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 125 characters per event property name and event property value.

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

## Enable or disable App Center Analytics at runtime

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.

```csharp
Analytics.SetEnabledAsync(false);
```

To enable App Center Analytics again, use the same API but pass `true` as a parameter.

```csharp
Analytics.SetEnabledAsync(true);
```

You don't need to await this call to make other API calls (such as `IsEnabledAsync`) consistent.

## Check if App Center Analytics is enabled

You can also check if App Center Analytics is enabled or not.

```csharp
bool isEnabled = await Analytics.IsEnabledAsync();
```
