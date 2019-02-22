---
title: App Center Push for iOS
description: Using Push in App Center
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 02/14/2019
ms.topic: article
ms.assetid: 5617b13b-940e-47e3-a67e-2aca255ab4e7
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:
 - swift
 - objc
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
> * [Unity Android](unity-android.md)
> * [Unity iOS](unity-ios.md)
> * [Unity Windows](unity-windows.md)

> [!NOTE]
> Starting with version 1.11.0, calling `push:didReceivePushNotification:` within a `UNUserNotificationCenterDelegate` is no longer necessary. If you implemented a `UNUserNotificationCenterDelegate` and are calling the `push:didReceivePushNotification:` callback, please refer to [the App Center SDK migration guide](migration/ios.md) to migrate your code.

App Center Push enables you to send push notifications to users of your app from the App Center portal.

## Prerequisite - Enable Apple Push Notifications service (APNs) for your app

Configure Apple Push Notifications service (APNs) for your app from your Apple developer account and App Center portal before adding App Center Push to your app.

### Enable push notifications on your application

 In Xcode's project editor, choose your target and click **Capabilities**. In the **Push Notifications** section, click the switch to turn it from OFF to ON.

![enable-push-capability](images/apple-enable-push-capability.png)

[!include[](ios-apns-setup.md)]

