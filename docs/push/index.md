---
title: App Center Push
description: An introduction to the App Center Push service
keywords: app center,push
author: jwargo
ms.author: jowargo
ms.date: 04/09/2019
ms.topic: article
ms.assetid: B2CF9BFA-4C31-484C-83F7-9DD0E10AA8BD
ms.service: vs-appcenter
---

# App Center Push

The Visual Studio App Center Push (ACP) service is a notification aggregation service, it manages the process of sending notifications to devices using Push Notification Services (PNS) from Apple, Google, and Microsoft. You could easily build your own application that does this for you:

+ Managing the device registration process for each PNS
+ Tracking device registration data (so you know how to send notifications to devices later)
+ Building an application to send notifications through each PNS
+ Tracking success (or failure) for notifications

App Center Push takes care of all that for you. Add the App Center SDK to an app, and on app start the SDK automatically registers the device for push notifications (with the appropriate PNS for the target device). With that in place, use the App Center Portal or its REST API to define [audiences](~/push/send-notification.md#audiences) targeting app users, create campaigns, and send notifications to devices (and eventually users).

## Configuring App Center for Push Notifications

Configuring Push for your application project is as simple as:

1. Sign-up for a free App Center account at [https://appcenter.ms](https://appcenter.ms).
2. Create a new application project (what we call an **App** in App Center) or open an existing App project.
3. Select the **Push** option in the project navigation pane.
4. Configure any required settings for your app’s target platform. For example:
  a. Apple iOS devices use the [Apple Push Notification service](https://developer.apple.com/notifications/) (APNs) to deliver notifications, you’ll have some configuration to do in APNs to enable Push in App Center.
  b. Google Android devices use the [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/) (FCM) service to deliver notifications, so you’ll have some configuration to do in FCM to enable Push in App Center.
  c. Windows devices use the [Windows Notifications Services](https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/windows-push-notification-services--wns--overview) (WNS) to deliver notifications, so you’ll have some configuration to do in WNS to enable Push in App Center.
5. Copy the appropriate notification service settings into your App Center App project.

For additional information, refer to [Configuring the Push Service](~/push/service-config.md).

## Configuring Your Application for Push

To configure your application to handle push notifications, you’ll add the App Center SDK to your application to manage device registration, then write the code needed to process notifications when they arrive. The instructions for doing this varies depending on the target platform. For additional information, refer to the App Center Push SDK platform documentation:

+ [Android Push SDK documentation](~/sdk/push/android.md)
+ [iOS Push SDK documentation](~/sdk/push/ios.md)
+ [macOS Push SDK documentation](~/sdk/push/macos.md)
+ [React Native Android Push SDK documentation](~/sdk/push/react-native-android.md)
+ [React Native iOS Push SDK documentation](~/sdk/push/react-native-ios.md)
+ [UWP Push SDK documentation](~/sdk/push/uwp.md)
+ [Xamarin Android Push SDK documentation](~/sdk/push/xamarin-android.md)
+ [Xamarin iOS Push SDK documentation](~/sdk/push/xamarin-ios.md)
+ [Xamarin Forms Push SDK documentation](~/sdk/push/xamarin-forms.md)

## Device Registration

App Center Push can’t just push to any device. When a user runs your Push-enabled app for the first time after installation, the App Center Push SDK initializes and automatically registers the device running the application with the appropriate notification services. The SDK then provides App Center with the unique key (Install ID) it uses to send notifications to the device.

As you'll see later, you can use the Install ID to send a notification to a specific device.

## Sending Push Notifications

With the Push service configured, and devices running your application registered with the proper notification services, you’re ready to send notifications to devices. You can send notifications to devices two ways:

+ [App Center portal](~/push/send-notification.md).
+ [App Center REST API](~/push/rest-api.md).  

App Center supports the following notification targets:

+ **All registered devices**: Sends notifications to all registered devices.
+ **Audiences**: Sends notifications to a segment of your app's registered device audience based on a set of device and custom properties.
+ **Custom device list**: Sends notifications to up to 20 devices (using the install IDs for the target devices).

For additional information, refer to [Sending Push Notifications](~/push/send-notification.md).
