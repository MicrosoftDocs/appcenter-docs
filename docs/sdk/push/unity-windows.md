---
title: App Center Push for Unity Windows
description: Using Push in App Center
keywords: sdk, push
author: maestersid
ms.author: jawh
ms.date: 08/01/2019
ms.topic: article
ms.assetid: f038f869-9ab2-40c2-8860-2e02eb54f9ac
ms.tgt_pltfrm: unity
---

# App Center Push
> [!IMPORTANT]
> Please note this feature is being retired. For more information, please see the [blog post](https://devblogs.microsoft.com/appcenter/app-center-mbaas-retirement/). For more information, refer to the [Push Migration Guide](~/migration/push/index.md).

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

App Center Push enables you to send push notifications to users of your app from the App Center portal. App Center Push relies on [Windows Notification Services](https://docs.microsoft.com/windows/uwp/controls-and-patterns/tiles-and-notifications-windows-push-notification-services--wns--overview) (WNS) to send notifications to the devices.

> [!NOTE]
> The device displays a toast only if the application is in background at the moment the Push is received.

## Add App Center Push to your app

If you haven't already set up and started the SDK in your application, see the [Get started](~/sdk/getting-started/uwp.md) section of the docs.

### Enable App Center Push

[!INCLUDE [unity enable](includes/unity-enable.md)]


## Register your app for Windows Notification Services (WNS)

Before you can send notification using WNS, your app must be registered with the Windows Store. This step will provide you with credentials for your app that App Center will use to authenticate with WNS. These credentials consist of a Package Security Identifier (SID) and an application secret key. To register, you need to associate your app with the Windows Store in Visual Studio.

To register the app, first export it as a project. To do so, build the app on the Unity **Build Settings** tab, then open the built solution in **Visual Studio**.

[!INCLUDE [windows wns](includes/windows-wns.md)]

## Intercept push notifications

[!INCLUDE [unity intercept](includes/unity-intercept.md)]

[!INCLUDE [unity api enable](includes/unity-api-enable.md)]