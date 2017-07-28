---
title: Mobile Center Distribute for iOS
description: Using in-app updates in Mobile Center Distribute
keywords: sdk, distribute
author: troublemakerben
ms.author: bereimol
ms.date: 07/27/2017
ms.topic: article
ms.assetid: f91fcd0b-d5e6-4c74-89a8-f71c2ee57556
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:
 - swift
 - objc 
---

# Mobile Center Distribute – In-app updates

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

Mobile Center Distribute will let your users install a new version of the app when you distribute it via Mobile Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the new version. Once they choose to update, the SDK will start to update your application. 

This feature will NOT work if your app is deployed to the app store.

## Add in-app updates to your app

Please follow the [Get started](~/sdk/getting-started/ios.md) section if you haven't configured the SDK in your application.

### 1. Add the Mobile Center Distribute module

The Mobile Center SDK is designed with a modular approach – you only need to integrate the modules of the services that you're interested in.

#### Integration via Cocoapods

If you are integrating Mobile Center into your app via Cocoapods, add the following dependency to your podfile and run `pod install`.

```ruby
pod 'MobileCenter/Distribute'
```

#### Integration by copying the binaries into your project

If you wish to manually integrate the module, follow this [documentation link](~/sdk/distribute/ios-manual-integration.md).

### 2. Start Mobile Center Distribute

In order to use Mobile Center, you need to opt in to the service(s) that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

#### 2.1 Add the import for Mobile Center Distribute

Open your **AppDelegate.m** file in Objective-C or **AppDelegate.swift** file in Swift and add the following import statements:

```objc
@import MobileCenter;
@import MobileCenterDistribute;
```
```swift
import MobileCenter
import MobileCenterDistribute
```

#### 2.2 Add the `start:withServices:` method

Add `MSDistribute` to your `start:withServices:` method to start Mobile Center Distribute service.

Insert the following line to start the SDK in your app's **AppDelegate.m** class for Objective-C or **AppDelegate.swift** class for Swift in the `didFinishLaunchingWithOptions` method.

