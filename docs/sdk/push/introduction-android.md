App Center Push enables you to send push notifications to users of your app from the App Center portal. App Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/).

Note that only devices having the [Google Play](https://play.google.com) store application or emulators with **Google APIs** images can receive the notifications.

> [!NOTE]
> A notification appears in the system notification center only if the application is in the background at the moment the Push is received.

## Prerequisites

### 1. Set up Firebase Cloud Messaging

- Create a project on the [Firebase Console](https://console.firebase.google.com).
- Press on the Android logo to create an application matching your package name.
- Go to **Project Settings** and download the **google-services.json** file.
- Copy this file to your Android project app module.

### 2. Obtain your Android API Key

In the [Firebase Console](https://console.firebase.google.com), go to **Project Settings**. Navigate to the **Cloud Messaging** tab. Copy the **Server Key**. This will be the Android API Key that you will need to set in the App Center Push portal.
