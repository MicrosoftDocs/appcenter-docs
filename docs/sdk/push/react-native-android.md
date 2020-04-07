---
title: App Center Push for React Native Android
description: Using Push in App Center
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 08/22/2019
ms.topic: article
ms.assetid: 656B7FAD-2210-467A-B82F-EF9538DD2D00
ms.tgt_pltfrm: react-native
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
> 
> [!NOTE]
> For Android developers using App Center, there is a change coming where Firebase SDK is required to use Push Notifications. For Android P, its required at the release date for the latest OS version. For all other versions of Android, it will be required after April 2019. For additional information, please refer to the [App Center React Native migration guide](migration/react-native-android.md).

[!INCLUDE [introduction to android](includes/introduction-android.md)]

## Add App Center Push to your app

Please follow the [Get started](~/sdk/getting-started/react-native.md) section if you haven't set up and started the SDK in your application, yet.
The App Center SDK is designed with a modular approach – you only need to integrate the services that you're interested in.

First, open a Terminal and navigate to the root of your React Native project. Then, enter the following to add App Center Push to the app:

   ```bash
   npm install appcenter-push --save-exact
   ```

## Integrate Firebase in your application

- Copy the **google-services.json** file to your Android project app module folder (it should be **android/app** folder for most projects).
- Modify the **android/build.gradle** file:

    ```groovy
    buildscript {
        repositories {
            // Add google line if missing before jcenter
            google()
            jcenter()
        }

        dependencies {
            // Add this line
            classpath 'com.google.gms:google-services:4.3.0'
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

- Modify the **android/app/build.gradle** file:

    ```groovy
    // Add this line at the bottom
    apply plugin: 'com.google.gms.google-services'
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

[!INCLUDE [react native listener](includes/react-native-listener.md)]

If (**and only if**) your launcher activity uses a `launchMode` of `singleTop`, `singleInstance` or `singleTask`, you must override the `onNewIntent` method. Inside the Java code for your launcher activity (typically the **MainActivity.java** file), add the following:

```java
import android.content.Intent;
import com.microsoft.appcenter.push.Push;

@Override
public void onNewIntent(Intent intent) {
    super.onNewIntent(intent);
    Push.checkLaunchedFromNotification(this, intent);
}
```

## Custom data in your notifications

[!INCLUDE [custom data android](includes/custom-data-android.md)]

## Configure notification's default values

[!INCLUDE [android configure notifications](includes/android-configure-notifications.md)]

## Existing Firebase Analytics users

The App Center Push SDK automatically disables Firebase Analytics. If you are a Firebase customer and want to keep reporting analytics data to Firebase, you must call a method to enable it by default. To do this, look for the `onCreate` method in the `MainApplication.java` file and add the following before `SoLoader.init`:

```java
Push.enableFirebaseAnalytics(getApplication());
SoLoader.init(this, false);
```

## Enable or disable App Center Push at runtime

You can enable and disable App Center Push at runtime. If you disable it, the SDK will stop updating the Google registration identifier used to push but the existing one will continue working. In other words, disabling the App Center Push in the SDK will **NOT** stop your application from receiving push notifications.

```javascript
import Push from 'appcenter-push';

...

await Push.setEnabled(false);      // Disable push
await Push.setEnabled(true);       // Re-enable it
```

The state is persisted in the device's storage across application launches.

## Check if App Center Push is enabled

You can also check if App Center Push is enabled or not:

```javascript
import Push from 'appcenter-push';

...

const pushEnabled = await Push.isEnabled();
```

## Delay first time initialization of Push

If you want to delay Push initialization the first time the application is run:

* Edit the **android/app/src/main/assets/appcenter-config.json** file.
* Add `, "enable_push_in_javascript": true` before the last `}` of the file.
* Once you get approval from the user to use Push at runtime, call `Push.setEnabled(true)`.

After calling `Push.setEnabled(true)` once, App Center Push will be started automatically the next time the application restarts.
