---
title: App Center Push Frequently Asked Questions
description: Help using the Push features of App Center
keywords: app center, push, faq
author: dimazaid
ms.author: dimazaid
ms.date: 02/11/2019
ms.topic: article
ms.assetid: 0d663191-1b13-44f0-9df0-51185656d541
ms.service: vs-appcenter
ms.custom: push
---

# Push FAQ

**When sending a Push to device IDs, how many devices can I send to each request?**

You can send up to 20 devices in single send request.

**iOS: I'm seeing a Expired Channel error after I attempted to send a Push, how can I resolve it?**

The Expired Channel error means that the token issued by Apple for the device expired, and can no longer be used to send notifications to that device. The token must be re-issued on the device and re-registered with App Center Push. The App Center SDK should handle this for you when the app starts (see [add the start method](https://docs.microsoft.com/en-us/appcenter/sdk/push/ios#22-add-the-startwithservices-method) in the App Center SDK documentation).

One of the reasons could be that you are using a Sandbox token to send a Push Notification in a Production App.

**Can I delay showing the Push Notifications permission pop-up until the user click a button or a certain screen?**

Yes, you can call `AppCenter.Start("{APP-SECRET}", services)` as usual (without specifying the Push service). Then, once the user has opted in to receive push notifications, you can call `AppCenter.Start(typeof(Push))` to start just the Push service.
Note that the second call to `Start()` does not include the app secret. 

Here's how:

```csharp
// call start with app secret WITHOUT Push
AppCenter.Start(appCenterAPIKey, typeof(Crashes), typeof(Analytics));

// then on button click do:
AppCenter.Start(typeof(Push));
```