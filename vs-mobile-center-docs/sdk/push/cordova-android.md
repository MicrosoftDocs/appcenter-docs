---
title: App Center Push for Apache Cordova Android
description: Using Push in App Center
keywords: sdk, push
author: ruslan-bikkinin
ms.author: v-rubikk
ms.date: 12/21/2017
ms.topic: get-started-article
ms.assetid: 40254112-9AEE-4393-AC63-E156441C0311
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: cordova
---
# App Center Push

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin.Android](xamarin-android.md)
> * [Xamarin.iOS](xamarin-ios.md)
> * [Xamarin.Forms](xamarin-forms.md)
> * [React Native Android](react-native-android.md)
> * [React Native iOS](react-native-ios.md)
> * [macOS](macos.md)
> * [Cordova Andriod](cordova-android.md)
> * [Cordova iOS](cordova-ios.md)

App Center Push enables you to send push notifications to users of your app from the App Center portal. App Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/).

Note that only devices having the [Google Play](https://play.google.com/) store application or emulators with Google APIs images can receive the notifications.

> [!NOTE]
> A notification appears in the system notification center only if the application is in the background at the moment the Push is received.

## Prerequisites

### 1. Connect your app to Firebase

Before using App Center Push service, you need to connect your application to Firebase. Please learn about [Prerequisites](https://firebase.google.com/docs/android/setup#prerequisites).

### 2. Obtain your Android API Key and Sender ID

In the [Firebase Console](https://console.firebase.google.com/), go to **Project Settings**. Navigate to the **Cloud Messaging** tab. Copy the **Server Key**. This will be the Android API Key that you will need to set in the App Center Push portal. Also make a note of the **Sender ID**, as you will need it later.

## Add App Center Push to your app

Please follow the [Get started](~/sdk/getting-started/cordova.md) section if you haven't set up and started the SDK in your application yet. The App Center SDK is designed with a modular approach – you can integrate only those services that you're interested in.

To add App Center Push to your app open a Terminal and navigate to the root of your Cordova project, then enter the following to add App Center Push to the app:

```js
cordova plugin add cordova-plugin-appcenter-push
```

## Set the Sender ID

App Center Push SDK requires the **Sender ID** obtained in the "Prerequisites" section. Add following preference to `android` platform in your `config.xml`:

```js
<preference name="FIREBASE_SENDER_ID" value="'{Your Sender ID}'" />
```

Make sure that you have replaced `{Your Sender ID}` with the **Sender ID** obtained in the "Prerequisites" section. 

> [!NOTE]
> It is important to surround `{Your Sender ID}` with single quotes because there is a [bug](https://issuetracker.google.com/issues/37009529) in android platform that leads to incorrect interpretation of numerical strings (such format Firebase uses for **Sender ID**). Otherwise, your push notifications may not be working.

Please check out the [Get started](~/sdk/getting-started/cordova.md) section if you haven't set up and started the SDK in your application yet.

## Intercept push notifications

You can set up a listener to be notified whenever a push notification is received in foreground or a background push notification has been clicked by the user.

> [!NOTE]
> A notification is not generated when your application receives a push in the foreground.

> [!NOTE]
> If the push is received in background, the event is **NOT** triggered at receive time. The event is triggered when you click on the notification.

> [!NOTE]
> The background notification click callback does **NOT** expose **title** and **message**. **Title** and **message** are only available in **foreground** pushes.

You need to register the listener when your app starts. A convenient place to do that is at `app.onDeviceReady` method of your `js/index.js:

```js
var app = {

  onDeviceReady: function() {
    
    var onNotificationReceived = function(pushNotification) {
        var message = pushNotification.message;
        var title = pushNotification.title;

        if (message === null || message === undefined) {
            // Android messages received in the background don't include a message. On Android, that fact can be used to
            // check if the message was received in the background or foreground. For iOS the message is always present.
            title = 'Android background';
            message = '<empty>';
        }

        // Custom name/value pairs set in the App Center web portal are in customProperties
        if (pushNotification.customProperties && Object.keys(pushNotification.customProperties).length > 0) {
            message += '\nCustom properties:\n' + JSON.stringify(pushNotification.customProperties);
        }
        
        console.log(title, message);
    }

    AppCenter.Push.addEventListener('notificationReceived', onNotificationReceived);    
  
    // ...
    
  },  

};

app.initialize();
```

## Enable or disable App Center Push at runtime

You can enable and disable App Center Push at runtime. If you disable it, the SDK will stop updating the Google registration identifier used to push but the existing one will continue working. In other words, disabling the App Center Push in the SDK will **NOT** stop your application from receiving push notifications.

```js
var enableSuccess = function() {
    console.log("push notifications enabled");
}

var disableSuccess = function() {
    console.log("push notifications disabled");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Push.setEnabled(false, disableSuccess, error); // Disable push
AppCenter.Push.setEnabled(true, enableSuccess, error); // Re-enable it
```

## Check if App Center Push is enabled

You can also check whether App Center Push is enabled:

```js
var success = function(result) {
    console.log("push notifications " + (result) ? "enabled" : "disabled");
}

var error = function(error) {
    console.error(error);
}

AppCenter.Push.isEnabled(success, error);
```


