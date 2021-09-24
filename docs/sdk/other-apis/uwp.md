---
title: Other UWP and WinUI APIs
description: Other APIs in the App Center SDK for UWP and WinUI
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 07/29/2021
ms.topic: article
ms.assetid: 47b5da40-70fd-468b-a9a9-05a266b7fa7b
ms.tgt_pltfrm: uwp
---

# Other UWP and WinUI APIs

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

[!INCLUDE [windows](includes/windows.md)]

You can set custom properties by calling the `SetCustomProperties()` API. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following C# datatypes: `string`, `int`, `long`, `double`, `float`, `decimal`, `bool` and `DateTime`.

```csharp
CustomProperties properties = new CustomProperties();
properties.Set("color", "blue").Set("score", 10).Set("now", DateTime.UtcNow);
AppCenter.SetCustomProperties(properties);
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `Clear()` API. This only removes the value of the property for a device. It won't remove the property name from App Center portal.

```csharp
CustomProperties properties = new CustomProperties();
properties.Set("color", "blue").Set("score", 10).Clear("score");
AppCenter.SetCustomProperties(properties);
```
