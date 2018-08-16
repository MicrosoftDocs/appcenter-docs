---
title: App Center Push
description: Help using the Push on App Center
keywords: app center, push
author: dimazaid
ms.author: dimazaid
ms.date: 08/08/2018
ms.topic: article
ms.assetid: B2CF9BFA-4C31-484C-83F7-9DD0E10AA8BD
ms.service: vs-appcenter
ms.custom: push
---

# Push Notifications

App Center Push allows you to engage your users by sending them targeted push notifications.

## How to set up Push Notifications

In order to set up Push Notifications, you will have to first set up the platform specific push services (Firebase Cloud Messaging (FCM), Apple Notifications Service (APNs), Windows Notifications Services (WNS). Then, you will need to integrate the Push App Center SDK. Note that the portal configuration needs to happen before the SDK configuration. You can follow specific instructions on how to set up Push Notifications in the Push portal or in our SDK documentation [Android](~/sdk/push/android.md), [iOS](~/sdk/push/ios.md), [UWP](~/sdk/push/uwp.md), [Xamarin Android](~/sdk/push/xamarin-android.md), [Xamarin iOS](~/sdk/push/xamarin-ios.md), [Xamarin Forms](~/sdk/push/xamarin-forms.md), [React Native Android](~/sdk/push/react-native-android.md), [React Native iOS](~/sdk/push/react-native-ios.md) and [macOS](~/sdk/push/macos.md).


## Sending Push Notifications

Once App Center Push is configured following the instructions above, you are ready to start sending notifications to your users. By clicking the "Send Notification" button on top right of the page, a panel will show up where you will have to include:
- Campaign Name: this name will be used to track the campaign but your users will not see it.
- Title: title of the notification that your user will receive.
- Message: content of the push notification.

You can also attach custom data along with your notification. More information on this can be found later in this document.

![Send Notification](~/push/images/send-notification.png "Campaign Name and Message fields are required to send a notification")


The next step is to select your target. You can send the notification to:
- All registered devices: all your users with push notifications opt-in will received the message.
- Custom devices list: the notification will be sent to the list of install IDs that you include. You can get the install IDs by using our [SDK API](~/sdk/other-apis/android.md).
- [Audiences](~/push/audiences.md): this will send a notification to a segment of your users based on a set of device and [custom properties](~/sdk/other-apis/ios.md).

## Custom Data in your notifications

You can send optional custom data as part of the push payload. The data will be sent in the key-value format. This custom data can be intercepted in the app through Push SDK callback.

There are few reserved keywords in each platform that can be set via custom data:

### Android
- **color**: The notification's icon color, expressed in `#rrggbb` format. Will be applied only on devices with Android 5.0 and later.
- **icon**: The notification's icon. You should specify **name** of the icon resource. Supports `drawable` and `mipmap` types. If this value isn't specified application icon will be used.
- **sound**: Add this key when you want the to play a sound when the device receives the notification. Supports `default` or the filename of a sound resource bundled in the app. Sound files must reside in `/res/raw/`. This is effective only for devices running or targeting an Android version lower than 8. Sound is set by default on Android 8 and user can change notification settings for the group of notifications coming from AppCenter.

### iOS
- **badge**: Add this key when you want to modify the badge of your app icon. If this key is not included, the badge is not changed. To remove the badge, set the value of this key to 0.
- **sound**: Add this key when you want the to play a sound. The value of this key is the name of a sound file in your app's main bundle or in the `Library/Sounds` folder of your app’s data container. If the sound file cannot be found, or if you specify `default` for the value, the system plays the default alert sound.
- **content-available**: Add this key with a value of 1 to configure a silent notification. When this key is present, the system wakes up your app in the background and delivers the notification to its app delegate. For information about configuring and handling silent notifications, see [Configuring a Silent Notification](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CreatingtheNotificationPayload.html#//apple_ref/doc/uid/TP40008194-CH10-SW8).
- **mutable-content**: Add this key with a value of 1 to enable media attachments. The application needs to support a service extension to download and handle the attachment content. For more information you can refer to [Apple documentations](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/ModifyingNotifications.html).

### Windows
- **audio**: Add this key when you want the to play a sound. this will modify the audio attribute for toast notifications.
- **image**: Add this key when you want to modify the image attribute for tile and toast notifications.
