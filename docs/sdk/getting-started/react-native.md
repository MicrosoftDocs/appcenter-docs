---
title: Get Started with React Native
description: Get Started
keywords: sdk
author: elamalani
ms.author: elamalani
ms.date: 06/06/2018
ms.topic: get-started-article
ms.assetid: 8c185dee-ae25-4582-bd7c-14163e6fe392
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# Get Started with React Native

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center React Native SDK in your app to use App Center Analytics and App Center Crashes.

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* You are using a React Native project that runs React Native 0.34 or later.
* You are targeting devices that are running on Android Version 4.0.3/API level 15 or later, or iOS version 9.0 or later.
* For iOS, the default way to use the SDK requires [CocoaPods](https://cocoapods.org). (If you haven't installed CocoaPods, please follow the [CocoaPods Getting Started](https://guides.cocoapods.org/using/getting-started.html) to do so). Nonetheless, it is possible to link the SDK manually.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select the appropriate OS (Android or iOS) and select **React Native** as the platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** page or **Settings** page on the App Center Portal.

## 3. Add the App Center SDK modules

The default integration of the SDK uses CocoaPods for iOS. If you are not using CocoaPods in your app, you need to integrate the React Native SDK manually for your iOS app.

Open a Terminal and navigate to the root of your React Native project, then enter the following line to add App Center Analytics and Crashes to the app:

```
npm install appcenter appcenter-analytics appcenter-crashes --save
```

> [!NOTE]
> `--save` or `--save-dev` flag is required in this step. React Native will link modules based on dependencies and devDependencies in your **package.json** file.

In case you prefer `yarn` over `npm`, use the following command to install App Center:

```
yarn add appcenter appcenter-analytics appcenter-crashes
```

The App Center SDK uses a modular approach, where you just add the modules for App Center services that you want to use. **appcenter-analytics** and **appcenter-crashes** make sense to add to almost every app, as they provide value with no additional setup required. **appcenter** provides general purpose App Center [APIs](../other-apis/react-native.md), useful for multiple services.

### 3.1 Integrate the SDK automatically

1. Link the plugins to the React Native app by using the react-native link command.

	```
	react-native link
	```

	> [!NOTE]
	> On React Native **0.47.0**, there is a [bug](https://github.com/facebook/react-native/pull/15321) when using link without parameters.
	> 
	> If you are using that version, please link all modules separately:
	> ```
	> react-native link appcenter
	> react-native link appcenter-analytics
	> react-native link appcenter-crashes
	> ```

	For iOS, it will try to download the [App Center SDK for iOS and macOS](https://cocoapods.org/pods/AppCenter) from **CocoaPods**, if you see an error like:

	```
	Added code to initialize iOS App Center SDK in ios/reactnativesample/AppDelegate.m
	Analyzing dependencies [!] Unable to find a specification for AppCenterReactNativeShared (~> {version})	
	```

	Please run the following command:

	```
	pod repo update
	```

	And then retry running `react-native link`.

2. A set of prompts will appear asking for additional information. The first will ask for the App Secret, which enables App Center to map this app to the right user account. You can always skip the prompts and come back to this later. 

	```
	What secret does your Android app use? [None]
	
	What secret does your iOS app use? [None]
	```

	If you provided the App Secret previously, you won't be prompted again instead seeing the current value for the secret and where to change it in the source if needed.

	The SDK will then ask whether or not to send user events automatically. [Learn more about sending user events manually.](~/sdk/analytics/react-native.md#wait-for-js-to-enable-app-center-analytics)

	```
	For the Android app, should user tracking be enabled automatically? (Use arrow keys)
        ❯ Enable Automatically
          Enable in JavaScript

	For the iOS app, should user tracking be enabled automatically? (Use arrow keys)
        ❯ Enable Automatically
          Enable in JavaScript
	```

	Finally it will ask whether or not to send crash reports automatically. [Learn more about processing on crash reports in JS](~/sdk/crashes/react-native.md#customize-your-usage-of-app-center-crashes).

	```
	For the Android app, should crashes be sent automatically or processed in JavaScript before being sent? (Use arrow keys)
        ❯ Automatically
          Processed in JavaScript by user

	For the iOS app, should crashes be sent automatically or processed in JavaScript before being sent? (Use arrow keys)
        ❯ Automatically
          Processed in JavaScript by user
	```

### 3.2 [iOS only] Integrate the iOS SDK manually

We **strongly** recommend integrating the SDK via CocoaPods as described above. Nonetheless, it's also possible to integrate the iOS native SDK manually.

> [!NOTE]
> The latest App Center React Native SDK doesn't necessarily depend on the latest App Center iOS SDK, because the iOS SDK is updated and released before the React Native one.
>
> The consequence is that you have to know which version of the iOS SDK the React Native SDK depends on.

1. Download the [App Center SDK for React Native](https://github.com/Microsoft/appcenter-sdk-react-native/releases/latest) frameworks provided as a zip file.

2. From the release notes on GitHub, please also download the corresponding frameworks of the App Center SDK for iOS.

3. Unzip both archives and you will see a folder called **AppCenter-SDK-Apple/iOS** that contains different frameworks for each App Center service. The framework called `AppCenter` is required in the project as it contains code that is shared between the different modules. You will also see a folder named **AppCenterReactNativeShared** which contains a single framework for the React Native bridge for iOS which is also required.

4. [Optional] Create a subdirectory for 3rd-party libraries.
    * As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a **Vendor** subdirectory now (under the **ios** directory of your project).
    * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

5. Open Finder and copy the previously unzipped **AppCenter-SDK-Apple/iOS** and **AppCenterReactNativeShared** folders into your project's folder at the location where you want it to reside.

6. Add the SDK frameworks to the project in Xcode:
    * Make sure the Project Navigator is visible (⌘+1).
    * Drag and drop **AppCenter.framework**, **AppCenterAnalytics.framework**, **AppCenterCrashes.framework** and **AppCenterReactNativeShared.framework** from the Finder (in the location from the previous step) into Xcode's Project Navigator. Note that **AppCenter.framework** and **AppCenterReactNativeShared.framework** are required to start the SDK, make sure they are added to your project, otherwise the other modules won't work and your app won't compile.
    * A dialog will appear, make sure your app target is checked, then click **Finish**.

7. Link AppCenter React Native plugins projects to your app's project:
    * Make sure the Project Navigator is visible (⌘+1).
    * For each AppCenter React Native plugin navigate to the folder containing source code. Paths respectively will be
		* /node_modules/appcenter/ios
		* /node_modules/appcenter-analytics/ios
		* /node_modules/appcenter-crashes/ios
		* /node_modules/appcenter-push/ios
	* Drag and drop `.xcodeproj` files from the Finder into Xcode's Project Navigator. Typically under **Libraries** group.

8. Link libraries for AppCenter React Native plugins.
  Open your project settings and under **General** tab in the **Linked Frameworks and Libraries** section add new items referencing target libraries added on the previuos step: 
	* libAppCenterReactNative.a
	* libAppCenterReactNativeAnalytics.a
	* libAppCenterReactNativeCrashes.a
	* libAppCenterReactNativePush.a

9. Modify **Header Search Paths** to find headers from the AppCenter React Native plugins projects. 
  Open your project settings and under **Build Settings** tab in the **Header Search Paths** section add new locations for header files:
	* $(SRCROOT)/../node_modules/appcenter/ios/AppCenterReactNative
	* $(SRCROOT)/../node_modules/appcenter-analytics/ios/AppCenterReactNativeAnalytics
	* $(SRCROOT)/../node_modules/appcenter-crashes/ios/AppCenterReactNativeCrashes
	* $(SRCROOT)/../node_modules/appcenter-push/ios/AppCenterReactNativePush

10. Modify your app's AppDelegate.m file to include code for starting SDK:
	*  Add these lines to import section

	```objc
	#import <AppCenterReactNative/AppCenterReactNative.h>
	#import <AppCenterReactNativeAnalytics/AppCenterReactNativeAnalytics.h>
	#import <AppCenterReactNativeCrashes/AppCenterReactNativeCrashes.h>
	#import <AppCenterReactNativePush/AppCenterReactNativePush.h>
	```
	* Add these lines to the `didFinishLaunchingWithOptions` method

	```objc
	[AppCenterReactNative register];
	[AppCenterReactNativeAnalytics registerWithInitiallyEnabled:true];
	[AppCenterReactNativeCrashes registerWithAutomaticProcessing];
	[AppCenterReactNativePush register];
	```
11. Create new file with name "AppCenter-Config.plist" with the following content and replace `{APP_SECRET_VALUE}` with your app secret value.

	```xml
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
		<dict>
		<key>AppSecret</key>
		<string>{APP_SECRET_VALUE}</string>
		</dict>
	</plist>
	``` 

## 4. Start the SDK

Now you can build and launch your application either from command line or Xcode/Android Studio.

### 4.1 Build and run your application from command line

You may build and launch your iOS application by the following command:

```
react-native run-ios
```

> [!TIP]
> You can launch it on an **iOS simulator** or **iOS device** by specifying the iOS device name in `react-native run-ios --device "myDeviceName"`.


You may build and launch your Android application by the following command:

```
react-native run-android
```

> [!TIP]
> You can launch it on an **android emulator** or **android device** by specifying the device id in `react-native run-android --deviceId "myDeviceId"` (`deviceId` from `adb devices` command).

### 4.2 Build and run your application from Xcode or Android Studio

For iOS, open your **ios/{appname}.xcworkspace** or **ios/{appname}.xcodeproj** in Xcode and build from there.

> [!NOTE]
> If you linked App Center automatically via `react-native link` (as in step 3.1), you should open **ios/{appname}.xcworkspace** in Xcode. Because App Center CocoaPods dependencies only works with `xcworkspace` not `xcodeproj`, and **ios/{appname}.xcodeproj** won't have App Center CocoaPods dependencies linked.

For Android, import your **android** project in Android Studio and build from there.

Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically. There is no additional setup required. Look at [Analytics](~/sdk/analytics/react-native.md) and [Crashes](~/sdk/crashes/react-native.md) section for APIs guides and walkthroughs to learn what App Center can do.
