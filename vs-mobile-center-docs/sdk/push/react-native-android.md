---
title: Mobile Center Push for React Native Android
description: Using Push in Mobile Center
keywords: sdk, push
author: bretjohn
ms.author: bretjohn
ms.date: 06/12/2017
ms.topic: article
ms.assetid: 656B7FAD-2210-467A-B82F-EF9538DD2D00
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: react-native
dev_langs:
 - java
 - javascript
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

Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal. Mobile Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/).

Note that only devices having the [Google Play](https://play.google.com) store application or emulators with **Google APIs** images can receive the notifications. Also, Firebase displays a notification in the system notification center only if the application is in background at the moment the Push is received.

## Prerequisite - Add Firebase to your app

Before using Mobile Center Push service, you need to add Firebase to your application. You can either choose a manual integration or Firebase Assistant.

### 1. Manual integration

1. Follow the instructions listed in [Manually add Firebase](https://firebase.google.com/docs/android/setup#manually_add_firebase) section.

2. Make sure to continue following instructions in **Add the SDK** sub section right after.

### 2. Using Firebase Assistant

1. Follow [these instructions](https://developer.android.com/studio/write/firebase.html) if you don't see **Firebase** in the **Tools** menu.

2. Click on Tools > Firebase and follow **only** the first two following steps:

    1. Connect your app to Firebase

    2. Add FCM to your app

Step 3 is managed by Mobile Center SDK automatically, so you can stop after step 2.

### 3. Obtain your Android API Key
Go to Project Settings and under Cloud Messaging, copy your Server Key. This will be the Android API Key that you will need to set in the Mobile Center Push portal.

## Add Mobile Center Push to your app

Please follow the [Get started](~/sdk/getting-started/react-native.md) section if you haven't set up and started the SDK in your application, yet.
The Mobile Center SDK is designed with a modular approach – you only need to integrate the services that you're interested in.

1. Open a Terminal and navigate to the root of your React Native project, then enter the following to add Mobile Center Push to the app:

    ```
    npm install mobile-center-push --save
    ```

2. Link the plugin to the React Native app by using the react-native link command.

    ```
    react-native link mobile-center-push
    ```

3. You will be prompted for the App Secret, which will enable Mobile Center to map this app to the right user account. The secret may already be pre-populated, showing up beside the question. If the pre-filled secret is correct, press enter to continue. Otherwise, provide your app secret here. Please also check out the [Get started](~/sdk/getting-started/ios.md) section if you haven't yet configured the SDK in your application.

    ```
    What is the Android app secret? (0000-0000-0000-0000-000000000000)
    What is the iOS app secret? (0000-0000-0000-0000-000000000000)
    ```

Those steps modify your **MainApplication.java** file, adding `RNPushPackage` there.

## Existing Firebase Analytics users

>[!NOTE]
>Mobile Center Push has a dependency on Firebase. Firebase Analytics is included in the core Firebase module and therefore, it's a dependency for Firebase messaging. Mobile Center Push SDK automatically disables Firebase Analytics to prevent unwanted data collection by Firebase.

If you are a Firebase customer and want to keep reporting analytics data to Firebase, you need to call the following method before `RNPushPackage` is instantiated, like from `MainApplication.onCreate`:

```java
import com.microsoft.azure.mobile.push.Push;

...

Push.enableFirebaseAnalytics(getApplication());
```

## Enable or disable Mobile Center Push at runtime

You can enable and disable Mobile Center Push at runtime. If you disable it, the SDK will stop updating the Google registration identifier used to push but the existing one will continue working. In other words, disabling the Mobile Center Push in the SDK will **NOT** stop your application from receiving push notifications.


```javascript
import Push from 'mobile-center-push';

...

await Push.setEnabled(false);      // Disable push
await Push.setEnabled(true);       // Re-enable it
```

## Check if Mobile Center Push is enabled

You can also check if Mobile Center Push is enabled or not:

```javascript
import Push from 'mobile-center-push';

...

const pushEnabled = await Push.isEnabled();
```
