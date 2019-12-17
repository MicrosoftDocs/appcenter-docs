---
title: App Center Push for Unity iOS
description: Using Push in App Center
keywords: sdk, push
author: jwhitedev
ms.author: jawh
ms.date: 02/14/2019
ms.topic: article
ms.assetid: c6ee6d0a-940e-4266-887d-5baf181efece
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: unity
---

# App Center Push

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin.Android](xamarin-android.md)
> * [Xamarin.iOS](xamarin-ios.md)
> * [Xamarin.Forms](xamarin-forms.md)
> * [React Native Android](react-native-android.md)
> * [React Native iOS](react-native-ios.md)
> * [macOS](macos.md)
> * [Cordova Android](cordova-android.md)
> * [Cordova iOS](cordova-ios.md)
> * [Unity Android](unity-android.md)
> * [Unity iOS](unity-ios.md)
> * [Unity Windows](unity-windows.md)

App Center Push enables you to send push notifications to users of your app from the App Center portal.

## Prerequisite - Enable Apple Push Notifications service (APNs) for your app

Configure Apple Push Notifications service (APNs) for your app from your Apple developer account and the App Center portal before adding App Center Push to your app.

### Enable push notifications on your application

[!INCLUDE [ios apns setup](includes/ios-apns-setup.md)]

For more information, see to the [Apple documentation](https://help.apple.com/xcode/mac/current/#/dev11b059073).

## Add App Center Push to your app

If you haven't set up the SDK in your application already, see instructions in the [Unity Get started](~/sdk/getting-started/unity.md) section of the docs.

### Enable App Center Push

[!INCLUDE [unity enable](includes/unity-enable.md)]

## Intercept push notifications

[!INCLUDE [unity intercept](includes/unity-intercept.md)]

[!INCLUDE [unity api enable](includes/unity-api-enable.md)]