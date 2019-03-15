---
title: App Center Analytics for iOS
description: App Center Analytics for iOS
keywords: analytics
author: elamalani
ms.author: emalani
ms.date: 03/15/2019
ms.topic: article
ms.assetid: f5270e0d-6012-4717-9ce5-a7097e8f323e
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:  
 - swift
 - objc
---

# App Center Analytics

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.

> [!NOTE]
> iOS devices without a SIM card will not send the report with carrier country code to the App Center portal. If you want to provide a country value, use the `setCountryCode` method to override the country code from your device location.

Please follow the [Get started](~/sdk/getting-started/ios.md) section if you haven't set up the SDK in your application yet.

[!include[](apple-common-methods.md)]
