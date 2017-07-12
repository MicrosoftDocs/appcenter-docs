---
# required metadata

title: Mobile Center Push for Xamarin.Forms Apps
description: Integrating Mobile Center Push into Xamarin.Forms applications
keywords: sdk, push
author: achocron
ms.date: 07/11/2017
ms.topic: article
ms.assetid: e3384f0b-fafd-4345-b9bb-4e683391bf74
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin.forms
---

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

Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal.

## Prerequisite - Perform platform-specific setup

Push notifications work differently on UWP, iOS, and Android, therefore, before the shared APIs can be leveraged in Xamarin.Forms, you need to perform some setup on each platform. Follow the instructions for integrating push with each of the platform-specific setup guides for Push, and then return here.

### Setup Guides
* [Xamarin.Android](xamarin-android.md)
* [Xamarin.iOS](xamarin-ios.md)
* [UWP](uwp.md)

>[!IMPORTANT]
>Even if you only access the `MobileCenter` or `Push` class from your shared or PCL project, the Mobile Center NuGet packages must be added to each platform-specific project.

## Add Mobile Center Push to your app

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up and started the SDK in your application yet.

### 1. Add the Mobile Center Push module

[!include[](add-nuget.md)]

You may have the following known issues while building on Android:

[!include[](../xamarin-android-push-setup-issues.md)]

### 2. Start Mobile Center Push

[!include[](start-push.md)]

## Intercept push notifications

Mobile Center Push makes it possible to intercept push notifications but there is some additional setup required to enable this feature in iOS and UWP projects.

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

If your launcher activity uses a `launchMode` of `singleTop`, `singleInstance` or `singleTask`, you need add this in the activity `OnNewIntent` method:

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

[!include[](push-callbacks.md)]

## Enable or disable Push at runtime

[!include[](enable-or-disable.md)]

