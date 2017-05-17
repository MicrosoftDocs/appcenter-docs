---
title: Mobile Center Push for iOS
description: Using Push in Mobile Center
keywords: sdk, push
author: jaelim
ms.author: jaelim
ms.date: 05/01/2017
ms.topic: article
ms.assetid: 5617b13b-940e-47e3-a67e-2aca255ab4e7
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
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

## 1. Enable Apple Push Notifications service (APNs) for your app

Please configure Apple Push Notifications service (APNs) for your app from your Apple developer account before adding Mobile Center Push to your app. Mobile Center Push won't get any notifications if you don't enable push notifications. Follow the instructions in Apple's documentation on [how to configure push notifications](http://help.apple.com/xcode/mac/current/#/dev11b059073).

## 2. Add Mobile Center Push to your app

Please follow the [Getting Started](~/sdk/getting-started/ios.md) section if you haven't configured the SDK in your application.

### 2.1 Add the Mobile Center Push module

The Mobile Center SDK is designed with a modular approach – you only need to integrate the services that you're interested in.

#### 2.1.1 Integration via Cocoapods

If you are integrating Mobile Center into your app via Cocoapods, add the following dependency to your podfile and run `pod install`.

```ruby
pod 'MobileCenter/MobileCenterPush'
```

#### 2.1.2 Integration by copying the binaries into your project

1. Download the [Mobile Center iOS SDK](https://github.com/Microsoft/MobileCenter-SDK-iOS/releases) frameworks provided as a zip file.

2. Unzip the file and you will see a folder called `MobileCenter-SDK-iOS` that contains different frameworks for each Mobile Center service. The framework called `MobileCenter` is required in the project as it contains code that is shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party-libraries.
    * As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
    * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

4. Open Finder and copy the unzipped `MobileCenter-SDK-iOS` folder into your project's folder at the location where you want it to reside.

5. Add the SDK framework to the project in Xcode:
    * Make sure the Project Navigator is visible (⌘+1).
    * Now drag and drop `MobileCenter.framework` and `MobileCenterPush.framework` from the Finder (the ones inside the **Vendor** folder) into Xcode's Project Navigator. Note that `MobileCenter.framework` is required to start the SDK, make sure it is added to your project, otherwise the other modules will not work and your project will not compile successfully.
    * A dialog will appear, make sure your app target is checked. Then click **Finish**.

### 2.2 Start Mobile Center Push

In order to use Mobile Center, you need to opt in to the service(s) that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

#### 2.2.1 Add the import for Mobile Center Push

**Objective-C**

Open your **AppDelegate.m** file and add the following import statements:

```obj-c
@import MobileCenter;
@import MobileCenterPush;
```

**Swift**

Open your **AppDelegate.swift** file and add the following import statements:

```swift
import MobileCenter
import MobileCenterPush
```

#### 2.2.2 Add the `start:withServices:` method

Add `MSPush` to your `start:withServices:` method to start Mobile Center Distribute together with the other services that you want to use in your app.

**Objective-C**

Insert the following line to start the SDK in your app's **AppDelegate.m** class in the `didFinishLaunchingWithOptions` method.

```obj-c
[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class], [MSDistribute class], [MSPush class]]];
```

**Swift**

Insert the following line to start the SDK in your app's **AppDelegate.swift** class in the `didFinishLaunchingWithOptions` method.

```swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self, MSDistribute.self, MSPush.self])
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Please also check out the [Get started](~/sdk/getting-started/ios.md) section if you haven't configured the SDK in your application.

#### 2.3 Implement callbacks to register for Push notifications

Implement the `application:didRegisterForRemoteNotificationsWithDeviceToken:` callback and the `application:didFailToRegisterForRemoteNotificationsWithError:` callback in your `AppDelegate` to register for Push notifications.

**Objective-C**

```obj-c
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

**Swift**

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

#### 2.4 Implement the callback to receive push notifications

Implement the `application:didReceiveRemoteNotification:fetchCompletionHandler` callback to add the logic for receiving a Push notification.

**Objective-C**

```obj-c
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

**Swift**

```swift
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
  let dictionary = ((userInfo["aps"] as? [AnyHashable: Any])?["alert"] as? [AnyHashable: Any])
  let alert = UIAlertView(title: dictionary?["title"] as? String, message: dictionary?["body"] as? String, delegate: self, cancelButtonTitle: "OK")
  alert.show()
}
```

## 3. Enable or disable Mobile Center Push at runtime

You can enable and disable Mobile Center Push at runtime.

If you disable it, the SDK will stop updating the device token used to push but the existing one will continue working.

In other words, disabling the Mobile Center Push in the SDK will **NOT** stop your application from receiving push notifications.

**Objective-C**

```objectivec
[MSPush setEnabled:NO];
```

**Swift**

```swift
MSPush.setEnabled(false)
```

To enable Mobile Center Push again, use the same API but pass `YES`/`true` as a parameter.

**Objective-C**

```objectivec
[MSPush setEnabled:YES];
```

**Swift**

```swift
MSPush.setEnabled(true)
```

## 4. Check if Mobile Center Push is enabled

You can also check if Mobile Center Push is enabled or not:

**Objective-C**

```objectivec
BOOL enabled = [MSPush isEnabled];
```

**Swift**

```swift
var enabled = MSPush.isEnabled()
```

