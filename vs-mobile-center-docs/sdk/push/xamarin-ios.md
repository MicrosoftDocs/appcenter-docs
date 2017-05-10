# Mobile Center Push

Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal.

## 1. Enable Apple Push Notifications service (APNS) for your app

For Mobile Center Push to work for an iOS application, you must set up your application to register with Apple's push notification service (APNS). Instructions on how to do this can be found in [Xamarin's documentation](https://developer.xamarin.com/guides/ios/application_fundamentals/notifications/remote_notifications_in_ios/).


## 2. Add Mobile Center Push to your app

Please follow the [Get started](~/sdk/getting-started/uwp.md) section if you haven't set up and started the SDK in your application.

### 2.1. Add the Mobile Center Push package

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in. It can be integrated using Visual Studio or Package Manager Console.

[!include[](subsections/add-nuget.md)]

Now that you've integrated Mobile Center Push in your application, it's time to start the SDK and make use of Mobile Center.

### 2.2. Start Mobile Center Push service

[!include[](subsections/start-push.md)]

## 3. Implement callbacks to register for Push notifications

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

## 4. Implement callbacks to enable push notification received event

Mobile Center Push provides APIs to handle push notifications received in the foreground. Implement the method `DidReceiveRemoteNotification` in your `AppDelegate` class as follows:

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

## 5. Enable or disable Push at runtime

[!include[](subsections/enable-or-disable.md)]

## 6. Intercept push notifications in the foreground

[!include[](subsections/push-callbacks.md)]
