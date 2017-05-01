---
title: Mobile Center Push for Android
description: Using push in Mobile Center
keywords: sdk, push
author: guperrot
ms.author: guperrot
ms.date: 05/01/2017
ms.topic: article
ms.assetid: 62f0364a-e396-4b22-98f3-8b2d92b5babb
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Mobile Center Push

> [!div class="op_single_selector"]
> * [Android](android.md)

Mobile Center Push will let you push notifications to your application users.

Mobile Center Push relies on [Firebase messaging](https://firebase.google.com/docs/cloud-messaging/) to push notifications to the devices.

Please note that only devices having [Google Play](https://play.google.com) can receive the notifications.

Please also note that a notification is displayed in the system notification center only if the application is in background at the moment the push is received.

Pushes received in foreground are not yet managed by our SDK but you can implement your own foreground push message receiver by reading [this](https://firebase.google.com/docs/notifications/android/console-audience#receive_and_handle_notifications).

## 1. Add Firebase to your app

Before being able to use the push module, you need to add Firebase to your application.

There is a couple of ways you can do that, either manual or using the Android Studio Firebase assistant.

### 1.1. Manual integration

For that you need to follow some of the documentation of Firebase:

1. Follow instructions in [Add Firebase to your app](https://firebase.google.com/docs/notifications/android/console-audience#add_firebase_to_your_app) section.

2. Follow instructions in [Add the SDK](https://firebase.google.com/docs/notifications/android/console-audience#add_the_sdk)

Only those 2 steps are needed to use Mobile Center Push, the SDK is taking care of the rest.

### 1.2. Using Firebase assistant

If you wish to use the Firebase assistant:

1. Follow [these instructions](https://developer.android.com/studio/write/firebase.html) if you don't see **Firebase** in the **Tools** menu.

2. Click on Tools > Firebase and follow **only** the first two following steps:

    1. Connect your app to Firebase

    2. Add FCM to your app

Step 3 is managed by our SDK automatically so you can stop after step 2.

## 2. Add push to your app

Please follow the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

### 2.1. Add the Mobile Center Push module

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

1. Open your app level `build.gradle` file (`app/build.gradle`) and add the following lines after `apply plugin`. Include the dependencies that you want in your project. Each SDK module needs to be added as a separate dependency in this section. If you would want to use all the services, add the following lines:

    ```groovy
    dependencies {
       def mobileCenterSdkVersion = '0.7.0'
       compile "com.microsoft.azure.mobile:mobile-center-push:${mobileCenterSdkVersion}"
    }
    ```

2. Make sure to trigger a Gradle sync in Android Studio.

Now that you've integrated Mobile Center Push in your application, it's time to start the SDK and make use of Mobile Center.

### 2.2. Start Mobile Center Push

In order to use Mobile Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

Add `Push.class` to your `MobileCenter.start()` method to start Mobile Center Push together with the other services that you want to use in your app.

```java
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class, Crashes.class, Push.class);
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Please also check out the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

Android Studio will automatically suggest the required import statement once you add `Push.class` to the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.azure.mobile.MobileCenter;
import com.microsoft.azure.mobile.analytics.Analytics;
import com.microsoft.azure.mobile.crashes.Crashes;
import com.microsoft.azure.mobile.push.Push;
```

## 3. Existing Firebase Analytics users

Mobile Center Push has a dependency on Firebase.

Firebase Analytics is part of the core module and is thus a dependency of Firebase messaging.

As a result our SDK automatically disables Firebase Analytics to prevent unwanted data collection to Firebase.

If however you are a customer of Firebase Anlytics and want to keep reporting analytics data to Firebase, you need to call the following method before `MobileCenter.start`:

```java
Push.enableFirebaseAnalytics(getApplication());
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class, Crashes.class, Push.class);
```

## 4. Enable or disable Mobile Center Push at runtime

You can enable and disable Mobile Center Push at runtime.

If you disable it, the SDK will stop updating the Google registration identifier used to push but the existing one can still be used to push.

Disabling will not stop push notifications from being received.

```java
Push.setEnabled(false);
```
To enable Mobile Center Push again, use the same API but pass `true` as a parameter.

```java
Push.setEnabled(true);
```

## 5. Check if Mobile Center Push is enabled

You can also check if Mobile Center Push is enabled or not:

```java
Push.isEnabled();
```