```objc
[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSDistribute class]]];
```
```swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSDistribute.self])
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Please also check out the [Get started](~/sdk/getting-started/ios.md) section if you haven't configured the SDK in your application.

#### 2.3 Modify your **Info.plist**

1. Add a new key for `URL types` or `CFBundleURLTypes` in your **Info.plist** file (in case Xcode displays your Info.plist as source code).
2. Change the key of the first child item to `URL Schemes` or `CFBundleURLSchemes`.
3. Enter `mobilecenter-${APP_SECRET}` as the URL scheme and replace `${APP_SECRET}` with the App Secret of your app.

> [!TIP]
> If you want to verify that you modified the Info.plist correctly, open it as source code. It should contain the following entry with your App Secret instead of `${APP_SECRET}`:
> ```
> <key>CFBundleURLTypes</key>
>	<array>
>		<dict>
>			<key>CFBundleURLSchemes</key>
>			<array>
>				<string>mobilecenter-${APP_SECRET}</string>
>			</array>
>		</dict>
>	</array>
>	```

## Customize or localize the in-app update dialog

### 1. Customize or localize text

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at [this strings file](https://github.com/Microsoft/mobile-center-sdk-ios/blob/develop/MobileCenterDistribute/MobileCenterDistribute/Resources/en.lproj/MobileCenterDistribute.strings). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app strings files.

### 2. Customize the update dialog

You can customize the default update dialog's appearance by implementing the `MSDistributeDelegate` protocol. You need to register the delegate before starting the SDK as shown in the following example:

```objc
[MSDistribute setDelegate:self];
```
```swift
MSDistribute.setDelegate(self);
```

Here is an example of the delegate implementation that replaces the SDK dialog with a custom one:

```objc
- (BOOL)distribute:(MSDistribute *)distribute releaseAvailableWithDetails:(MSReleaseDetails *)details {

  // Your code to present your UI to the user, e.g. an UIAlertView.
  [[[UIAlertView alloc] initWithTitle:@"Update availble."
                              message:@"Do you want to update?"
                             delegate:self
                    cancelButtonTitle:@"Postpone"
                    otherButtonTitles:@"Update", nil] show];
  return YES;
}
```
```swift
func distribute(_ distribute: MSDistribute!, releaseAvailableWith details: MSReleaseDetails!) -> Bool {

  // Your code to present your UI to the user, e.g. an UIAlertView.
  UIAlertView.init(title: "Update available", message: "Do you want to update?", delegate: self, cancelButtonTitle: "Postpone", otherButtonTitles: "Update").show()
  return true;
}
```

In case you return `YES`/`true` in the above method, your app should obtain user's choice and message the SDK with the result using the following API.

```objc
// Depending on the user's choice, call notifyUpdateAction: with the right value.
[MSDistribute notifyUpdateAction:MSUpdateActionUpdate];
[MSDistribute notifyUpdateAction:MSUpdateActionPostpone];
```
```swift
// Depending on the user's choice, call notify() with the right value.
MSDistribute.notify(MSUpdateAction.update);
MSDistribute.notify(MSUpdateAction.postpone);
```

If you don't call the above method, the `releaseAvailableWithDetails:`-method will repeat whenever your app is entering to the foreground.

## Enable or disable Mobile Center Distribute at runtime

You can enable and disable Mobile Center Distribute at runtime. If you disable it, the SDK will not provide any in-app update functionality but you can still use Distribute service in Mobile Center portal.

```objc
[MSDistribute setEnabled:NO];
```
```swift
MSDistribute.setEnabled(false)
```

To enable Mobile Center Distribute again, use the same API but pass `YES`/`true` as a parameter.

```objc
[MSDistribute setEnabled:YES];
```
```swift
MSDistribute.setEnabled(true)
```

## Check if Mobile Center Distribute is enabled

You can also check if Mobile Center Distribute is enabled or not:

```objc
BOOL enabled = [MSDistribute isEnabled];
```
```swift
var enabled = MSDistribute.isEnabled()
```

## Don't initialize Mobile Center Distribute during development

Mobile Center Distribute will pop up it's UI/browser at application start. While this is an expected behavior for your end users, it could be disruptive for you during the development stage of your application. We do not recommend to initialize `MSDistribute` for your `DEBUG` configuration.

 ```objc
 #if DEBUG
 	[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
 #else
 	[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class], [MSDistribute class]]];
 #endif
 ```
 ```swift
 #if DEBUG
 	MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
 #else
 	MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self, MSDistribute.self])
 #endif
 ```

## How do in-app updates work?

The in-app updates feature works as follows:

1. This feature will ONLY work with builds that are distributed using **Mobile Center Distribute** service. It won't work when the debugger is attached.
2. Once you integrate the SDK, build a release version of your app and upload it to Mobile Center, users in that distribution group will be notified for the new release via an email.
3. When each user opens the link in their email, the application will be installed on their device. It's important that they use the email link to install the app - Mobile Center Distribute does not support in-app-updates for apps that have been installed from other sources (e.g. downloading the app from an email attachment).
4. Once the app is installed and opened for the first time after the Mobile Center Distribute SDK has been added, a browser will open to enable in-app updates. This is a _one time_ step that will not occur for subsequent releases of your app.
5. Once the above step is successful, they should be navigated back to the app.
6. A new release of the app shows the in-app update dialog asking users to update your application if it has

    * a higher value of `CFBundleShortVersionString` or
    * an equal value of `CFBundleShortVersionString` but a higher value of `CFBundleVersion`.

> [!TIP]
> If you upload the same apk/ipa a second time, the dialog will **NOT** appear as the binaries are identical. If you upload a **new** build with the same version properties, it will show the update dialog. The reason for this is that it is a **different** binary.

## How do I test in-app updates?

You need to upload release builds (that use the Distribute module of the Mobile Center SDK) to the Mobile Center Portal to test in-app updates, increasing version numbers every time.

1. Create your app in the Mobile Center Portal if you have not done that already.
2. Create a new distribution group and name it so you can recognize that this is just meant for testing the in-app update feature.
3. Add yourself (or all people who you want to include on your test of the in-app update feature). Use a new or throw-away email address for this, that was not used for that app on Mobile Center. This ensures that you have an experience that's close to the experience of your real testers.
4. Create a new build of your app that includes **Mobile Center Distribute** and contains the setup logic as described below.
5. Click on the **Distribute new release** button in the portal and upload your build of the app.
6. Once the upload has finished, click **Next** and select the **Distribution group** that you just created as the **Destination** of that app distribution.
7. Review the Distribution and distribute the build to your in-app testing group.
8. People in that group will receive an invite to be testers of the app. Once they need to accept the invite, they can download the app from the Mobile Center Portal from their mobile device. Once they have in-app updates installed, you're ready to test in-app updates.
9. Bump the version name (`CFBundleShortVersionString`) of your app.
10. Build the release version of your app and upload a new build of your app just like you did in the previous step and distribute this to the **Distribution Group** you created earlier. Members of the Distribution Group will be prompted for a new version the next time the app enters the foreground.

> [!TIP]
> Please have a look at the information on how to [utilize Mobile Center Distribute](~/distribution/index.md) for more detailed information about **Distribution Groups** etc.
While it is possible to use Mobile Center Distribute to distribute a new version of your app without adding any code, adding Mobile Center Distribute to your app's code will result in a more seamless experience for your testers and users as they get the in-app update experience.

## Disable automatic forwarding of application delegate's methods to Mobile Center services

Mobile Center uses swizzling to automatically forward your application delegate's methods to Mobile Center services to improve SDK integration. There is a possibility of conflicts with other third party libraries or the application delegate itself. In this case, you might want to disable the Mobile Center application delegate forwarding for all Mobile Center services by following the steps below:

1. Open your **Info.plist file**.
2. Add `MobileCenterAppDelegateForwarderEnabled` key and set the value to `0`. This will disable application delegate forwarding for all Mobile Center services.
3. Add `openURL` callback in your `AppDelegate` file.

```objc
- (BOOL)application:(UIApplication *)application
	            openURL:(NSURL *)url
	  sourceApplication:(NSString *)sourceApplication
	         annotation:(id)annotation {

	// Pass the url to MSDistribute.
	return [MSDistribute openURL:url];
}
```
```swift
func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {

  // Pass the URL to MSDistribute.
  return MSDistribute.open(url as URL!)
}
```
