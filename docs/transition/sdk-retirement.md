---
title: "HockeyApp Retirement"
description: Transition from HockeyApp to App Center
author: ahbilal
ms.author: Ahmed Bilal
ms.date: 06/20/2020
ms.topic: article
ms.assetid: A5AB2B92-0616-4F41-A0E7-43FD3C778059
ms.service: vs-appcenter
---

# HockeySDK is retiring

HockeySDK is now deprecated and will continue to work until November 13, 2020. After this date, HockeySDK will stop sending data for your app. To continue getting analytics/crash data from your apps and keep using in-app updates, make sure to upgrade your apps to the App Center SDK versions before November 13, 2020. Follow the details below to update your apps to use the App Center SDK.

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

## FAQS


## Download Links

Requests to the link of the format `https://rink.hockeyapp.net/api/2/apps/0873e2b98ad046a92c170a243a8515f6?format=apk` are forwarded to App Center. Make sure the file format is appropriate to the binary uploaded. The latest version that is released to the "All users of AppName" distribution group or to any other public distribution group will be returned.

> [!Note]
> The HockeyApp app id used in the link above is equivalent to the app secret of your app in App Center but without dashes.

## Feedback

App Center doesn't support the HockeyApp Feedback functionality. For potential alternatives, see the [feedback guide](feedback.md).
