---
title: Mobile Center Distribute for iOS
description: Using in-app updates in Mobile Center Distribute
keywords: sdk, distribute
author: troublemakerben
ms.author: bereimol
ms.date: 04/28/2017
ms.topic: article
ms.assetid: f91fcd0b-d5e6-4c74-89a8-f71c2ee57556
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
---

# Mobile Center Distribute – In-app updates

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

Mobile Center Distribute will let your users install a new version of the app when you distribute it via Mobile Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the new version. Once they choose to update, the SDK will start to update your application. This feature will NOT work if your app is deployed to the app store.

### How do in-app updates work?

The in-app updates feature works as follows:

1. This feature will ONLY work with builds that are distributed using **Mobile Center Distribute** service. It won't work when the debugger is attached.
2. Once you integrate the SDK, build a release version of your app and upload it to Mobile Center, users in that distribution group will be notified for the new release via an email.
3. When each user opens the link in their email, the application will be installed on their device. It's important that they use the email link to install the app - Mobile Center Distribute does not support in-app-updates for apps that have been installed from other sources (e.g. downloading the app from an email attachment).
4. Once the app is installed and opened for the first time after the Mobile Center Distribute SDK has been added, a browser will open to enable in-app updates. This is a _one time_ step that will not occur for subsequent releases of your app.
5. Once the above step is successful, they should be navigated back to the app.
6. A new release of the app shows the in-app update dialog asking users to update your application if it has
    * a higher version name (`CFBundleShortVersionString`) or
    * an equal version name but a higher version (`CFBundleVersion`)

> [!TIP]
> If you upload the same ipa a second time, the dialog will **NOT** appear as the binaries are identical. If you upload a **new** build with the same `CFBundleShortVersionString`/`CFBundleVersion`, it will show the update dialog. The reason for this is that it is a **different** binary.

## 1. Add in-app updates to your app

Please follow the [Get started](~/sdk/getting-started/ios.md) section if you haven't configured the SDK in your application.

### 1.1 Add the Mobile Center Distribute module

The Mobile Center SDK is designed with a modular approach – you only need to integrate the modules of the services that you're interested in.

#### 1.1.1 Integration via Cocoapods

If you are integrating Mobile Center into your app via Cocoapods, add the following dependency to your podfile and run `pod install`.

```ruby
pod 'MobileCenter/MobileCenterDistribute'
```

#### 1.1.2 Integration by copying the binaries into your project

