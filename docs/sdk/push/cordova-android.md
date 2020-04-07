---
title: App Center Push for Apache Cordova Android
description: Using Push in App Center
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 03/22/2019
ms.topic: get-started-article
ms.assetid: 40254112-9AEE-4393-AC63-E156441C0311
ms.tgt_pltfrm: cordova
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

> [!NOTE]
> For all the Android developers using App Center, there is a change coming where Firebase SDK is required to use Push Notifications. For Android P, its scheduled at the release date for the latest OS version. For all other versions of Android, it will be required after April 2019. Please follow [the SDK migration guide](migration/cordova-android.md).

[!INCLUDE [introduction to android](includes/introduction-android.md)]

## Add App Center Push to your app

Please follow the [Get started](~/sdk/getting-started/cordova.md) section if you haven't set up and started the SDK in your application yet. The App Center SDK is designed with a modular approach – you can integrate only those services that you're interested in.

To add App Center Push to your app open a Terminal and navigate to the root of your Cordova project, then enter the following to add App Center Push to the app:

```js
cordova plugin add cordova-plugin-appcenter-push
```

Please check out the [Get started](~/sdk/getting-started/cordova.md) section if you haven't set up and started the SDK in your application yet.

## Edit config.xml

Open the Apache Cordova project's **config.xml** file, and add **google-services.json** as resource-file inside platform android:

```xml
<platform name="android">
    <!-- Add this line -->
    <resource-file src="google-services.json" target="app/google-services.json" />
</platform>
```

## Intercept push notifications

You can set up a listener to be notified whenever a push notification is received in foreground or a background push notification has been clicked by the user.

> [!NOTE]
> A notification is not generated when your application receives a push in the foreground.
> 
> [!NOTE]
> If the push is received in background, the event is **NOT** triggered at receive time. The event is triggered when you click on the notification.
> 
> [!NOTE]
> The background notification click callback does **NOT** expose **title** and **message**. **Title** and **message** are only available in **foreground** pushes.

You need to register the listener when your app starts. A convenient place to do that is at `app.onDeviceReady` method of your project's `js/index.js` file:

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

## Custom data in your notifications

[!INCLUDE [custom data android](includes/custom-data-android.md)]

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

The state is persisted in the device's storage across application launches.

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


