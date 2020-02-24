---
title: "HockeyApp Transition"
description: Transition from HockeyApp to App Center
author: dipree
ms.author: daadam
ms.date: 02/18/2020
ms.topic: article
ms.assetid: A5AB2B92-0616-4F41-A0E7-43FD3C778059
ms.service: vs-appcenter
---

# HockeyApp

Apps that have been migrated from HockeyApp still receive data from the HockeySDK. In-app updates remain functional as well.

## Migrate from the HockeySDK to the App Center SDK

Follow this documentation to update your apps to use the App Center SDK instead of the HockeySDK. The guides for each platform are listed below.

* [HockeySDK Android](android-sdk-migration.md)
* [HockeySDK iOS](ios-sdk-migration.md)
* [HockeySDK UWP](uwp-sdk-migration.md)
* [HockeySDK macOS](macos-sdk-migration.md)
* [HockeySDK tvOS](tvos-sdk-migration.md)
* [HockeySDK Xamarin](xamarin-sdk-migration.md)
* [HockeySDK Unity](unity-sdk-migration.md)
* [HockeySDK Cordova](cordova-sdk-migration.md)
* [HockeySDK WPF/Winforms](wpf-winforms-sdk-migration.md)

## Download Links

Requests to the link with the format `https://rink.hockeyapp.net/api/2/apps/0873e2b98ad046a92c170a243a8515f6?format=apk` are forwarded to App Center. The latest version that is released to the "All users of AppName" distribution group or to any other public distribution group will be returned.

> [!Note]
> The app id used in the link above is the app secret of your app in App Center but without the dashes.

## Feedback

App Center does not support the HockeyApp Feedback functionality. For potential alternatives, see the [feedback guide](feedback.md).