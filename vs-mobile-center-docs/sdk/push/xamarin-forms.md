---
# required metadata

title: App Center Push for Xamarin.Forms Apps
description: Integrating App Center Push into Xamarin.Forms applications
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 10/31/2017
ms.topic: article
ms.assetid: e3384f0b-fafd-4345-b9bb-4e683391bf74
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin.forms
---

# App Center Push

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin.Android](xamarin-android.md)
> * [Xamarin.iOS](xamarin-ios.md)
> * [Xamarin.Forms](xamarin-forms.md)
> * [React Native Android](react-native-android.md)
> * [React Native iOS](react-native-ios.md)

App Center Push enables you to send push notifications to users of your app from the App Center portal.

## Prerequisite - Perform platform-specific setup

Push notifications work differently on UWP, iOS, and Android, therefore, before the shared APIs can be leveraged in Xamarin.Forms, you need to perform some setup on each platform. Follow the instructions for integrating push with each of the platform-specific setup guides for Push, and then return here.

### Setup Guides
* [Xamarin.Android](xamarin-android.md)
* [Xamarin.iOS](xamarin-ios.md)
* [UWP](uwp.md)

>[!IMPORTANT]
>Even if you only access the `MobileCenter` or `Push` class from your shared or PCL project, the App Center NuGet packages must be added to each platform-specific project.

## Add App Center Push to your app

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up and started the SDK in your application yet.

### 1. Add the App Center Push module

[!include[](add-nuget.md)]

You may have the following known issues while building on Android:

[!include[](../xamarin-android-push-setup-issues.md)]

### 2. Start App Center Push

[!include[](start-push.md)]

## Intercept push notifications

App Center Push makes it possible to intercept push notifications but there is some additional setup required to enable this feature in plaform specific projects.

### iOS additional steps

>[!NOTE]
>You only need this step if you disabled method swizzling while setting up [Xamarin.iOS](xamarin-ios.md).

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

If (**and only if**) your launcher activity uses a `launchMode` of `singleTop`, `singleInstance` or `singleTask`, you need add this in the activity `OnNewIntent` method:

```csharp
        protected override void OnNewIntent(Android.Content.Intent intent)
        {
            base.OnNewIntent(intent);
            Push.CheckLaunchedFromNotification(this, intent);
        }
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
            // This is what triggers Xamarin.Forms portable App.OnStart method where you typically call MobileCenter.Start
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
and **message** in the event arguments, only iOS expose those fields for all events.

> [!NOTE]
> On iOS only, if silent notifications are enabled **and** you push a notification with `content-available: 1`, then the event may be triggered twice for the same notification: when the notification is received in background and when it is tapped.

[!include[](dotnet-push-event-example.md)]

## Enable or disable Push at runtime

[!include[](enable-or-disable.md)]