For more information, refer to the [Apple documentation](http://help.apple.com/xcode/mac/current/#/dev11b059073).

#### [Optional] Enable silent notifications

[!include[](ios-enable-silent-notifications.md)]

[!include[](introduction-apple.md)]

#### 2.2 Add the `start:withServices:` method

Add `MSPush` to your `start:withServices:` method to start App Center Push together with the other services that you want to use in your app.

Insert the following line to start the SDK in your app's **AppDelegate.m** class in Objective-C or  **AppDelegate.swift** class in Swift in the `didFinishLaunchingWithOptions` method.

```objc
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSPush class]]];
```
```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSPush.self])
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Please also check out the [Get started](~/sdk/getting-started/ios.md) section if you haven't configured the SDK in your application.

> [!NOTE]
> The first time App Center Push starts, the system may prompt the user to grant the application permission to send notifications. To delay this prompt, start App Center Push later by omitting the `MSPush` class from the `start:withServices:` method. When you're ready to prompt the user, call the `startService:` method and pass the `MSPush` class. For all subsequent app launches, start `MSPush` as early as possible to ensure that all push notifications are captured.

## Intercept push notifications

You can set up a delegate to be notified whenever a push notification is received in foreground or a background push notification has been tapped by the user. The delegate may also be woken up when a notification is received in background if you have enabled [silent notifications](#optional-enable-silent-notifications) and if the payload of the notification contains the [content-available](#custom-data-in-your-notifications) flag set to true.

> [!NOTE]
> If silent notifications are enabled and you push a notification with `content-available: 1`, then the delegate may be triggered twice for the same notification: when the notification is received in background and when it is tapped.

By default, iOS does not generate notifications when the push is received in foreground, you can use the delegate to customize the push experience when received in foreground or do a specific action when the application is launched by clicking on the push notification when received in background.

You need to register the delegate before starting App Center as shown in the following example:

```objc
[MSPush setDelegate:self];
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSPush class]]];
```
```swift
MSPush.setDelegate(self)
MSAppCenter.start("{Your App Secret}", withServices: [MSPush.self])
```

Here is an example of the delegate implementation that displays an alert dialog when the message is received by App Center Push:

```objc
- (void)push:(MSPush *)push didReceivePushNotification:(MSPushNotification *)pushNotification {
  NSString *title = pushNotification.title ?: @"";
  NSString *message = pushNotification.message;
  NSMutableString *customData = nil;
  for (NSString *key in pushNotification.customData) {
    ([customData length] == 0) ? customData = [NSMutableString new] : [customData appendString:@", "];
    [customData appendFormat:@"%@: %@", key, [pushNotification.customData objectForKey:key]];
  }
  if (UIApplication.sharedApplication.applicationState == UIApplicationStateBackground) {
    NSLog(@"Notification received in background, title: \"%@\", message: \"%@\", custom data: \"%@\"", title, message,
          customData);
  } else {
    message = [NSString stringWithFormat:@"%@%@%@", (message ? message : @""), (message && customData ? @"\n" : @""),
                                         (customData ? customData : @"")];

    UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];

    // Show the alert controller.
    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
  }
}
```

```swift
func push(_ push: MSPush!, didReceive pushNotification: MSPushNotification!) {
  let title: String = pushNotification.title ?? ""
  var message: String = pushNotification.message ?? ""
  var customData: String = ""
  for item in pushNotification.customData {
    customData =  ((customData.isEmpty) ? "" : "\(customData), ") + "\(item.key): \(item.value)"
  }
  if (UIApplication.shared.applicationState == .background) {
    NSLog("Notification received in background, title: \"\(title)\", message: \"\(message)\", custom data: \"\(customData)\"");
  } else {
    message =  message + ((customData.isEmpty) ? "" : "\n\(customData)")

    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .cancel))

    // Show the alert controller.
    self.window?.rootViewController?.present(alertController, animated: true)
  }
}
```

## Custom data in your notifications

[!include[](custom-data-ios.md)]

## Enable or disable App Center Push at runtime

You can enable and disable App Center Push at runtime. If you disable it, the SDK will stop updating the device token used to push but the existing one will continue working. In other words, disabling the App Center Push in the SDK will **NOT** stop your application from receiving push notifications.

```objc
[MSPush setEnabled:NO];
```
```swift
MSPush.setEnabled(false)
```

To enable App Center Push again, use the same API but pass `YES`/`true` as a parameter.

```objc
[MSPush setEnabled:YES];
```
```swift
MSPush.setEnabled(true)
```

The state is persisted in the device's storage across application launches.

## Check if App Center Push is enabled

You can also check if App Center Push is enabled or not:

```objc
BOOL enabled = [MSPush isEnabled];
```
```swift
var enabled = MSPush.isEnabled()
```

## Disable automatic method forwarding to App Center services

App Center uses swizzling to automatically forward your application delegate's methods to App Center services to improve SDK integration. Method swizzling is a way to change implementation of methods at runtime. There is a possibility of conflicts with other third party libraries or the application delegate itself. You may want to disable the App Center application delegate forwarding for all App Center services by following the steps below:

### Application Delegate

1. Open your project's `Info.plist` file.
2. Add the `AppCenterAppDelegateForwarderEnabled` key, and set the value to `0`. This disables application delegate forwarding for all App Center services.
3. Implement the callbacks to register push notifications

    Implement the `application:didRegisterForRemoteNotificationsWithDeviceToken:` callback and the `application:didFailToRegisterForRemoteNotificationsWithError:` callback in your `AppDelegate` to register for Push notifications.

    ```objc
    - (void)application:(UIApplication *)application
        didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

      // Pass the device token to MSPush.
      [MSPush didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    }

    - (void)application:(UIApplication *)application
        didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error {

      // Pass the error to MSPush.
      [MSPush didFailToRegisterForRemoteNotificationsWithError:error];
    }
    ```
    ```swift
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

      // Pass the device token to MSPush.
      MSPush.didRegisterForRemoteNotifications(withDeviceToken: deviceToken)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

      // Pass the error to MSPush.
      MSPush.didFailToRegisterForRemoteNotificationsWithError(error)
    }
    ```

4. Implement the callback to receive push notifications

    Implement the `application:didReceiveRemoteNotification:fetchCompletionHandler` callback to forward push notifications to App Center Push.

    ```objc
    - (void)application:(UIApplication *)application
        didReceiveRemoteNotification:(NSDictionary *)userInfo
              fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
      BOOL result = [MSPush didReceiveRemoteNotification:userInfo];
      if (result) {
        completionHandler(UIBackgroundFetchResultNewData);
      } else {
        completionHandler(UIBackgroundFetchResultNoData);
      }
    }
    ```
    ```swift
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      let result: Bool = MSPush.didReceiveRemoteNotification(userInfo)
      if result {
        completionHandler(.newData)
      }
      else {
        completionHandler(.noData)
      }
    }
    ```

### User Notification Center Delegate

1. Open your project's `Info.plist` file.
2. Add the `AppCenterUserNotificationCenterDelegateForwarderEnabled` key, and set the value to `0`. This disables `UNUserNotificationCenter` delegate forwarding for App Center Push.
3. Implement `UNUserNotificationCenterDelegate` callbacks and pass the notification's payload to App Center Push.

    ```objc
    - (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options)) completionHandler API_AVAILABLE(ios(10.0)) {

      //...

      // Pass the notification payload to MSPush.
      [MSPush didReceiveRemoteNotification:notification.request.content.userInfo];

      // Complete handling the notification.
      completionHandler(UNNotificationPresentationOptionNone);
    }

    - (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler API_AVAILABLE(ios(10.0)) {

      //...

      // Pass the notification payload to MSPush.
      [MSPush didReceiveRemoteNotification:response.notification.request.content.userInfo];

      // Complete handling the notification.
      completionHandler();
    }
    ```

    ```swift
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

      //...

      // Pass the notification payload to MSPush.
      MSPush.didReceiveRemoteNotification(notification.request.content.userInfo)

      // Complete handling the notification.
      completionHandler([])
    }

    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {

      //...

      // Pass the notification payload to MSPush.
      MSPush.didReceiveRemoteNotification(response.notification.request.content.userInfo)

      // Complete handling the notification.
      completionHandler()
    }
    ```

## Common tasks for push notifications

### Handle a push notification while the app is in foreground

App Center Push allows apps to intercept push notifications and react to them, e.g. to display an alert, as described in the App Center Push documentation above. In some cases, it is helpful to distinguish between push notifications received while the app is in the foreground or background, and handle them differently. The App Center SDK-provided callback is not enough in this case since the application's state will always be reported as `active`.

To distinguish between notifications received in the foreground and notifications received while the app was in the background, you must implement one of the callbacks defined in `UNUserNotificationDelegate`. Please see [Apple's documentation](https://developer.apple.com/documentation/usernotifications/unusernotificationcenterdelegate) for more details.

> [!NOTE]
> The solution below requires iOS 10 or later.

1. In your `AppDelegate` and add import in the top of file:

    ```objc
    #import <UserNotifications/UserNotifications.h>
    ```

    ```swift
    import UserNotifications
    ```

2. Add the following to the `didFinishLaunching:withOptions:` to register as a `UNUserNotificationCenterDelegate`:

    ```objc
    if (@available(iOS 10.0, *)) {
      UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
      center.delegate = self;
    }
    ```

    ```swift
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
    }
    ```

3. Implement the following callback to detect a foreground notification:

    ```objc
    // iOS 10 and later, called when a notification is delivered to an app that is in the foreground.
    - (void)userNotificationCenter:(UNUserNotificationCenter *)center
          willPresentNotification:(UNNotification *)notification
            withCompletionHandler:(void (^)(UNNotificationPresentationOptions options)) completionHandler API_AVAILABLE(ios(10.0)) {

        // Do something, e.g. set a BOOL @property to track the foreground state.
        self.didReceiveNotificationInForeground = YES;

        // Complete handling the notification.
        completionHandler(UNNotificationPresentationOptionNone);
    }
    ```

    ```swift
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

        // Do something, e.g. set a Bool property to track the foreground state.
        self.didReceiveNotificationInForeground = true

        // Complete handling the notification.
        completionHandler([])
    }
    ```

4. (Optional) If you have implemented the App Center Push SDK `push:didReceivePushNotification:` callback, you should adjust its behavior to a handle the foreground detection:

    ```objc
    - (void)push:(MSPush *)push didReceivePushNotification:(MSPushNotification *)pushNotification {

        // Do something differently if the push notification was received while in foreground.
        if (self.didReceiveNotificationInForeground) {

            // Handle the push notification that was received while in foreground.
        } else {

            // Handle the push notification that was received while app was in background.
        }

        // Reset the property for next notifications.
        self.didReceiveNotificationInForeground = NO;
    }
    ```

    ```swift
    @available(iOS 10.0, *)
    func push(_ push: MSPush!, didReceive pushNotification: MSPushNotification!) {

        // Do something differently if the push notification was received while in foreground.
        if (self.didReceiveNotificationInForeground) {

            // Handle the push notification that was received while in foreground
        } else {

            // Handle the push notification that was received while app was in background.
        }

        // Reset the property for next notifications.
        self.didReceiveNotificationInForeground = false
    }
    ```

### Detecting when a user has tapped on a push notification

Sometimes it is helpful to determine if user has tapped push notification. To perform this task you must implement one of the callbacks defined in `UNUserNotificationDelegate`. Please see [Apple's documentation](https://developer.apple.com/documentation/usernotifications/unusernotificationcenterdelegate) for more details.

> [!NOTE]
> The solution below requires iOS 10 or later.

1. In your `AppDelegate` and add import in the top of file:

    ```objc
    #import <UserNotifications/UserNotifications.h>
    ```

    ```swift
    import UserNotifications
    ```

2. Add the following to the `didFinishLaunching:withOptions:` to register as a `UNUserNotificationCenterDelegate`:

    ```objc
    if (@available(iOS 10.0, *)) {
      UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
      center.delegate = self;
    }
    ```

    ```swift
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
    }
    ```

3. Implement the following callback to detect various actions performed by users with push notifications:

    ```objc
    // iOS 10 and later, asks the delegate to process the user's response to a delivered notification.
    - (void)userNotificationCenter:(UNUserNotificationCenter *)center
        didReceiveNotificationResponse:(UNNotificationResponse *)response
                withCompletionHandler:(void (^)(void))completionHandler API_AVAILABLE(ios(10.0)) {

      // Perform the task associated with the action.
      if ([[response actionIdentifier] isEqualToString:UNNotificationDefaultActionIdentifier]) {

        // User tapped on notification
      }

      // Complete handling the notification.
      completionHandler();
    }
    ```

    ```swift
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center:UNUserNotificationCenter,didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {

      // Perform the task associated with the action.
      if (response.actionIdentifier == UNNotificationDefaultActionIdentifier) {

        // User tapped on notification.
      }

      // Complete handling the notification.
      completionHandler()
    }
    ```
