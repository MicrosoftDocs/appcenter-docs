---
title: App Center Analytics for Unity
description: App Center Analytics for Unity
keywords: unity
author: jwhitedev
ms.author: jawh
ms.date: 02/14/2019
ms.topic: article
ms.assetid: a0e3bd7d-546a-47ce-ab24-ce9eafc28701
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: unity
---

# App Center Analytics

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Unity](unity.md)
> * [Xamarin](xamarin.md)
> * [MacOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](Cordova.md)

App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.

Follow the instructions in the [Unity Get started](~/sdk/getting-started/unity.md) section if you haven't set up the SDK in your application yet.

>[!NOTE]
>To use the APIs presented below, you must add the following `using` statement to your `.cs` file:
>```csharp
>using Microsoft.AppCenter.Unity.Analytics;
>```
>You also must make sure that **Use Analaytics** is checked in the settings of your App Center game object.

## Session and device information

Once you add App Center Analytics and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc. without requiring any additional code in your app.

## Custom events

You can track your own custom events with up to 20 properties to know what's happening in your app, understand user actions, and see the aggregates in the App Center portal.

Use the `TrackEvent()` method to track your events with properties. You can send up to 200 distinct event names. There's a maximum limit of 256 characters per event name and 125 characters per event property name and value.

```csharp
Analytics.TrackEvent("Video clicked", new Dictionary<string, string> {
	{ "Category", "Music" },
	{ "FileName", "favorite.avi" }
});
```

Properties for events are optional – if you just want to track an event, use this sample instead:

```csharp
Analytics.TrackEvent("Video clicked");
```

>[!WARNING]
>`Analytics.TrackEvent()` will behave inconsistently across platforms if it is called prior to the `Awake()` method in the script `AppCenterBehavior.cs`. To be safe, you should only rely on events to be sent after the first scene in your application has awakened all of the `MonoBehaviour` scripts. To track an event in conjunction with a `MonoBehavour`'s initialization, consider adding the API to your script's `Start()` method instead of `Awake()`.

## Enable or disable App Center Analytics at runtime

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK will stop collecting analytics information for the app. To disable Analytics, use the following API, passing `false` as a parameter.

```csharp
Analytics.SetEnabledAsync(false);
```

To enable App Center Analytics again, use the same API but pass `true` as a parameter.

```csharp
Analytics.SetEnabledAsync(true);
```

The state is persisted in the device's storage across application launches.

[!include[](../unity-see-async.md)]

## Check if App Center Analytics is enabled

You can also check if App Center Analytics is enabled or not.

```csharp
bool isEnabled = await Analytics.IsEnabledAsync();
```

## Event priority and persistence

You can track business critical events that have higher importance than other events.

Developers can set persistence of events as **Normal** (`Flags.PersistenceNormal` in the API) or **Critical** (`Flags.PersistenceCritical` in the API).

You can use the following API to track an event as **Critical**:

```csharp
Analytics.TrackEvent("eventName", Flags.PersistenceCritical);
```

If you're using properties:
```csharp
Analytics.TrackEvent("eventName", new Dictionary<string, string> {
	{ "Category", "Music" },
	{ "FileName", "favorite.avi" }
}, Flags.PersistenceCritical);
```

## Pause and resume sending logs

Pausing the event transmission can be useful in scenarios when the app needs to control the network bandwidth for more business critical needs. You can pause sending logs to the App Center backend. When paused, events can still be tracked and saved, but they aren't sent right away. Any events your app tracks while paused will only be sent once you call `Analytics.Resume`.

```csharp
Analytics.Pause();
Analytics.Resume();
```

[!include[](../unity-see-async.md)]

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