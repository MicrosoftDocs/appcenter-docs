---
title: Sending Push Notifications
description: Help using the Push on App Center
keywords: app center, push
author: dimazaid
ms.author: dimazaid
ms.date: 12/14/2018
ms.topic: article
ms.assetid: 4db077ee-b9bf-4dc7-ac21-e8ecc8ee840e
ms.service: vs-appcenter
ms.custom: push
---

# Sending push notifications

## Delay showing Push Notifications permission pop-up until the user clicks a button or a certain screen

You can call `AppCenter.Start("{APP-SECRET}", services)` without specifying the Push service. Then, once the user has opted in to receive push notifications, you can call `AppCenter.Start(typeof(Push))` to start the Push service.

Note the application doesn't need to send the app secret in the second call to `Start()`

```Java
// call start with app secret WITHOUT Push
AppCenter.Start(appCenterAPIKey, typeof(Crashes), typeof(Analytics));

// then on button click do:
AppCenter.Start(typeof(Push));
```

## Custom Data in your notifications

Optional: send custom data as part of the push payload. The data is sent in a key-value format. This custom data can be intercepted in the app through Push SDK callback.

There are few reserved keywords in each platform that can be set via custom data:

### Android

- **color**: The notification icon color, expressed in `#rrggbb` format. Only applies on devices running Android 5.0 and later.
- **icon**: The notification's icon. Specify the **name** of the icon resource. Supports `drawable` and `mipmap` types. If this value isn't specified, default application icon is used.
- **sound**: Add this key when you want the to play a sound. The value of this key is the name of a sound file in   `/res/raw/`. This option only applies on devices running or targeting an Android version lower than 8. Sound is set by default on Android 8 and users can change notification settings for the group of notifications coming from AppCenter.

### iOS

- **badge**: Add this key when you want to modify the badge of your app icon. If this key is not included, the badge is not changed. To remove the badge, set the value of this key to 0.
- **sound**: Add this key when you want the to play a sound. The value of this key is the name of a sound file in your app's main bundle or in the `Library/Sounds` folder of your app’s data container. If the sound file cannot be found, or if you specify `default` for the value, the system plays the default alert sound.
- **content-available**: Add this key with a value of 1 to configure a silent notification. When this key is present, the system wakes up your app in the background and delivers the notification to its app delegate. For information about configuring and handling silent notifications, see [Configuring a Silent Notification](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CreatingtheNotificationPayload.html#//apple_ref/doc/uid/TP40008194-CH10-SW8).
- **mutable-content**: Add this key with a value of 1 to enable media attachments. The application needs to support a service extension to download and handle the attachment content. For more information you can refer to [Apple documentations](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/ModifyingNotifications.html).

### Windows

- **audio**: Add this key when you want the to play a sound. this will modify the audio attribute for toast notifications.
- **image**: Add this key when you want to modify the image attribute for tile and toast notifications.
