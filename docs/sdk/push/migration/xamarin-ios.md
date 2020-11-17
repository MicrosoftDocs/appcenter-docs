---
title: How to migrate to a newer version of App Center Push (Xamarin.iOS)
description: How to migrate to a newer version of App Center Push (Xamarin.iOS)
keywords: sdk, push
author: king-of-spades
ms.author: kegr
ms.date: 01/07/2019
ms.topic: article
ms.assetid: e22ae043-c8a8-445b-886b-7283a180cbad
ms.tgt_pltfrm: ios
---

# Upgrading to App Center Push 1.11.0 or later from a version < 1.11.0 (Xamarin.iOS)
> [!IMPORTANT]
> Note this feature is being retired. For more information, see the [blog post](https://devblogs.microsoft.com/appcenter/app-center-mbaas-retirement/). For more information, refer to the [Push Migration Guide](~/migration/push/index.md).

Version 1.11.0 (released in November 2018) fixes a bug in the `Push.DidReceiveRemoteNotification(...)` callback. If (and only if) the developer sets their own `UNUserNotificationCenterDelegate`, the callback was not triggered once a notification was tapped or once it was received while the app was in the foreground. To fix this issue, App Center Push captures the `UNUserNotificationCenter`'s delegate and swizzles its methods to forward incoming notifications and notification-related actions to the App Center SDK.

If you want to disable the swizzling of `UNUserNotificationCenterDelegate` callbacks, refer to [the documentation to disable automatic method forwarding of UNUserNotificationCenterDelegate methods](~/sdk/push/xamarin-ios.md#user-notification-center-delegate).

In case you didn't implement your own `UNUserNotificationCenterDelegate`, there is no action required.

If you are using App Center Push's default setup logic (i.e. you didn't add the `AppCenterUserNotificationCenterDelegateForwarderEnabled` entry to your **Info.plist** or it is set to `1`) and are implementing your own `UNUserNotificationCenterDelegate` callbacks, do the following:

1. Check if you're calling `Push.DidReceiveRemoteNotification(...)`. If you're not, skip step 2; no action is required.
2. Remove any explicit calls to `Push.DidReceiveRemoteNotification(...)`. For example, you no longer need to call `didReceiveRemoteNotification:` inside your `UNUserNotificationCenterDelegate` callbacks as App Center will swizzle the `UNUserNotificationCenterDelegate` callbacks in addition to your custom implementation.