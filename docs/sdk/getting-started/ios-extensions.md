---
title: Get Started with iOS Extensions
description: Get started
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 09/24/2019
ms.topic: get-started-article
ms.assetid: 598397ca-c113-4b19-be3f-d8397015ff9d
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:  
 - swift
 - objc
---

# Get Started with iOS extensions

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [iOS Extensions](ios-extensions.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [macOS Extensions](macos-extensions.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

Note that application extensions only support crash reporting.

To learn how to add App Center SDK to your container app, refer to the documentation for [App Center iOS Getting Started](./ios.md).

Let's get started with setting up App Center iOS SDK in your app extension to use App Center Crashes.

## 1. Prerequisites

The following requirements must be met to use App Center SDK:

* Your iOS project is set up in Xcode 10 or later on macOS version 10.12 or later.
* You are targeting devices running on iOS 9.0 or later.
* You are not using any other library that provides Crash Reporting functionality.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select **iOS** as the OS and **Objective-C/Swift** as a platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Settings** page on the App Center Portal. At the top right-hand corner of the **Settings** page, click on the **triple vertical dots** and select `Copy app secret` to get your App Secret.

> [!NOTE]
> Using an existing App Secret from another iOS project has side effects. App Center doesn't support filtering by project on the same App Center application. For instance listing crashes for a particular version will list all the crashes from both projects for this version without distinction. It can be confusing.

[!include[](ios-macos-extension.md)]

Look at the documentation for [App Center Crashes](~/sdk/crashes/ios.md) to learn how to customize your app extension and use more advanced functionalities.