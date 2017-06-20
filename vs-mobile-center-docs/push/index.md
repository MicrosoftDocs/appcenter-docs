---
title: Mobile Center Push
description: Help using the Push on Mobile Center
keywords: mobile center, push
author: blparr
ms.author: blparr
ms.date: 05/11/2017
ms.topic: article
ms.assetid: B2CF9BFA-4C31-484C-83F7-9DD0E10AA8BD
ms.service: mobile-center
ms.custom: push
---

# Push Notifications

With Mobile Center Push you can engage your users by sending them push notifications. These messages can be sent to all your users, specific devices, or to a segment of your user base that will be defined by a set of device and custom properties.

## How to set up Push Notifications

In order to set up Push Notifications, you will have to set up the Push Mobile Center SDK, as well as the platform specific push services (Firebase Cloud Messaging (FCM), Apple Notifications Service (APNs), Windows Notifications Services (WNS). The SDK instructions and platform specific push services can be found at:
- [Android](~/sdk/push/android.md)
- [iOS](~/sdk/push/ios.md)
- [UWP](~/sdk/push/uwp.md)
- [Xamarin Android](~/sdk/push/xamarin-android.md)
- [Xamarin iOS](~/sdk/push/xamarin-ios.md)
- [Xamarin Forms](~/sdk/push/xamarin-forms.md)
- [React Native Android](~/sdk/push/react-native-android.md)
- [React Native iOS](~/sdk/push/react-native-ios.md)

## Sending Push Notifications

Once Mobile Center Push is configured, you are ready to start sending notifications to your users. By clicking the "Send Notification" button on top right of the page, a panel will show up where you will have to include:
- Campaign Name: this name will be used to track the campaign but your users will not see it.
- Title: title of the notification that your user will receive.
- Message: content of the push notification.

You can also attach some custom data to notification. More information on this can be found below.

The next step is to select your target. You can send the notification to:
- All registered devices: all your users with push notifications opt-in will received the message.
- Custom devices list: the notification will be sent to the list of install IDs that you include. You can get the install IDs by using our [API](~/sdk/other-apis/android.md).
- Audiences: this will send a notification to a segment of your users based on a set of properties.

## Custom Data in your notifications

You can send optional custom data as part of the push payload. The data will be sent in the key-value format. This custom data can be intercepted in the app through Push SDK callback. Documentation for this can be found in the our [Push SDK docs](~/sdk/push/android.md)

There are few reserved keywords in each platform that can be set via custom data:
### iOS:
- **badge**: Add this key when you want to modify the badge of your app icon. If this key is not included, the badge is not changed. To remove the badge, set the value of this key to 0.
- **sound**: Add this key when you want the to play a sound. The value of this key is the name of a sound file in your app's main bundle or in the `Library/Sounds` folder of your app’s data container. If the sound file cannot be found, or if you specify `default` for the value, the system plays the default alert sound.

### Android:
- **color**: The notification's icon color, expressed in #rrggbb format.
- **icon**: The notification's icon.
- **sound**: Add this key when you want the to play a sound when the device receives the notification. Supports `default` or the filename of a sound resource bundled in the app. Sound files must reside in `/res/raw/`.

### Windows:
- **audio**: Add this key when you want the to play a sound. this will modify the audio attribute for toast notifications.
- **image**: Add this key when you want to modify the image attribute for tile and toast notifications.

## Audiences

Audiences let you segment your users based on a set of properties and send targeted notifications to these audiences. These properties are of two types:
- Device Properties: App Version, Country, Mobile Carrier, Language, Language Variant, Device Model, OEM, API Level, Device OS, Device OS Version, Screen Size, Time Zone Offset
- Custom Properties: These properties are key-value pairs defined by the users. This will allow you to segment your user base on properties of your app specific.
