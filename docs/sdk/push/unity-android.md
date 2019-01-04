---
title: App Center Push for Unity Android
description: Using Push in App Center
keywords: sdk, push
author: jwhitedev
ms.author: jawh
ms.date: 12/14/2018
ms.topic: article
ms.assetid: 136a7159-9aee-4064-b2b1-dbc513110b12
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

App Center Push enables you to send push notifications to users of your app from the App Center portal. App Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/).

You can only send notifications to devices with the [Google Play](https://play.google.com) store application installed or emulators built with **Google APIs**.

> [!NOTE]
> A notification appears in the system notification center only if the application is in the background at the moment the Push is received.

## Prerequisites

### 1. Set up Firebase Cloud Messaging

1. Create a project on the [Firebase Console](https://console.firebase.google.com).
2. Click the Android logo on the page to create an application matching your package name.
3. Go to **Project Settings** and select **Add Firebase to your Android App**
4. Enter your Android package name, select *Register app* and download the project's `google-services.json` file.
5. Copy this file to any folder inside your Unity project.

### 2. Obtain your Android API Key

1. In the [Firebase Console](https://console.firebase.google.com), go to **Project Settings**. 
2. Navigate to the **Cloud Messaging** tab. 
3. Copy the **Server Key**. This is the Android API Key you need to set in the App Center Push portal.

## Add App Center Push to your app

Please follow instructions in the [Unity Get started](~/sdk/getting-started/unity.md) section if you haven't set up the SDK in your application yet.

### Enable App Center Push

[!include[](unity-enable.md)]

## Intercept push notifications

[!include[](unity-intercept.md)]

## Custom data in your notifications

[!include[](custom-data-android.md)]

## Configure notification's default values

You can specify custom defaults for the icon and color that are applied when those values are not set in the push payload.

Export your Unity project and add the following lines to `application` tag inside the project's `AndroidManifest.xml` file:

```xml
<!-- Set default notification icon and color. -->
<meta-data
    android:name="com.google.firebase.messaging.default_notification_icon"
    android:resource="@drawable/ic_notification" />
<meta-data
    android:name="com.google.firebase.messaging.default_notification_color"
    android:resource="@color/notification" />
```
App Center displays the application icon if a custom default icon and an icon are not set in the push payload.

## Existing Firebase Analytics users

App Center Push SDK automatically disables Firebase Analytics. If you are a Firebase customer and want to keep reporting analytics data to Firebase, you must check the **Enable Firebase Analytics** checkbox in the settings of your App Center game object.

[!include[](unity-api-enable.md)]
