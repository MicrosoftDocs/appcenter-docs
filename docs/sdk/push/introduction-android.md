App Center Push enables you to send push notifications to users of your app from the App Center portal. App Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/).

Note that only devices having the [Google Play](https://play.google.com) store application or emulators with **Google APIs** images can receive the notifications.

> [!NOTE]
> A notification appears in the system notification center only if the application is in the background at the moment the Push is received.

## Prerequisites

### 1. Connect your app to Firebase

Before using App Center Push service, you need to connect your application to Firebase. Please learn about [Prerequisites](https://firebase.google.com/docs/android/setup#prerequisites).

### 2. Obtain your Android API Key and Sender ID

In the [Firebase Console](https://console.firebase.google.com), go to **Project Settings**. Navigate to the **Cloud Messaging** tab. Copy the **Server Key**. This will be the Android API Key that you will need to set in the App Center Push portal. Also make a note of the **Sender ID**, as you will need it later.