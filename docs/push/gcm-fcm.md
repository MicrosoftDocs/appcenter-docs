---
title: Google GCM to FCM Migration
description: How App Center Push addresses Google's GCM to FCM migration
keywords: push
author: jwargo
ms.author: jowargo
ms.date: 10/07/2019
ms.topic: article
ms.assetid: aa79dc76-1e6b-45f6-a65a-201b3f6f26be
ms.service: vs-appcenter
---

# Google GCM to FCM Migration

When Google announced its migration from Google Cloud Messaging (GCM) to Firebase Cloud Messaging (FCM), push services like ours had to adjust how we sent notifications to Android devices to accommodate the change.

We updated our service backend, then published updates to our API and SDKs as needed. With our implementation, we made the decision to maintain compatibility with existing GCM notification schemas to minimize customer impact. This means that we currently send notifications to Android devices using FCM in FCM Legacy Mode. Ultimately, we want to add true support for FCM, including the new features and payload format. That is a longer-term change and the current migration is focused on maintaining compatibility with existing applications and SDKs. You can use either the GCM or FCM SDKs in your app (along with our SDK) and we make sure the notification is sent correctly.

Some customers recently received an email from Google warning about apps using a GCM endpoint for notifications. This was just a warning, and nothing is broken – your app’s Android notifications are still sent to Google for processing and Google still processes them. App Center Push was still using the deprecated GCM endpoint. We had already identified this gap and were working on fixing the issue when Google sent the email.

We replaced that deprecated endpoint and the fix is deployed.

If you are using the latest App Center SDK, you are already using the FCM SDK in your application. If you haven’t upgraded to the latest App Center SDK, then your app will continue to work with the GCM library but you should go ahead and follow Google’s instructions to migrate your GCM project to an FCM project.

According to [Google’s FCM FAQ](https://developers.google.com/cloud-messaging/faq), Google said “client SDKs and GCM tokens will continue to work indefinitely. However, you won't be able to target the latest version of Google Play Services in your Android app unless you migrate to FCM.”

Here are some answers to common questions we’ve heard from customers:

**Q**: What do I need to do to be compatible by the cutoff date (Google’s current cutoff date is May 29th and may change)?

**A**: Nothing. We will maintain compatibility with existing GCM notification schema. Your GCM key will continue to work as normal as will versions of your app that are built with the GCM SDKs and libraries.

If/when you decide to upgrade to the latest App Center SDKs and libraries to take advantage of new features, your GCM key will still work. You may switch to using an FCM key if you wish, but ensure you are adding Firebase to your existing GCM project when creating the new Firebase project. This will guarantee backward compatibility with your customers that are running older versions of the app that still use GCM SDKs and libraries.

If you are creating a new FCM project and not attaching to the existing GCM project, once you update App Center with the new FCM secret you will lose the ability to push notifications to your existing app installations, since the new FCM key has no link to the old GCM project.

**Q**: Why am I getting this email about old GCM endpoints being used? What do I have to do?

**A**: Nothing. We have migrated to the new endpoints and no other changes are necessary. Nothing is broken, our one missed endpoint simply caused warning messages from Google.

**Q**: How can I transition to the new FCM SDKs and libraries without breaking existing users?

**A**: Upgrade at any time. Google has not yet announced any deprecation of existing GCM SDKs and libraries. To ensure you don't break push notifications to your existing users, make sure when you create the new Firebase project you are associating with your existing GCM project. This will ensure new Firebase secrets will work for users running the older versions of your app with GCM SDKs and libraries, as well as new users of your app with FCM SDKs and libraries.
