---
title: App Center Analytics for Android
description: App Center Analytics for Android
keywords: analytics
author: lucen-ms
ms.author: lucen
ms.date: 06/19/2020
ms.topic: article
ms.assetid: 5392ac23-465d-464d-a533-262a94cf15c3
ms.service: vs-appcenter-sdk
ms.custom: sdk
ms.tgt_pltfrm: android
dev_langs:
 - java
 - kotlin
---

# App Center Analytics (Android)

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Windows](windows.md)
> * [Xamarin](xamarin.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.

Follow the [SDK Getting started](~/sdk/getting-started/android.md) section if you haven't set up the SDK in your application yet.

## Session and device information

Once you add App Center Analytics to your app and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc. without writing any additional code.

## Custom events

You can track your own custom events with **up to 20 properties** to understand the interaction between your users and the app.

Once you've started the SDK, use the `trackEvent()` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there's maximum character limits: 
- 256 characters per `event name`. 
- 125 characters per `event property name` & `event property value`.

```java
Map<String, String> properties = new HashMap<>();
properties.put("Category", "Music");
properties.put("FileName", "favorite.avi");

Analytics.trackEvent("Video clicked", properties);
```
```kotlin
val properties = hashMapOf("Category" to "Music", "FileName" to "favorite.avi")
Analytics.trackEvent("Video clicked", properties)
```

Properties for events are entirely optional – if you just want to track an event, use this sample instead:

```java
Analytics.trackEvent("Video clicked");
```
```kotlin
Analytics.trackEvent("Video clicked")
```

## Event priority and persistence

You can track business critical events that have higher importance than other events.

* Developers can set priority of events as **Normal** (`Flags.NORMAL` in the API) or **Critical** (`Flags.CRITICAL` in the API).
* Events with priority set as **Critical** will be retrieved from storage first and sent before **Normal** events.
* When the local storage is full, and new events need to be stored, the oldest events with the lowest priority are deleted first.
* If the storage is full of logs with **Critical** priority, then tracking an event with
**Normal** priority will fail as the SDK can't make room in that case.
* If you also use the **Crashes** service, crash logs are set as **Critical** and share the same storage as events.
* The transmission interval is only applied to **Normal** events, **Critical** events will be sent after 3 seconds.

You can use the following API to track an event as **Critical**:

```java
Map<String, String> properties = new HashMap<>();
properties.put("Category", "Music");
properties.put("FileName", "favorite.avi");

Analytics.trackEvent("eventName", properties, Flags.CRITICAL);

// If you're using name only, you can pass null as properties.
```
```kotlin
val properties = hashMapOf("Category" to "Music", "FileName" to "favorite.avi")
Analytics.trackEvent("Video clicked", properties, Flags.CRITICAL)

// If you're using name only, you can pass null as properties.
```

## Pause and resume sending logs

Pausing the event transmission can be useful in scenarios when the app needs to control the network bandwidth for more business critical needs. You can pause sending logs to the App Center backend. When paused, events can still be tracked and saved, but they aren't sent right away. Any events your app tracks while paused will only be sent once you call `resume`.

```java
Analytics.pause();
Analytics.resume();
```
```kotlin
Analytics.pause()
Analytics.resume()
```

## Enable or disable App Center Analytics at runtime

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK won't collect any more analytics information for the app.

```java
Analytics.setEnabled(false);
```
```kotlin
Analytics.setEnabled(false)
```

To enable App Center Analytics again, use the same API but pass `true` as a parameter.

```java
Analytics.setEnabled(true);
```
```kotlin
Analytics.setEnabled(true)
```

The state is persisted in the device's storage across application launches.

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `Analytics` has been started.

## Check if App Center Analytics is enabled

You can also check if App Center Analytics is enabled or not.

```java
Analytics.isEnabled();
```
```kotlin
Analytics.isEnabled()
```

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `Analytics` has been started, it will always return `false` before start.

## Local storage size

By default, the SDK stores all the event logs up to 10 MB. Developers can use an API to increase the [storage size](../other-apis/android.md#storage-size) and the SDK will keep storing logs until the storage is full.

## No internet access

When there's no network connectivity, the SDK saves up to 10 MB of logs in the local storage. Once the storage is full, the SDK starts discarding old logs to make room for the new logs. Once network connectivity returns, the SDK sends logs in the batch of 50 or after every 3 seconds (by default).

> [!NOTE]
> The logs older than 25 days won't be accepted by the backend.

## Batching event logs

The App Center SDK uploads logs in a batch of 50 and if the SDK doesn't have 50 logs to send, it will still send logs after 3 seconds (by default). There can be a maximum of three batches sent in parallel.
The transmission interval can be changed:

```java
// Change transmission interval to 10 minutes.
Analytics.setTransmissionInterval(600);
```
```kotlin
// Change transmission interval to 10 minutes.
Analytics.setTransmissionInterval(600)
```

The transmission interval value must be between 3 seconds and 86400 seconds (one day) and this method must be called before the service is started.

## Retry and back-off logic

App Center SDK supports back-off retries on recoverable network errors. Below is the retry logic:

* 3 tries maximum per request.
* Each request has its own retry state machine.
* All the transmission channels are disabled (until next app process) after one request exhausts all its retries.

Back-off logic

* 50% randomization, first retry between 5 and 10 seconds, next try between 2.5 and 5 minutes, last try between 10 and 20 minutes.
* If network switches from off to on (or from wi-fi to mobile), retry states are reset and requests are retried immediately.
