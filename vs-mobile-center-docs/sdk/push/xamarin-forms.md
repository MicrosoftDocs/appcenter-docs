---
# required metadata

title: Mobile Center Push for Xamarin.Forms Apps
description: Integrating Mobile Center Push into Xamarin.Forms applications
keywords: sdk, push
author: achocron
ms.date: 05/11/2017
ms.topic: article
ms.assetid: e3384f0b-fafd-4345-b9bb-4e683391bf74
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin.forms
---

# Mobile Center Push

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin.Android](xamarin-android.md)
> * [Xamarin.iOS](xamarin-ios.md)
> * [Xamarin.Forms](xamarin-forms.md)

Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal.

## Prerequisite - Perform platform-specific setup

Push notifications work differently on UWP, iOS, and Android, therefore, before the shared APIs can be leveraged in Xamarin.Forms, you need to perform some setup on each platform. Follow the instructions for integrating push with each of the platform-specific setup guides for Push, and then return here.

### Setup Guides
* [Xamarin.Android](xamarin-android.md)
* [Xamarin.iOS](xamarin-ios.md)
* [UWP](uwp.md)

>[!IMPORTANT]
>Even if you only access the `MobileCenter` or `Push` class from your shared or PCL project, the Mobile Center NuGet packages must be added to each platform-specific project.

## Add Mobile Center Push to your app

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up and started the SDK in your application yet.

### 1. Add the Mobile Center Push module

[!include[](add-nuget.md)]

### 2. Start Mobile Center Push

[!include[](start-push.md)]

## Intercept push notifications

>[!NOTE]
>This feature is not yet available in UWP apps, though support is coming soon. You can still use the event in the shared or PCL part of your Xamarin.Forms application, just note that the event will not be invoked on the UWP platform.

[!include[](push-callbacks.md)]

## Enable or disable Push at runtime

[!include[](enable-or-disable.md)]

