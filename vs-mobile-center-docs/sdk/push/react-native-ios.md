---
title: Mobile Center Push for React Native iOS
description: Using Push in Mobile Center
keywords: sdk, push
author: bretjohn
ms.author: bretjohn
ms.date: 06/12/2017
ms.topic: article
ms.assetid: 74B832B4-C9C6-40C5-A693-473F385DC817
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: react-native
dev_langs:
 - objc
 - javascript
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

## Prerequisite - Enable Apple Push Notifications service (APNs) for your app

Configure Apple Push Notifications service (APNs) for your app from your Apple developer account and Mobile Center portal before adding Mobile Center Push to your app.

### Enable push notifications on your application

 In Xcode's project editor, choose your target and click **Capabilities**. In the **Push Notifications** section, click the switch to turn it from OFF to ON.

![enable-push-capability](images/ios-enable-push-capability.png)

[!include[](apns-setup.md)]

For more information, refer to the [Apple documentation](http://help.apple.com/xcode/mac/current/#/dev11b059073).

## Add Mobile Center Push to your app

### 1. Add the Mobile Center Push module

Please follow the [Get started](~/sdk/getting-started/react-native.md) section if you haven't set up and started the SDK in your application, yet.
The Mobile Center SDK is designed with a modular approach – you only need to integrate the services that you're interested in.

#### Integrate the SDK automatically

The default integration of the SDK uses Cocoapods for iOS.

1. Open a Terminal and navigate to the root of your React Native project, then enter the following to add Mobile Center Push to the app:

  ```
  npm install mobile-center-push --save
  ```

2. Link the plugin to the React Native app by using the `react-native link command`.

  ```
  react-native link mobile-center-push
  ```

3. You will be prompted for the App Secret, which will enable Mobile Center to map this app to the right user account. The secret may already be pre-populated, showing up beside the question. If the pre-filled secret is correct, press enter to continue. Otherwise, provide your app secret here.

  ```
  What is the Android app secret? (0000-0000-0000-0000-000000000000)
  What is the iOS app secret? (0000-0000-0000-0000-000000000000)
  ```

#### Integrate the iOS SDK manually

If you wish to manually integrate the module, follow the manual integration steps at [documentation link](~/sdk/getting-started/react-native.md#3.2-ios-only-integrate-the-ios-sdk-manually)

### 2.Start Mobile Center Push

#### 2.1 Register for notifications

Mobile Center Push is started by this call:

  ```objc
  #import <RNPush/RNPush.h>

  ...

  [RNPush registerAndEnable];
  ```

That call is added automatically to **AppDelegate.m** by the automatic instructions above. Otherwise, you need to add it manually.

Note that when the app calls `registerAndEnable` for the first time after being installed, iOS will prompt the user for permission to receive push notifications. If you wish to delay when that permission prompt appears to the user, say until after an app first time use wizard finishes, delay making the `registerAndEnable` call.

#### 2.2 [Optional] Receive push notifications if you have already implemented `application:didReceiveRemoteNotification:fetchCompletionHandler` method

If you or one of your third party libraries already implements `application:didReceiveRemoteNotification:fetchCompletionHandler` method, then follow [step 4](#disable-automatic-forwarding-of-application-delegates-methods-to-mobile-center-services) to implement a callback to receive push notifications.

## Enable or disable Mobile Center Push at runtime

You can enable and disable Mobile Center Push at runtime. If you disable it, the SDK will stop updating the device token used to push but the existing one will continue working. In other words, disabling the Mobile Center Push in the SDK will **NOT** stop your application from receiving push notifications.

  ```javascript
  import Push from 'mobile-center-push';

  ...

  await Push.setEnabled(false);      // Disable push
  await Push.setEnabled(true);       // Reenable it
  ```

## Check if Mobile Center Push is enabled

You can also check if Mobile Center Push is enabled or not:

  ```javascript
  import Push from 'mobile-center-push';

  ...

  const pushEnabled = await Push.isEnabled();
  ```

## Disable automatic forwarding of application delegate's methods to Mobile Center services

Mobile Center uses swizzling to automatically forward your application delegate's methods to Mobile Center services to improve SDK integration. There is a possibility of conflicts with other third party libraries or the application delegate itself. In this case, you might want to disable the Mobile Center application delegate forwarding for all Mobile Center services by following the steps below:

1. Open your **Info.plist file**.
2. Add `MobileCenterAppDelegateForwarderEnabled` key and set the value to `0`. This will disable application delegate forwarding for all Mobile Center services.
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

4. Implement the callback to receive push notifications

    Implement the `application:didReceiveRemoteNotification:fetchCompletionHandler` callback to add the logic for receiving a Push notification.

    ```objc
    - (void)application:(UIApplication *)application
       didReceiveRemoteNotification:(NSDictionary *)userInfo
             fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
      NSDictionary *dictionary = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[dictionary valueForKey:@"title"]
                                                      message:[dictionary valueForKey:@"body"]
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
      [alert show];
    }
    ```
