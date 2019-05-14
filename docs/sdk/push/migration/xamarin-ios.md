---
title: How to migrate to a newer version of App Center Push
description: How to migrate to a newer version of App Center Push
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 01/07/2019
ms.topic: article
ms.assetid: cdd0a651-29b6-4fb2-8fc5-4a25b54eb2ca
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: ios
---

## Upgrading to App Center Push 1.11.0 or later from a version < 1.11.0

Version 1.11.0 (released in November 2018) fixes a bug in the `Push.DidReceiveRemoteNotification(...)` callback. If (and only if) the developer sets their own `UNUserNotificationCenterDelegate`, the callback was not triggered once a notification was tapped or once it was received while the app was in the foreground. To fix this issue, App Center Push captures the `UNUserNotificationCenter`'s delegate and swizzles its methods to forward incoming notifications and notification-related actions to the App Center SDK.

If you want to disable the swizzling of `UNUserNotificationCenterDelegate` callbacks,  please refer to [the documentation to disable automatic method forwarding of UNUserNotificationCenterDelegate methods](~/sdk/push/xamarin-ios.md#user-notification-center-delegate).

In case you did not implement your own `UNUserNotificationCenterDelegate`, there is no action required.

If you are using App Center Push's default setup logic (i.e. you did NOT add the `AppCenterUserNotificationCenterDelegateForwarderEnabled` entry to your **Info.plist** or it is set to `1`) and are implementing your own `UNUserNotificationCenterDelegate` callbacks, please do the following:

1. Check if you are calling `Push.DidReceiveRemoteNotification(...)`. If you are not, skip step 2; no action is required.
2. Remove any explicit calls to `Push.DidReceiveRemoteNotification(...)`. For example, you no longer need to call `didReceiveRemoteNotification:` inside your `UNUserNotificationCenterDelegate` callbacks as App Center will swizzle the `UNUserNotificationCenterDelegate` callbacks in addition to your custom implementation.