1. Download the [Mobile Center iOS SDK](https://github.com/Microsoft/MobileCenter-SDK-iOS/releases) frameworks provided as a zip file.

2. Unzip the file and you will see a folder called `MobileCenter-SDK-iOS` that contains different frameworks for each Mobile Center service. The framework called `MobileCenter` is required in the project as it contains code that is shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party-libraries.
    * As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
    * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

4. Open Finder and copy the unzipped `MobileCenter-SDK-iOS` folder into your project's folder at the location where you want it to reside.

5. Add the SDK framework to the project in Xcode:
    * Make sure the Project Navigator is visible (⌘+1).
    * Now drag and drop `MobileCenter.framework`, `MobileCenterDistribute.framework` and `MobileCenterDistributeResources.bundle` from the Finder (the ones inside the **Vendor** folder) into Xcode's Project Navigator. Note that `MobileCenter.framework` is required to start the SDK, make sure it is added to your project, otherwise the other modules will not work and your project will not compile successfully.
    * A dialog will appear, make sure your app target is checked. Then click **Finish**.

### 1.2 Start Mobile Center Distribute

In order to use Mobile Center, you need to opt in to the service(s) that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

#### 1.2.1 Add the import for Mobile Center Distribute

**Objective-C**

Open your **AppDelegate.m** file and add the following import statements:

```Objective-C
@import MobileCenter;
@import MobileCenterDistribute;
```

**Swift**

Open your **AppDelegate.swift** file and add the following import statements:

```Swift
import MobileCenter
import MobileCenterDistribute
```

#### 1.2.2 Add the `start:withServices:` method

Add `MSDistribute` to your `start:withServices:` method to start Mobile Center Distribute together with the other services that you want to use in your app.

**Objective-C**

Insert the following line to start the SDK in your app's **AppDelegate.m** class in the `didFinishLaunchingWithOptions` method.

```Objective-C
[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class], [MSDistribute class]]];
```

**Swift**

Insert the following line to start the SDK in your app's **AppDelegate.swift** class in the `didFinishLaunchingWithOptions` method.

```Swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self, MSDistribute.self])
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Please also check out the [Get started](~/sdk/getting-started/ios.md) section if you haven't configured the SDK in your application.

#### 1.3 Modify your **info.plist**

1. Open your **Info.plist**.
2. Add a new key for `URL types` or `CFBundleURLTypes` (in case Xcode displays your `Info.plist` as source code).
3. Change the key of the first child item to `URL Schemes` or `CFBundleURLSchemes`.
4. Enter `mobilecenter-${APP_SECRET}` as the URL scheme and replace `${APP_SECRET}` with the App Secret of your app.

> [!TIP]
> If you want to verify that you modified the **Info.plist** correctly, open it as source code. It should contain the following entry with your App Secret instead of `${APP_SECRET}`:
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

#### 1.4 Application delegate methods forwarding

##### Automatic (swizzling)

Mobile Center automatically forwards your application delegate's methods to Mobile Center services. This is made possible by using method swizzling. It greatly improves the SDK integration but there is a possibility of conflicts with other third party libraries or the application delegate itself. For instance, it should be disabled if you or one of your third party libraries is doing message forwarding on the application delegate. Message forwarding usually implies the implementation of `NSObject#forwardingTargetForSelector:` or `NSObject#forwardInvocation:` methods. In this case you may want to disable the Mobile Center application delegate forwarder by adding the `MobileCenterAppDelegateForwarderEnabled` key to your Info.plist file and set the value to `0`, doing so will disable application delegate forwarding for all Mobile Center services.

> [!NOTE]
> Note that all delegate methods captured by the Mobile Center application delegate forwarder are forwarded to both Mobile Center services and your application delegate.

##### Manual

If you opted for the manual integration then you have to do the forwarding to Distribute yourself by implementing the `openURL` callback in your `AppDelegate`.

```Objective-C
- (BOOL)application:(UIApplication *)application
	            openURL:(NSURL *)url
	  sourceApplication:(NSString *)sourceApplication
	         annotation:(id)annotation {

	// Pass the url to MSDistribute.
	return [MSDistribute openURL:url];
}
```

```Swift
func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {

  // Pass the URL to MSDistribute.
  return MSDistribute.open(url as URL!)
}
```

## 2. Enable or disable Mobile Center Distribute at runtime

You can enable and disable Mobile Center Distribute at runtime. If you disable it, the SDK will not provide any in-app update functionality.

```Objective-C
[MSDistribute setEnabled:NO];
```

```Swift
MSDistribute.setEnabled(false)
```

To enable Mobile Center Distribute again, use the same API but pass `YES`/`true` as a parameter.

```Objective-C
[MSDistribute setEnabled:YES];
```

```Swift
MSDistribute.setEnabled(true)
```

> [!NOTE]
> Note that this will only enable or disable the in-app updates SDK feature for Mobile Center Distribute. Mobile Center Distribute service can still be used in the portal for uploading and distributing releases.

## 3. Check if Mobile Center Distribute is enabled

You can also check if Mobile Center Distribute is enabled or not:

```Objective-C
BOOL enabled = [MSDistribute isEnabled];
```

```Swift
var enabled = MSDistribute.isEnabled()
```

## 4. Customize or localize the in-app update dialog

### 4.1. Customize or localize text

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at [this strings file](https://github.com/Microsoft/mobile-center-sdk-ios/blob/develop/MobileCenterDistribute/MobileCenterDistribute/Resources/en.lproj/MobileCenterDistribute.strings). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app strings files.

### 4.2. Customize the update dialog

You can customize the default update dialog's appearance by implementing the `MSDistributeDelegate` protocol. You need to register the delegate before starting the SDK as shown in the following example:

```Objective-C
[MSDistribute setDelegate:self];
```

```Swift
MSDistribute.setDelegate(self);
```

Here is an example of the delegate implementation that replaces the SDK dialog with a custom one:

```Objective-C
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

```Swift
func distribute(_ distribute: MSDistribute!, releaseAvailableWith details: MSReleaseDetails!) -> Bool {

  // Your code to present your UI to the user, e.g. an UIAlertView.
  UIAlertView.init(title: "Update available", message: "Do you want to update?", delegate: self, cancelButtonTitle: "Postpone", otherButtonTitles: "Update").show()
  return true;
}
```

In case you return `YES`/`true` in the above method, your app should obtain user's choice and message the SDK with the result using the following API.

```Objective-C
// Depending on the user's choice, call notifyUpdateAction: with the right value.
[MSDistribute notifyUpdateAction:MSUpdateActionUpdate];
[MSDistribute notifyUpdateAction:MSUpdateActionPostpone];
```

```Swift
// Depending on the user's choice, call notify() with the right value.
MSDistribute.notify(MSUpdateAction.update);
MSDistribute.notify(MSUpdateAction.postpone);
```

If you don't call the above method, the `releaseAvailableWithDetails:`-method will repeat whenever your app is entering to the foreground.

##  5. Don't initialize Mobile Center Distribute during development

Mobile Center Distribute will pop up it's UI/browser at application start. While this is an expected behavior for your end users, it could be disruptive for you during the development stage of your application. We do not recommend to initialize `MSDistribute` for your `DEBUG` configuration.

 ```Objective-C
 #if DEBUG
 	[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
 #else
 	[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class], [MSDistribute class]]];
 #endif
 ```

 ```Swift
 #if DEBUG
 	MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
 #else
 	MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self, MSDistribute.self])
 #endif
 ```

## 6. How do I test in-app updates?

This is what we recommend to do. There is no way to set this up locally on your machine in a non-trivial way, so you will need to use the Mobile Center Portal for this.

> [!TIP]
> To test in-app updates, you need to add **Mobile Center Distribute** to your application and distribute that using Mobile Center Distribute.

1. Create your app in the Mobile Center Portal if you haven't done that already.
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
