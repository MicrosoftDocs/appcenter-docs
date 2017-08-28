---
title: Get Started with iOS
description: Get started
keywords: sdk
author: troublemakerben
ms.author: bereimol
ms.date: 08/03/2017
ms.topic: get-started-article
ms.assetid: 513247e0-9a7e-4f7a-b212-43fd32474900
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
---

# Get Started with iOS

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

The Mobile Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up Mobile Center iOS SDK in your app to use Mobile Center Analytics and Mobile Center Crashes. To add Mobile Center Distribute to you app, please have a look at the [documentation for Mobile Center Distribute](~/sdk/distribute/ios.md).

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* Your iOS project is set up in Xcode 8 or later on macOS version 10.12.
* You are targeting devices running on iOS 8.0 or later.
* You are not using any other library that provides Crash Reporting functionality.

## 2. Create your app in the Mobile Center Portal to obtain the App Secret

If you have already created your app in the Mobile Center portal, you can skip this step.

1. Head over to [mobile.azure.com](https://mobile.azure.com).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional desciption for your app.
4. Select **iOS** as the OS and **Objective-C/Swift** as a platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the Mobile Center Portal.

## 3. Add the Mobile Center SDK modules

The Mobile Center SDK for iOS can be integrated into your app via [Cocoapods](https://cocoapods.org) or by manually adding the binaries to your project.

### 3.1  Integration via Cocoapods

1. Add the following dependencies to your `podfile` to include Mobile Center Analytics and Mobile Center Crashes into your app. This will pull in the following frameworks: **MobileCenter**, **MobileCenterAnalytics** and **MobileCenterCrashes**. Alternatively, you can specify which services you want to use in your app. Each service has it's own subspec and they all rely on MobileCenter. It will get pulled in automatically.

	```ruby
	# Use the following line to use Mobile Center Analytics and Crashes.
	pod 'MobileCenter'

	# Use the following lines if you want to specify which service you want to use.
	pod 'MobileCenter/Analytics'
	pod 'MobileCenter/Crashes'
	```

2. Run `pod install` to install your newly defined pod and open your `.xcworkspace`.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the Mobile Center services.

### 3.2 Integration by copying the binaries into your project
Below are the steps on how to integrate the compiled binaries in your Xcode project to set up Mobile Center Analytics and Mobile Center Crashes for your iOS app.

1. Download the [Mobile Center iOS SDK](https://github.com/Microsoft/MobileCenter-SDK-iOS/releases) frameworks provided as a zip file.

2. Unzip the file and you will see a folder called **MobileCenter-SDK-Apple/iOS** that contains different frameworks for each Mobile Center service. The framework called `MobileCenter` is required in the project as it contains code that is shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party libraries.
    * As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
    * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

4. Open Finder and copy the previously unzipped **MobileCenter-SDK-Apple/iOS** folder into your project's folder at the location where you want it to reside.

5. Add the SDK frameworks to the project in Xcode:
    * Make sure the Project Navigator is visible (⌘+1).
    * Now drag and drop **MobileCenter.framework**, **MobileCenterAnalytics.framework** and **MobileCenterCrashes.framework** from the Finder (in the location from the previous step) into Xcode's Project Navigator. Note that **MobileCenter.framework** is required to start the SDK, make sure it is added to your project, otherwise the other modules won't work and your app won't compile.
    * A dialog will appear, make sure your app target is checked. Then click **Finish**.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the Mobile Center services.

## 4. Start the SDK

In order to use Mobile Center, you need to opt in to the service(s) that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

### 4.1 Add the import statements

**Objective-C**

Open your **AppDelegate.m** file and add the following import statements:

```obj-c
@import MobileCenter;
@import MobileCenterAnalytics;
@import MobileCenterCrashes;
```

**Swift**

Open your **AppDelegate.swift** file and add the following import statements:

```swift
import MobileCenter
import MobileCenterAnalytics
import MobileCenterCrashes
```

### 4.2 Add the `start:withServices:` method

**Objective-C**

Insert the following line to start the SDK in your app's **AppDelegate.m** class in the `didFinishLaunchingWithOptions` method.

```obj-c
[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
```

**Swift**

Insert the following line to start the SDK in your app's **AppDelegate.swift** class in the `didFinishLaunchingWithOptions` method.

```swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
```

### 4.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page on the Mobile Center portal or through the **Manage App** button.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

The example above shows how to use the `start:withServices` method and include both Mobile Center Analytics and Mobile Center Crashes.

If you do not want to use one of the two services, remove the corresponding parameter from the method call above.

Note that, unless you explicitly specify each module as parameters in the start method, you can't use that Mobile Center service. In addition, the `start:withServices` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you just want to onboard to Mobile Center Analytics, you should modify the `start:withServices` API call as follows:

**Objective-C**

```obj-c
[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class]]];
```

**Swift**

```swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self])
```

Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [Mobile Center Analytics](~/sdk/analytics/ios.md) and [Mobile Center Crashes](~/sdk/crashes/ios.md) to learn how to customize and use more advanced functionalities of both services.

To learn how to get started with in-app updates, read the documentation of [Mobile Center Distribute](~/sdk/distribute/ios.md).

To learn how to get started with Push, read the documentation of [Mobile Center Push](~/sdk/push/ios.md).
