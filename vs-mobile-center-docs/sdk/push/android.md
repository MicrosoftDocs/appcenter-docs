---
title: Mobile Center Push for Android
description: Using Push in Mobile Center
keywords: sdk, push
author: guperrot
ms.author: guperrot
ms.date: 07/10/2017
ms.topic: article
ms.assetid: 45ba2c1e-55ad-4261-8f59-61e0b8f7edbc
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

[!include[](introduction-android.md)]

## Add Mobile Center Push to your app

Please follow the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

### 1. Add the Mobile Center Push module

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

1. Open your app level `build.gradle` file (`app/build.gradle`) and add the following lines after `apply plugin`. Include the dependencies that you want in your project. Each SDK module needs to be added as a separate dependency in this section. For integrating the Push module, add the following lines:

    ```groovy
    dependencies {
       def mobileCenterSdkVersion = '0.11.0'
       compile "com.microsoft.azure.mobile:mobile-center-push:${mobileCenterSdkVersion}"
    }
    ```

2. Make sure to trigger a Gradle sync in Android Studio.

### 2. Start Mobile Center Push

In order to use Mobile Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

Add `Push.class` to your `MobileCenter.start()` method to start Mobile Center Push service.

```java
MobileCenter.start(getApplication(), "{Your App Secret}", Push.class);
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Please check out the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

Android Studio will automatically suggest the required import statement once you add `Push.class` to the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.azure.mobile.MobileCenter;
import com.microsoft.azure.mobile.push.Push;
```

## Customize your usage of Mobile Center Push 

You can set up a listener to be notified whenever a push notification is received in foreground or a background push notification has been clicked by the user.

Firebase does not generate notifications when the push is received in foreground, so you can use the callback to customize the push experience when received in foreground or do a specific action when the application is launched by clicking on the push notification when received in background.

You need to register the listener before calling `MobileCenter.start` as shown in the following example:

```java
Push.setListener(new MyPushListener());
MobileCenter.start(...);
```

If your launcher activity uses a `launchMode` of `singleTop`, `singleInstance` or `singleTask`, you need to add this in the activity `onNewIntent` method:

```java
    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Push.checkLaunchedFromNotification(this, intent);
    }
```

Here is an example of the listener implementation that displays an alert dialog if the message is received in foreground or a toast if a background push has been clicked:

```java
public class MyPushListener implements PushListener {

    @Override
    public void onPushNotificationReceived(Activity activity, PushNotification pushNotification) {

        /* The following notification properties are available. */
        String title = pushNotification.getTitle();
        String message = pushNotification.getMessage();
        Map<String, String> customData = pushNotification.getCustomData();

        /*
         * Message and title cannot be read from a background notification object.
         * Message being a mandatory field, you can use that to check foreground vs background.
         */
        if (message != null) {

            /* Display an alert for foreground push. */
            AlertDialog.Builder dialog = new AlertDialog.Builder(activity);
            if (title != null) {
                dialog.setTitle(title);
            }
            dialog.setMessage(message);
            if (!customData.isEmpty()) {
                dialog.setMessage(message + "\n" + customData);
            }
            dialog.setPositiveButton(android.R.string.ok, null);
            dialog.show();
        } else {

            /* Display a toast when a background push is clicked. */
            Toast.makeText(activity, String.format(activity.getString(R.string.push_toast), customData), Toast.LENGTH_LONG).show(); // For example R.string.push_toast would be "Push clicked with data=%1s"
        }
    }
});
```

## Existing Firebase Analytics users

>[!NOTE]
>Mobile Center Push has a dependency on Firebase. Firebase Analytics is included in the core Firebase module and therefore, it's a dependency for Firebase messaging. Mobile Center Push SDK automatically disables Firebase Analytics to prevent unwanted data collection by Firebase.

If you are a Firebase customer and want to keep reporting analytics data to Firebase, you need to call the following method before `MobileCenter.start`:

```java
Push.enableFirebaseAnalytics(getApplication());
MobileCenter.start(getApplication(), "{Your App Secret}", Push.class);
```

## Enable or disable Mobile Center Push at runtime

You can enable and disable Mobile Center Push at runtime. If you disable it, the SDK will stop updating the Google registration identifier used to push but the existing one will continue working. In other words, disabling the Mobile Center Push in the SDK will **NOT** stop your application from receiving push notifications.

```java
Push.setEnabled(false);
```
To enable Mobile Center Push again, use the same API but pass `true` as a parameter.

```java
Push.setEnabled(true);
```

[!include[](../android-see-async.md)]

## Check if Mobile Center Push is enabled

You can also check if Mobile Center Push is enabled or not:

```java
Push.isEnabled();
```

[!include[](../android-see-async.md)]
