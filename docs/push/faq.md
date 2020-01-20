---
title: App Center Push Frequently Asked Questions
description: Help using the Push features of App Center
keywords: app center, push, faq
author: jwargo
ms.author: jowargo
ms.date: 06/26/2019
ms.topic: article
ms.assetid: 47e12907-38fb-40c3-bb14-45f3d3a09cd1
ms.service: vs-appcenter
ms.custom: push
---

# App Center Push Frequently Asked Questions

**When sending a Push to device IDs, how many devices can I send to each request?**

You can send up to 100 devices in single send request. To send notifications to more than 100 devices, simply break your request into batches and send multiple requests (one per batch).

**I'm seeing an Expired Channel error on iOS after I attempted to send a Push, how can I resolve it?**

The Expired Channel error means that the token issued by Apple for the device expired. App Center can no longer be used to send notifications to that device. The token must be re-issued on the device and re-registered with App Center Push. The App Center SDK should handle this for you when the app starts (see [add the start method](https://docs.microsoft.com/appcenter/sdk/push/ios#22-add-the-startwithservices-method) in the App Center SDK documentation).

One of the reasons could be that you are using a Sandbox token to send a Push Notification in a Production App.

**Can I delay showing the Push Notifications permission pop-up until the user click a button or a certain screen?**

Yes. Execute `AppCenter.Start("{APP-SECRET}", services)` as usual (without specifying the Push service). Once the user opted-in to receive push notifications, execute `AppCenter.Start(typeof(Push))` to start just the Push service.
Note that the second call to `Start()` does not include the app secret.

Here's how:

```csharp
// call start with app secret WITHOUT Push
AppCenter.Start(appCenterAPIKey, typeof(Crashes), typeof(Analytics));

// then on button click do:
AppCenter.Start(typeof(Push));
```

**Can I set a priority for notifications sent through App Center Push?**

No, you cannot. App Center Push does not set notification priority, so the target PNS will deliver notifications with default priority. For Android, that means **Normal** and iOS it's `apns-priority = 10`

**How should I handle sensitive payload in push notifications?**

All notifications are delivered to target devices by the platform's PNS. When a notification is sent to App Center Push, it is processed and passed to the respective PNS.

All connections, from the sender to the App Center Push to the PNS, use HTTPS.

Do not send personal or confidential information in a notification. To send sensitive payloads, we recommend using a Secure Push pattern. With this pattern, the sender sends a ping notification with a message identifier to the device without the sensitive payload. When the app on the device receives the notification, the app calls a secure API directly to fetch the message details.