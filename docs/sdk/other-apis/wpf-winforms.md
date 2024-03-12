---
title: Other WPF and WinForms APIs
description: Other APIs in the App Center SDK for WPF and WinForms
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 11/23/2020
ms.topic: article
ms.assetid: 3c917c07-a32f-4c5d-85d1-844c8d935c0c
ms.tgt_pltfrm: wpf-winforms
---

# Other WPF and WinForms APIs
[!INCLUDE [Retirement announcement for App Center](../../includes/retirement.md)]

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [MAUI/Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

[!INCLUDE [windows](includes/windows.md)]

## Other APIs

The .NET NuGet package is shared with Xamarin and UWP, which have more functionalities.
All the APIs that aren't documented for WPF and WinForms in this page will return `null` or `false` and won't do anything on WPF and WinForms.
The other APIs are visible so that you can use them in a portable library (such as when using the SDK in a Xamarin.Forms application that contains a UWP project), but those extra APIs aren't implemented on WPF and WinForms.
