---
title: App Center Push for Android
description: Using Push in App Center
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 02/12/2019
ms.topic: article
ms.assetid: 45ba2c1e-55ad-4261-8f59-61e0b8f7edbc
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
dev_langs:
 - java
 - kotlin
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
>
> [!NOTE]
> For all the Android developers using App Center, there is a change coming where Firebase SDK is required to use Push Notifications. For Android P, it is scheduled at the release date for the latest OS version. For all other versions of Android, it will be required after April 2019. Please follow [the SDK migration guide](migration/android.md).

[!include[](introduction-android.md)]

## Add App Center Push to your app

Please follow the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

### 1. Add the App Center Push module

The App Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

1. Modify the **project root** level **build.gradle** file:

    ```groovy
    buildscript {
        repositories {
            // Add google line if missing before jcenter
            google()
            jcenter()
        }

        dependencies {
            // Add this line
            classpath 'com.google.gms:google-services:4.0.1'
        }
    }

    allprojects {
        repositories {
            // Add google line if missing before jcenter
            google()
            jcenter()
        }
    }
    ```

    > [!NOTE]
    > Google introduced the `google()` repository with Gradle v4. If your Gradle version is lower than v4, then you need to use `maven { url 'https://maven.google.com' }` instead of `google()`.

2. Modify the **app** level **build.gradle** file:

    ```groovy
    dependencies {
        // Add App Center Push module dependency
        def appCenterSdkVersion = '1.11.3'
        implementation "com.microsoft.appcenter:appcenter-push:${appCenterSdkVersion}"
    }

    // Add this line at the bottom
    apply plugin: 'com.google.gms.google-services'
    ```

    > [!NOTE]
    > If the version of your Android Gradle plugin is lower than 3.0.0, then you need to replace the word **implementation** by **compile**.

3. Make sure to trigger a Gradle sync in Android Studio.

### 2. Start App Center Push

In order to use App Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

Add the `Push` class to your `AppCenter.start()` method to start App Center Push.

```java
AppCenter.start(getApplication(), "{Your App Secret}", Push.class);
```
```kotlin
AppCenter.start(application, "{Your App Secret}", Push::class.java)
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Please check out the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

Android Studio automatically suggests the required import statement once you add `Push` to the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.push.Push;
```
```kotlin
import com.microsoft.appcenter.AppCenter
import com.microsoft.appcenter.push.Push
```

## Intercept push notifications

You can set up a listener to be notified whenever a push notification is received in foreground or a background push notification has been clicked by the user.

> [!NOTE]
> A notification is not generated when your application receives a push in the foreground.
>
> [!NOTE]
> If the push is received in background, the event is **NOT** triggered at receive time.
> The event is triggered when you click on the notification.
>
> [!NOTE]
> The background notification click callback does **NOT** expose **title** and **message**.
> **Title** and **message** are only available in **foreground** pushes.

You need to register the listener before calling `AppCenter.start` as shown in the following example:

```java
Push.setListener(new MyPushListener());
AppCenter.start(...);
```
```kotlin
Push.setListener(MyPushListener())
AppCenter.start(...)
```

If (**and only if**) your launcher activity uses a `launchMode` of `singleTop`, `singleInstance` or `singleTask`, you need to add this in the activity `onNewIntent` method:

```java
@Override
protected void onNewIntent(Intent intent) {
    super.onNewIntent(intent);
    Push.checkLaunchedFromNotification(this, intent);
}
```
```kotlin
override fun onNewIntent(intent: Intent?) {
    super.onNewIntent(intent)
    Push.checkLaunchedFromNotification(this, intent)
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
}
```
```kotlin
class MyPushListener : PushListener {

    override fun onPushNotificationReceived(activity: Activity, pushNotification: PushNotification) {

        /* The following notification properties are available. */
        val title = pushNotification.getTitle()
        val message = pushNotification.getMessage()
        val customData = pushNotification.getCustomData()

        /*
         * Message and title cannot be read from a background notification object.
         * Message being a mandatory field, you can use that to check foreground vs background.
         */
        if (message != null) {

            /* Display an alert for foreground push. */
            val dialog = AlertDialog.Builder(activity)
            if (title != null) {
                dialog.setTitle(title)
            }
            dialog.setMessage(message)
            if (!customData.isEmpty()) {
                dialog.setMessage(message + "\n" + customData)
            }
            dialog.setPositiveButton(android.R.string.ok, null)
            dialog.show()
        } else {

            /* Display a toast when a background push is clicked. */
            Toast.makeText(
                activity,
                String.format(activity.getString(R.string.push_toast), customData),
                Toast.LENGTH_LONG
            ).show() // For example R.string.push_toast would be "Push clicked with data=%1s"
        }
    }
}
```

## Custom data in your notifications

[!include[](custom-data-android.md)]

## Configure notification's default values

[!include[](android-configure-notifications.md)]

## Existing Firebase Analytics users

App Center Push SDK automatically disables Firebase Analytics. If you are a Firebase customer and want to keep reporting analytics data to Firebase, you must call the following method before `AppCenter.start`:

```java
Push.enableFirebaseAnalytics(getApplication());
AppCenter.start(getApplication(), "{Your App Secret}", Push.class);
```

## Enable or disable App Center Push at runtime

You can enable and disable App Center Push at runtime. If you disable it, the SDK will stop updating the Google registration identifier used to push but the existing one will continue working. In other words, disabling the App Center Push in the SDK will **NOT** stop your application from receiving push notifications.

```java
Push.setEnabled(false);
```
```kotlin
Push.setEnabled(false)
```

To enable App Center Push again, use the same API but pass `true` as a parameter.

```java
Push.setEnabled(true);
```
```kotlin
Push.setEnabled(true)
```

[!include[](../android-see-async.md)]

## Check if App Center Push is enabled

You can also check if App Center Push is enabled or not:

```java
Push.isEnabled();
```
```kotlin
Push.isEnabled()
```

[!include[](../android-see-async.md)]
