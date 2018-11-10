---
# required metadata

title: App Center Push for Xamarin.Forms Apps
description: Integrating App Center Push into Xamarin.Forms applications
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 06/04/2018
ms.topic: article
ms.assetid: e3384f0b-fafd-4345-b9bb-4e683391bf74
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: xamarin.forms
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

App Center Push enables you to send push notifications to users of your app from the App Center portal.

## Prerequisite - Perform platform-specific setup

Push notifications work differently on UWP, iOS, and Android, therefore, before the shared APIs can be leveraged in Xamarin.Forms, you need to perform some setup on each platform. Follow the instructions for integrating push with each of the platform-specific setup guides for Push, and then return here.

### Setup Guides
* [Xamarin.Android](xamarin-android.md)
* [Xamarin.iOS](xamarin-ios.md)
* [UWP](uwp.md)

> [!IMPORTANT]
> Even if you only access the `AppCenter` or `Push` class from your shared or PCL project, the App Center NuGet packages must be added to each platform-specific project.

## Add App Center Push to your app

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up and started the SDK in your application yet.

### 1. Add the App Center Push module

[!include[](add-nuget.md)]

### 2. Start App Center Push

[!include[](start-push.md)]

## Intercept push notifications

App Center Push makes it possible to intercept push notifications but there is some additional setup required to enable this feature in platform specific projects.

### iOS additional steps

> [!NOTE]
> You only need this step if you disabled method swizzling while setting up [Xamarin.iOS](xamarin-ios.md).

To enable the push event feature, implement `DidReceiveRemoteNotification` in your `AppDelegate` class as follows:

```csharp
public override void DidReceiveRemoteNotification(UIApplication application, NSDictionary userInfo, System.Action<UIBackgroundFetchResult> completionHandler)
{
	var result = Push.DidReceiveRemoteNotification(userInfo);
	if (result)
	{
		completionHandler?.Invoke(UIBackgroundFetchResult.NewData);
	}
	else
	{
		completionHandler?.Invoke(UIBackgroundFetchResult.NoData);
	}
}
```

### Android additional steps

#### Launch mode

If (**and only if**) your launcher activity uses a `launchMode` of `singleTop`, `singleInstance` or `singleTask`, you need to add this in the activity `OnNewIntent` method:

```csharp
        protected override void OnNewIntent(Android.Content.Intent intent)
        {
            base.OnNewIntent(intent);
            Push.CheckLaunchedFromNotification(this, intent);
        }
```

#### Splash screen activity

This section applies if you have a [Splash Screen activity](https://docs.microsoft.com/en-us/xamarin/android/user-interface/splash-screen) (or a similar concept) that starts the main activity and main activity is the one creating the forms application.

When you click on the push notification if the application is not launched, the push information are intent extras in the launcher activity which is the splash screen. This intent needs to be copied to the main activity if the SDK is initialized in the main activity in order to process that information.

The simplest way of doing that is to locate the code where you start your main activity from the launcher activity:

```csharp
    // Most apps have this
    StartActivity(new Intent(this, typeof(MainActivity)));
```

And modify it like this:

```csharp
    var intent = new Intent(this, typeof(MainActivity));
    if (Intent.Extras != null)
        intent.PutExtras(Intent.Extras); // copy push info from splash to main
    StartActivity(intent);
```

### UWP additional steps

To enable the push event feature, modify your UWP application's `OnLaunched` method to include `Push.CheckLaunchedFromNotification(e);` at the end as follows:

```csharp
protected override void OnLaunched(LaunchActivatedEventArgs e)
{
    // ... not showing entire long method ...
    if (e.PrelaunchActivated == false)
    {
        if (rootFrame.Content == null)
        {
            // This is what triggers Xamarin.Forms portable App.OnStart method where you typically call AppCenter.Start
            rootFrame.Navigate(typeof(MainPage), e.Arguments);
        }
        Window.Current.Activate();
    }

    // Best place to call this method
    Push.CheckLaunchedFromNotification(e);

    // End of method
}
```

### Subscribe to the push event

[!include[](dotnet-push-event-intro.md)]

The behavior of the event depends on:

* The platform (iOS vs Android vs UWP).
* Whether the push is received while application is in foreground or background.

For all platforms, when the push is received in background, the event is not 
fired right away, the user will first see an Android system notification, an
iOS alert or a UWP toast.

The event is **fired only by clicking the notification** in that case.

When the push is received in **foreground**, the event is fired right away but
**no notification** is shown to user.

> [!NOTE]
> When the push is clicked from background on **Android and UWP**, the event **does not** have **title**
> and **message** in the event arguments, only iOS expose those fields for all events.
> 
> [!NOTE]
> On iOS only, if silent notifications are enabled **and** you push a notification with `content-available: 1`, then the event may be triggered twice for the same notification: when the notification is received in background and when it is tapped.

[!include[](dotnet-push-event-example.md)]

## Custom Data in your notifications

You can send optional custom data as part of the push payload. The data will be sent in the key-value format. This custom data can be intercepted in the app through Push SDK callback.

There are few reserved keywords in each platform that can be set via custom data:

### Android
- **color**: The notification's icon color, expressed in `#rrggbb` format. Will be applied only on devices with Android 5.0 and later.
- **icon**: The notification's icon. You should specify **name** of the icon resource. Supports `drawable` and `mipmap` types. If this value isn't specified application icon will be used.
- **sound**: Add this key when you want the to play a sound when the device receives the notification. Supports `default` or the filename of a sound resource bundled in the app. Sound files must reside in `/res/raw/`. This is effective only for devices running or targeting an Android version lower than 8. Sound is set by default on Android 8 and user can change notification settings for the group of notifications coming from AppCenter.

#### Configure notification's default values

[!include[](android-configure-notifications.md)]

### iOS
- **badge**: Add this key when you want to modify the badge of your app icon. If this key is not included, the badge is not changed. To remove the badge, set the value of this key to 0.
- **sound**: Add this key when you want the to play a sound. The value of this key is the name of a sound file in your app's main bundle or in the `Library/Sounds` folder of your app’s data container. If the sound file cannot be found, or if you specify `default` for the value, the system plays the default alert sound.
- **content-available**: Add this key with a value of 1 to configure a silent notification. When this key is present, the system wakes up your app in the background and delivers the notification to its app delegate. For information about configuring and handling silent notifications, see [Configuring a Silent Notification](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CreatingtheNotificationPayload.html#//apple_ref/doc/uid/TP40008194-CH10-SW8).
- **mutable-content**: Add this key with a value of 1 to enable media attachments. The application needs to support a service extension to download and handle the attachment content. For more information you can refer to [Apple documentations](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/ModifyingNotifications.html).

### Windows
- **audio**: Add this key when you want the to play a sound. this will modify the audio attribute for toast notifications.
- **image**: Add this key when you want to modify the image attribute for tile and toast notifications.

## Enable or disable Push at runtime

[!include[](enable-or-disable.md)]
