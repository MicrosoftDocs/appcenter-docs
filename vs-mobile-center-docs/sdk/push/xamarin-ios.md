---
# required metadata

title: Mobile Center Push for Xamarin.iOS Apps
description: Integrating Mobile Center Push into Xamarin.iOS applications
keywords: sdk, push
author: achocron
ms.date: 05/10/2017
ms.topic: article
ms.assetid: 1fe3506e-ba5c-406d-8ba2-b38a2d1ca588
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin.ios
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

## 1. Enable Apple Push Notifications service (APNS) for your app

For Mobile Center Push to work for an iOS application, you must set up your application to register with Apple's push notification service (APNS). Instructions on how to do this can be found in [Xamarin's documentation](https://developer.xamarin.com/guides/ios/application_fundamentals/notifications/remote_notifications_in_ios/).


## 2. Add Mobile Center Push to your app

Please follow the [Get started](~/sdk/getting-started/uwp.md) section if you haven't set up and started the SDK in your application.

### 2.1. Add the Mobile Center Push package

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in. It can be integrated using Visual Studio or Package Manager Console.

[!include[](add-nuget.md)]

Now that you've integrated Mobile Center Push in your application, it's time to start the SDK and make use of Mobile Center.

### 2.2. Start Mobile Center Push service

[!include[](start-push.md)]

>[!NOTE]
>If your Xamarin.iOS project is part of a [Xamarin.Forms](xamarin-forms.md) application, it is not necessary to add the call to `MobileCenter.Start()` in the Xamarin.iOS portion of the project. The method call can instead be made from the PCL or shared project portion of your Xamarin.Forms application.

## 3 Application delegate methods forwarding

### Automatic (swizzling)

Mobile Center automatically forwards your application delegate's methods to Mobile Center services. This is made possible by using method swizzling. It greatly improves the SDK integration but there is a possibility of conflicts with other third party libraries or the application delegate itself. For instance, it should be disabled if you or one of your third party libraries is doing message forwarding on the application delegate. Message forwarding usually implies the implementation of `NSObject#forwardingTargetForSelector:` or `NSObject#forwardInvocation:` methods. In this case you may want to disable the Mobile Center application delegate forwarder by adding the `MobileCenterAppDelegateForwarderEnabled` key to your Info.plist file and set the value to `0`, doing so will disable application delegate forwarding for all Mobile Center services.
 
> [!NOTE]
> Note that all delegate methods captured by the Mobile Center application delegate forwarder are forwarded to both Mobile Center services and your application delegate. except the `application:didReceiveRemoteNotification:fetchCompletionHandler` method. If you or one of your third party libraries already implements this method then it will not be swizzled by the forwarder and you will have to do the forwarding to the Push service yourself by following [these steps](#implement-the-callback-to-receive-push-notifications).
 
### Manual

Implement the methods `RegisteredForRemoteNotifications` and `FailedToRegisterForRemoteNotifications` in your `AppDelegate` class as follows:

```csharp
public override void RegisteredForRemoteNotifications(UIApplication application, NSData deviceToken)
{
	Push.RegisteredForRemoteNotifications(deviceToken);
}
```

```csharp
public override void FailedToRegisterForRemoteNotifications(UIApplication application, NSError error)
{
	Push.FailedToRegisterForRemoteNotifications(error);
}
```

>[!NOTE]
>You may have already imlemented these methods while following Xamarin's documentation on enabling APNS. It is okay to replace the implementation from their example with the code provided above. You may also add the Mobile Center lines of code above alongside existing code in your implementation of these methods.

## 4. Enable or disable Push at runtime

[!include[](enable-or-disable.md)]

## 5. Intercept push notifications

### 5.1. Implement callbacks to enable push event if you disabled swizzling

>[!NOTE]
>You only need this step if you disabled method swizzling in step 3.

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

Now, the `Push.PushNotificationReceived` event will be invoked when your application receives a push notification. This event is also accessible from the PCL part of a Xamarin.Forms project.

### 5.2. Subscribe to the push event

[!include[](push-callbacks.md)]
