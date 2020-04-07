---
title: App Center Push for Unity Android
description: Using Push in App Center
keywords: sdk, push
author: maestersid
ms.author: jawh
ms.date: 03/22/2019
ms.topic: article
ms.assetid: 136a7159-9aee-4064-b2b1-dbc513110b12
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

[!INCLUDE [introduction to android](includes/introduction-android.md)]

## Add App Center Push to your app

If you haven't set up the SDK in your application yet, see the instructions in the [Unity Get started](~/sdk/getting-started/unity.md) section of the docs.

### Enable App Center Push

[!INCLUDE [unity enable](includes/unity-enable.md)]

## Intercept push notifications

[!INCLUDE [unity intercept](includes/unity-intercept.md)]

## Custom data in your notifications

[!INCLUDE [custom data android](includes/custom-data-android.md)]

## Configure notification's default values

You can specify custom defaults for the icon and color that are applied if not already set in the push payload.

Export your Unity project and add the following lines to `application` tag inside the project's **AndroidManifest.xml** file:

```xml
<!-- Set default notification icon and color. -->
<meta-data
    android:name="com.google.firebase.messaging.default_notification_icon"
    android:resource="@drawable/ic_notification" />
<meta-data
    android:name="com.google.firebase.messaging.default_notification_color"
    android:resource="@color/notification" />
```

App Center displays the application icon if a custom default icon and an icon aren't set in the push payload.

## Existing Firebase Analytics users

App Center Push SDK automatically disables Firebase Analytics. If you're a Firebase customer and want to keep reporting analytics data to Firebase, you must check the **Enable Firebase Analytics** checkbox in the settings of your App Center game object.

[!INCLUDE [unity api enable](includes/unity-api-enable.md)]
