---
title: Mobile Center Push
description: Help using the Push on Mobile Center
keywords: mobile center, push
author: blparr
ms.author: blparr
ms.date: 05/11/2017
ms.topic: article
ms.assetid: B2CF9BFA-4C31-484C-83F7-9DD0E10AA8BD
ms.service: mobile-center
ms.custom: push
---

# Push Notifications

Mobile Center Analytics is a mobile apps measurement tool that lets developers understand their end-user population and usage patterns.

## How to set up Push Notifications

In order to set up Push Notifications, you will have to set up the Mobile Center SDK as well as the platform specific push services for Firebase Cloud Messaging (FCM), Apple Notifications Service (APNs), Windows Notifications Services (WNS). You can follow the instructions for platform specific SDK docs for [Android](~/sdk/push/android.md), [iOS](~/sdk/push/ios.md) [UWP](~/sdk/push/uwp.md).

## Sending Push Notifications

Once Mobile Center Push is configured, you are ready to start sending notifications to your users. By clicking the "Send Notification" button on top right of the page, a panel will show up where you will have to include:
- Campaign Name:
- Title:
- Message:
You can also include custom data. more info below.

The next step is to select your target user. You can send the notification to:
- All registered devices: This will do a broadcast and send the notification to all your registered devices.
- Custom devices list: In order to get the install IDs you can use our [API](~/sdk/other-apis/android.md) 
- Audiences: more info below.

## Custom Data in your notifications

## Audiences
