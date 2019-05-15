---
title: Tips and Tricks
description: Tips and Tricks for using the App Center Push Service
keywords: app center, push
author: jwargo
ms.author: jowargo
ms.date: 05/15/2019
ms.topic: article
ms.assetid: f0e3bd85-817a-423f-a1ca-b89c487d0180
ms.service: vs-appcenter
ms.custom: push
---

# Tips and tricks

This document contains tips and tricks for the App Center Push service.

## Delay showing Push Notifications permission pop-up until the user clicks a button or a certain screen

Execute `AppCenter.Start("{APP-SECRET}", services)` without specifying the Push service until the user has opted in to receive push notification, opt-in can be checked using iOS APIs.

Then, once the user has opted in to receive push notifications, execute `AppCenter.Start(typeof(Push))` to start the Push service.

Note the application **must not** specify the app secret in the second call to `Start()`.

### Xamarin solution

First, add an opt-in menu or button, once user opt-in, call:

```csharp
AppCenter.Start(typeof(Push));
```

For further launches, the Push service must be started as soon as possible to be able to use the event handler.
Follow the instructions in the section corresponding to your framework (with or without Xamarin.Forms).

#### With Xamarin.Forms

Modify the project's **App.xaml.cs** file:

```csharp
// Add this property
public bool StartPush { get; set; } = true;

protected override void OnStart()
{
    AppCenter.Start($"uwp={UwpKey};android={AndroidKey};ios={IosKey}", typeof(Analytics), typeof(Crashes));
    if (StartPush)
    {
        AppCenter.Start(typeof(Push));
    }
}
```

Modify the project's **AppDelegate.cs** file:

```csharp
// Add this using
using UserNotifications;

public override bool FinishedLaunching(UIApplication uiApplication, NSDictionary launchOptions)
{
    Xamarin.Forms.Forms.Init();

    // App is extracted as local variable, your app code probably has it inlined.
    var app = new App()
    {
        StartPush = false
    };
    LoadApplication(app);
    if (UIDevice.CurrentDevice.CheckSystemVersion(10, 0))
    {
        var settings = UNUserNotificationCenter.Current.GetNotificationSettingsAsync().ContinueWith(task =>
        {
            if (task.Result.AuthorizationStatus == UNAuthorizationStatus.Authorized)
            {
                app.StartPush = true;
            }
        });
    }
    else if (UIApplication.SharedApplication.IsRegisteredForRemoteNotifications)
    {
        app.StartPush = true;
    }
    return base.FinishedLaunching(uiApplication, launchOptions);
}
```

### Without Xamarin.Forms

Modify the project's **AppDelegate.cs** file:

```csharp
// Add this using
using UserNotifications;

public override bool FinishedLaunching(UIApplication uiApplication, NSDictionary launchOptions)
{
    // your existing code before, then add the following block:
    if (UIDevice.CurrentDevice.CheckSystemVersion(10, 0))
    {
        var settings = UNUserNotificationCenter.Current.GetNotificationSettingsAsync().ContinueWith(task =>
        {
            if (task.Result.AuthorizationStatus == UNAuthorizationStatus.Authorized)
            {
                AppCenter.Start(typeof(Push));
            }
        });
    }
    else if (UIApplication.SharedApplication.IsRegisteredForRemoteNotifications)
    {
        AppCenter.Start(typeof(Push));
    }
    return base.FinishedLaunching(uiApplication, launchOptions);
}
```

## Custom Data in your notifications

Optional: send custom data as part of the push payload. The data is sent in a key-value format. This custom data can be intercepted in the app through Push SDK callback. 

There are few reserved keywords in each platform that can be set via custom data:

### Android

- **color**: The notification icon color, expressed in `#rrggbb` format. Only applies on devices running Android 5.0 and later.
- **icon**: The notification's icon. Specify the **name** of the icon resource. Supports `drawable` and `mipmap` types. If this value isn't specified, default application icon is used.
- **sound**: Add this key when you want the to play a sound. The value of this key is the name of a sound file in   `/res/raw/`. This option only applies on devices running or targeting an Android version lower than 8. Sound is set by default on Android 8 and users can change notification settings for the group of notifications coming from AppCenter.

### iOS

- **badge**: Add this key when you want to modify the badge of your app icon. If this key is not included, the badge is not changed. To remove the badge, set the value of this key to 0.
- **sound**: Add this key when you want the to play a sound. The value of this key is the name of a sound file in your app's main bundle or in the `Library/Sounds` folder of your app’s data container. If the sound file cannot be found, or if you specify `default` for the value, the system plays the default alert sound.
- **content-available**: Add this key with a value of 1 to configure a silent notification. When this key is present, the system wakes up your app in the background and delivers the notification to its app delegate. For information about configuring and handling silent notifications, see [Configuring a Silent Notification](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CreatingtheNotificationPayload.html#//apple_ref/doc/uid/TP40008194-CH10-SW8).
- **mutable-content**: Add this key with a value of 1 to enable media attachments. The application needs to support a service extension to download and handle the attachment content. For more information you can refer to [Apple documentations](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/ModifyingNotifications.html).

### Windows

- **audio**: Add this key when you want the to play a sound. this will modify the audio attribute for toast notifications.
- **image**: Add this key when you want to modify the image attribute for tile and toast notifications.