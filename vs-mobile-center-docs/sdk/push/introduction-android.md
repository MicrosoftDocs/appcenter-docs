# Mobile Center Push

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin.Android](xamarin-android.md)
> * [Xamarin.iOS](xamarin-ios.md)
> * [Xamarin.Forms](xamarin-forms.md)
> * [React Native Android](react-native-android.md)
> * [React Native iOS](react-native-ios.md)

Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal. Mobile Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/).

Note that only devices having the [Google Play](https://play.google.com) store application or emulators with **Google APIs** images can receive the notifications.

> [!NOTE]
> Firebase displays a notification in the system notification center only if the application is in background at the moment the Push is received.

## Prerequisite - Add Firebase to your app

Before using Mobile Center Push service, you need to add Firebase to your application. You can either choose a manual integration or Firebase Assistant.

### 1. Prerequisites

Please learn about [Prerequisites](https://firebase.google.com/docs/android/setup#prerequisites), in particular please make sure to keep **Google Repository** up-to-date in the [Android SDK Manager](https://developer.android.com/studio/intro/update.html#sdk-manager).

### 2. Manual integration

1. Follow the instructions listed in [Manually add Firebase](https://firebase.google.com/docs/android/setup#manually_add_firebase) section.

2. Make sure to continue following instructions in **Add the SDK** sub section right after but do not add `compile "com.google.firebase:firebase-core:${version}"` as the SDK manages this step for you can it could trigger incompatibilities if versions mismatch.

### 3. Using Firebase Assistant

1. Follow [these instructions](https://developer.android.com/studio/write/firebase.html) if you don't see **Firebase** in the **Tools** menu.

2. Click on Tools > Firebase and follow **only** the first two following steps:

    1. Connect your app to Firebase

    2. Add FCM to your app

Step 3 is managed by Mobile Center SDK automatically, so you can stop after step 2.

> [!NOTE]
> 
> Please remove this if added automatically as the SDK manages this for you can it can trigger build errors if versions mismatch:
> 
> ```groovy
>    compile "com.google.firebase:firebase-core:${version}"
>    compile "com.google.firebase:firebase-messaging:${version}"
> ```

### 4. Obtain your Android API Key

Go to Project Settings and under Cloud Messaging, copy your Server Key. This will be the Android API Key that you will need to set in the Mobile Center Push portal.
