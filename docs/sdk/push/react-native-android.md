---
title: App Center Push for React Native Android
description: Using Push in App Center
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 07/23/2018
ms.topic: article
ms.assetid: 656B7FAD-2210-467A-B82F-EF9538DD2D00
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: react-native
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
> 
> [!NOTE]
> For Android developers using App Center, there is a change coming where Firebase SDK is required to use Push Notifications. For Android P, its required at the release date for the latest OS version. For all other versions of Android, it will be required after April 2019. For additional information, please refer to the [App Center React Native migration guide](migration/react-native-android.md).

[!include[](introduction-android.md)]

## Add App Center Push to your app

Please follow the [Get started](~/sdk/getting-started/react-native.md) section if you haven't set up and started the SDK in your application, yet.
The App Center SDK is designed with a modular approach – you only need to integrate the services that you're interested in.

1. Open a Terminal and navigate to the root of your React Native project, then enter the following to add App Center Push to the app:

    ```
    npm install appcenter-push --save
    ```

2. Link the plugin to the React Native app by using the react-native link command.

    ```
    react-native link appcenter-push
    ```

    Those steps modify your project's **MainApplication.java** file, adding `AppCenterReactNativePushPackage` there.

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

[!include[](react-native-listener.md)]

## Custom data in your notifications

[!include[](custom-data-android.md)]

## Configure notification's default values

[!include[](android-configure-notifications.md)]

## Existing Firebase Analytics users

The App Center Push SDK automatically disables Firebase Analytics. If you are a Firebase customer and want to keep reporting analytics data to Firebase, you need to call a method to enable it by default. To do this, look for the `onCreate` method in the **MainApplication.java** file and add the following before `SoLoader.init`:

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

## Check if App Center Push is enabled

You can also check if App Center Push is enabled or not:

```javascript
import Push from 'appcenter-push';

...

const pushEnabled = await Push.isEnabled();
```
