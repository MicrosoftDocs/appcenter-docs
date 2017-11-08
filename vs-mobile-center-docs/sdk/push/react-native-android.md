---
title: Mobile Center Push for React Native Android
description: Using Push in Mobile Center
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 10/31/2017
ms.topic: article
ms.assetid: 656B7FAD-2210-467A-B82F-EF9538DD2D00
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

[!include[](introduction-android.md)]

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

Those steps modify your **MainApplication.java** file, adding `RNPushPackage` there.

## Intercept push notifications

You can set up a listener to be notified whenever a push notification is received in foreground or a background push notification has been clicked by the user.

> [!NOTE]
> Firebase does not generate notifications when the push is received in foreground.

> [!NOTE]
> If the push is received in background, the event is **NOT** triggered at receive time.
> The event is triggered when you click on the notification.

> [!NOTE]
> The Firebase SDK does **NOT** expose **title** and **message** to the background notification click callback.
> **title** and message are only available in **foreground** pushes.

[!include[](react-native-listener.md)]

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
