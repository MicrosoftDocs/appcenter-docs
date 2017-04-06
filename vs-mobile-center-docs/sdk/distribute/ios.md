---
title: iOS Distribute
description: Using in-app updates in Mobile Center
keywords: sdk, distribute
author: elamalani
ms.author: emalani
ms.date: 03/24/2017
ms.topic: article
ms.assetid: f91fcd0b-d5e6-4c74-89a8-f71c2ee57556
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
---

# iOS Distribute

> [!div class="op_single_selector"]
> * [iOS](ios.md)
> * [Android](android.md)
> * [Xamarin](xamarin.md)

## Introduction
You can easily let your users get the latest version of your app by integrating Mobile Center Distribute. All you need to do is pass the service name as a parameter in the `start` API call. Once the app launches, the SDK checks for new updates in the background. If it finds a new update, users will see a dialog with three options - **Download**, **Postpone** and **Ignore**. If the user taps **Download**, Mobile Center Distribute will trigger the new version to be installed. **Postpone** will delay the download until the app is opened again. **Ignore** will not prompt the user again for that particular app version. In case of a required update, the user will only have the option to tap **Download**.

## Additional code to enable Distribute

First, pass the `Distribute` module as a parameter to the `start:withServices:` method as described in the setup-section. Once that is done, additional steps are required to enable in-app-updates:

1. Open your `Info.plist`.
2. Add a new key for `URL types` or `CFBundleURLTypes` (in case Xcode displays your `Info.plist` as source code).
3. Change the key of the first child item to URL Schemes or `CFBundleURLSchemes`.
4. Enter `mobilecenter-${APP_SECRET}` as the URL scheme and replace `${APP_SECRET}` with the App Secret of your app.
5. Implement the `openURL`-callback in your `AppDelegate` to enable in-app-updates.

```objectivec
- (BOOL)application:(UIApplication *)application
	            openURL:(NSURL *)url
	  sourceApplication:(NSString *)sourceApplication
	         annotation:(id)annotation {
	         
	// Pass the url to MSDistribute.
	[MSDistribute openUrl:url];
	return YES;
}
```

```swift
func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
	    
  // Pass the URL to MSDistribute.
  MSDistribute.open(url as URL!)
  return true
}
```

## Text customization and localization

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at the string files [this resource file](https://github.com/Microsoft/mobile-center-sdk-ios/blob/develop/MobileCenterDistribute/MobileCenterDistribute/Resources/en.lproj/MobileCenterDistribute.strings). Use the same string name and specify the localized value to be reflected in the dialog in your own app resource files.   

## Enable or disable Distribute

You can change the enabled state by calling the `setEnabled` API. If you disable it, the SDK will not prompt your users when a new version is available for install. To re-enable it, pass `YES` or `true` as a parameter in the same method.

> [!NOTE]
> Note that it will only disable SDK features for the Distribute service (in-app updates for your application) and the SDK API has nothing to do with disabling the Distribute service on the Mobile Center portal.

```objectivec
[MSDistribute setEnabled:NO];
```

```swift
MSDistribute.setEnabled(false)
```

You can also check if the service is enabled in the SDK or not at runtime using the `isEnabled` method. 
  
```objectivec
BOOL enabled = [MSDistribute isEnabled];
```

```swift
var enabled = MSDistribute.isEnabled()
```