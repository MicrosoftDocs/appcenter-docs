App Center Push enables you to send push notifications to users of your app from the App Center portal. App Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/).

Note that only devices having the [Google Play](https://play.google.com) store application or emulators with **Google APIs** images can receive the notifications.

> [!NOTE]
> A notification appears in the system notification center only if the application is in the background at the moment the Push is received.

## Set up Firebase Cloud Messaging

You need a Google Account and use the Firebase console.

1. Create a project on the [Firebase console](https://console.firebase.google.com/).
2. Go to project settings (the cog icon).
3. Go to **Cloud Messaging** tab.
4. Copy the **Server Key**. You will need this key as part of the configuration of Push on the App Center portal for your application.
5. Copy the **Sender ID**, as you will need it in SDK integration.
