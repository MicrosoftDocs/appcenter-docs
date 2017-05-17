---
# required metadata

title: Mobile Center Push for Xamarin.Forms Apps
description: Integrating Mobile Center Push into Xamarin.Forms applications
keywords: sdk, push
author: achocron
ms.date: 05/11/2017
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

Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal.

## 1. Perform platform-specific setup

Even though we aim to make Mobile Center as cross-platform friendly as possible, push notifications work differently on UWP, iOS, and Android. As a result, before the shared APIs can be leveraged in Xamarin.Forms, some setup is required for each platform. Follow the instructions for integrating push with each of the platform-specific setup guides for Push, and then return here.

### Setup Guides
* [Xamarin.Android](xamarin-android.md)
* [Xamarin.iOS](xamarin-ios.md)
* [UWP](uwp.md)

>[!IMPORTANT]
>Even if you only access the `MobileCenter` or `Push` class from your shared or PCL project, the Mobile Center NuGet packages must be added to each platform-specific project.

## 2. Add Mobile Center Push to your app

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up and started the SDK in your application yet.

### 2.1. Add the Mobile Center Push module

[!include[](add-nuget.md)]

### 2.2. Start Mobile Center Push

[!include[](start-push.md)]

## 3. Enable or disable Push at runtime

[!include[](enable-or-disable.md)]

## 4. Intercept push notifications

Mobile Center Push makes it possible to intercept push notifications but there is some additional setup required to enable this feature in iOS and UWP projects.
It can be used directly in Android without any additional setup.

# 4.1. iOS additional steps

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

# 4.2 UWP additional steps

To enable the push event feature, modify your UWP application's `OnLaunched` method as follows to include `Push.CheckLaunchedFromNotification(e);` at the end:

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

# 4.3. Subscribe to the push event

[!include[](push-callbacks.md)]
