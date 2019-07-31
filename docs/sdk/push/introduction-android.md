App Center Push enables you to send push notifications to users of your app from the App Center portal. App Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/).

Only devices with the [Google Play Store](https://play.google.com) application or emulators using **Google APIs** images can receive notifications.

> [!NOTE]
> A notification appears in the system notification center only if the application is in the background at the moment the Push is received.

## Prerequisites

### 1. Set up Firebase Cloud Messaging

1. Create a project on the [Firebase Console](https://console.firebase.google.com).
2. Click the Android logo on the page to create an application matching your package name.
3. Go to **Project Settings** and download the **google-services.json** file.
4. Copy this file to your Android project app module.

### 2. Obtain your Android API Key

1. In the [Firebase Console](https://console.firebase.google.com), go to **Project Settings**. 
2. Navigate to the **Cloud Messaging** tab. 
3. Copy the **Server Key**. This will be the Android API Key that you will need to set in the App Center Push portal.
