---
title: Mobile Center Push for Universal Windows Platform
description: Using Push in Mobile Center
keywords: sdk, push
author: dhei
ms.author: dihei
ms.date: 06/09/2017
ms.topic: article
ms.assetid: 75f504d0-2676-445e-a010-4d608c12c5fb
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: UWP
---

# Mobile Center Push

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin.Android](xamarin-android.md)
> * [Xamarin.iOS](xamarin-ios.md)
> * [Xamarin.Forms](xamarin-forms.md)
> * [React Native Android](react-native-android.md)
> * [React Native iOS](react-native-ios.md)

Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal and relies on [Windows Notification Services](https://docs.microsoft.com/en-us/windows/uwp/controls-and-patterns/tiles-and-notifications-windows-push-notification-services--wns--overview) (WNS) to push notifications to the devices.

## Prerequisite - Register your app for Windows Notification Services (WNS)

Before you can send notification using WNS, your app must be registered with the Windows Store. This will provide you with credentials for your app that Mobile Center will use to authenticate with WNS. These credentials consist of a Package Security Identifier (SID) and an application secret key. To perform this registeration, you need to associate your app with the Windows Store in Visual Studio.

### 1. Windows Store Association in Visual Studio

1. In Visual Studio Solution Explorer, right-click the UWP project, click **Store -> Associate App with the Store...**

    ![uwp store association](images/mobile-center-uwp-sdk-store-association.png)

2. In the wizard, click **Next**, sign in with your Microsoft account, type a name for your app in **Reserve a new app name**, then click **Reserve**.

3. After the app registration is successfully created, select the new app name, click **Next**, and then click **Associate**. This adds the required Windows Store registration information to the application manifest.

>[!NOTE]
>You will need a Windows Developer account to send push notifications to your UWP app. You can [register a developer account](https://developer.microsoft.com/en-us/store/register) if you don't already have one.

### 2. Get Package SID and Application secret from Application Registration Portal

1. Navigate to the [Microsoft Application Registration Portal](https://apps.dev.microsoft.com/#/appList), sign-in with your Microsoft account. Click the Windows Store app you associated in the previous step.

    ![uwp app registration](images/mobile-center-uwp-sdk-push-registration.png)

2. In the registration page, make a note of the value under **Application Secrets** and the **Package SID**, which you will next use to configure your Mobile Center Push backend.

### 3. Configure Package SID and Security Key in Mobile Center portal

Navigate to your Mobile Center app -> Push, enter **Package SID** and **Security key** that you obtained from the [Microsoft Application Registration Portal](https://apps.dev.microsoft.com/#/appList) in the previous step, click **Apply changes**.

## Add Mobile Center Push to your app

Please follow the [Get started](~/sdk/getting-started/uwp.md) section if you haven't set up and started the SDK in your application.

### 1. Add the Mobile Center Push package

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in. It can be integrated using Visual Studio or Package Manager Console.

[!include[](add-nuget.md)]

Now that you've integrated Mobile Center Push in your application, it's time to start the SDK and make use of Mobile Center.

### 2. Start Mobile Center Push service

[!include[](start-push.md)]

>[!NOTE]
>If your UWP project is part of a [Xamarin.Forms](xamarin-forms.md) application, it is not necessary to add the call to `MobileCenter.Start()` in the UWP portion of the project. The method call can instead be made from the PCL or shared project portion of your Xamarin.Forms application.

## Intercept push notifications

Mobile Center Push makes it possible to intercept push notifications but there is some setup required to enable this feature in UWP.

### Additional setup

Call `Push.CheckLaunchedFromNotification(e);` after `MobileCenter.Start` in `OnLaunched` method.

```csharp
protected override void OnLaunched(LaunchActivatedEventArgs e)
{
    MobileCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Push));
    Push.CheckLaunchedFromNotification(e);
}
```

### Subscribe to the push event

[!include[](push-callbacks.md)]

## Enable or disable Mobile Center Push at runtime

[!include[](enable-or-disable.md)]
