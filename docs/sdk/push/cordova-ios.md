---
title: App Center Push for Cordova iOS
description: Using Push in App Center
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 02/14/2019
ms.topic: get-started-article
ms.assetid: 0953B40C-ED43-430A-9609-43ED212A1884
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: cordova
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

App Center Push enables you to send push notifications to your app users from the App Center portal.

## Prerequisite - Enable Apple Push Notifications service (APNs) for your app

Configure Apple Push Notifications service (APNs) for your app from your Apple developer account and App Center portal before adding App Center Push to your app.

### Enable push notifications on your application

In Xcode's project editor, choose your target and click **Capabilities**. In the **Push Notifications** section, click the switch to turn it ON.

![enable-push-capability](~/sdk/push/images/apple-enable-push-capability.png)

### Set up APNs

Log in to the App Center portal, select your application, click on the **Push** button from the left menu then click **Next** to reveal the push notification settings UI:

![app-center-push-settings](~/sdk/push/images/apple-push-settings-ac-portal.png)

* On the bottom of the page, select **Sandbox** for initial development or **Production** for production version of your application.

* Collect the following information:

  1. **Prefix** and **ID**

     * Go to your Apple developer account and select your application from the [App ID list](https://developer.apple.com/account/ios/identifier/bundle) in **Identifiers**.

     * Copy the **Prefix** value from this window and paste it to the App Center push settings.

     * Do the same with the **ID** value.

       ![apple-dev-center-app-id](~/sdk/push/images/ios-app-id-apple-portal.png)

  2. **Key ID**

     * In your Apple developer account create a [new key](https://developer.apple.com/account/ios/authkey/create) in **Certificates, Identifiers & Profiles/Keys**.

     * Make sure to check the APNs checkbox.

     * Fill in the key name

     * Press **Continue** then **Confirm**.

       ![apple-dev-center-new-auth-key](~/sdk/push/images/ios-new-auth-key-apple-portal.png)

     * On the next screen, copy the **Key ID** value and paste it to the App Center push settings.

     * Download the key file.

       ![apple-dev-center-confirm-auth-key](https://docs.microsoft.com/en-us/appcenter/sdk/push/images/ios-confirm-auth-key-apple-portal.png)

  3. **Push Token**

     * On the App Center push settings page, upload your key file using the button labelled "Auth key file:" (you can also drag and drop the file onto it):

       ![auth-key-file](https://docs.microsoft.com/en-us/appcenter/sdk/push/images/apple-push-settings-upload-key-button.png)

     * Click Done to complete this configuration.

For more information, refer to the [Apple documentation](http://help.apple.com/xcode/mac/current/#/dev11b059073).

#### [Optional] Enable silent notifications

[!include[](ios-enable-silent-notifications.md)]

## Add App Center Push to your app

Please follow the [Get started](~/sdk/getting-started/cordova.md) section if you haven't set up and started the SDK in your application yet. The App Center SDK is designed with a modular approach – you can integrate only those services that you're interested in.

To add App Center Push to your app open a Terminal and navigate to the root of your Cordova project, then enter the following to add App Center Push to the app:

```js
cordova plugin add cordova-plugin-appcenter-push
```

## Intercept push notifications

You can set up a listener to be notified whenever a push notification is received in foreground or a background push notification has been tapped by the user. The listener may also be woken up when a notification is received in background if you have enabled [silent notifications](https://docs.microsoft.com/en-us/appcenter/sdk/push/react-native-ios#optional-enable-silent-notifications) and if the payload of the notification contains the [content-available](https://docs.microsoft.com/en-us/appcenter/push/index#custom-data-in-your-notifications) flag set to true.

> [!NOTE]
> If silent notifications are enabled and you push a notification with `content-available: 1`, then the listener may be triggered twice for the same notification: when the notification is received in background and when it is tapped.

By default, iOS does not generate notifications when the push is received in foreground, you can use the listener to customize the push experience when received in foreground or do a specific action when the application is launched by clicking on the push notification when received in background.

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

## Custom data in your notifications

[!include[](custom-data-ios.md)]

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
