---
title: Get Started with tvOS
description: Get started with tvOS
keywords: sdk
author: king-of-spades
ms.author: kegr
ms.date: 10/22/2020
ms.topic: get-started-article
ms.assetid: 679af2f0-553c-11e7-b114-b2f933d5fe66
ms.tgt_pltfrm: tvOS
dev_langs:  
 - swift
 - objc
---

# Get Started with tvOS
> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [iOS Extensions](ios-extensions.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [macOS Extensions](macos-extensions.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center tvOS SDK in your app to use App Center Analytics and App Center Crashes.

## 1. Prerequisites

The following requirements must be met to use App Center SDK:

* Your tvOS is set up in Xcode 11 or later on tvOS version 11 or later.
* You aren't using any other library that provides Crash Reporting functionality.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you've already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top-right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select **tvOS** as the OS and **Objective-C/Swift** as a platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you've created an app, you can obtain its **App Secret** on the **Settings** page on the App Center Portal. At the top right-hand corner of the **Settings** page, click on the **triple vertical dots** and select `Copy app secret` to get your App Secret.

## 3. Add the App Center SDK modules

The App Center SDK for tvOS can be integrated into your app via [Cocoapods](https://cocoapods.org), [Carthage](https://github.com/Carthage/Carthage), [Swift Package Manager](https://github.com/apple/swift-package-manager) or by manually adding the binaries to your project.

> [!NOTE]
> In the `4.0.0` version of App Center breaking changes were introduced. Follow the [Migrate to App Center SDK 4.0.0 and higher](../getting-started/migration/apple-sdk-update.md) section to migrate App Center from previous versions.

### 3.1  Integration via Cocoapods

1. Add the following dependencies to your `podfile` to include App Center Analytics and App Center Crashes into your app. This will pull in the following frameworks: **AppCenter**, **AppCenterAnalytics**, and **AppCenterCrashes**. Instead, you can specify which services you want to use in your app. Each service has its own subspec and they all rely on `AppCenter`. It will get pulled in automatically.

	```ruby
	# Use the following line to use App Center Analytics and Crashes.
	pod 'AppCenter'

	# Use the following lines if you want to specify which service you want to use.
	pod 'AppCenter/Analytics'
	pod 'AppCenter/Crashes'
	```

2. Run `pod install` to install your newly defined pod and open the project's **.xcworkspace**.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

### 3.2 Integration via Carthage

Below are the steps on how to integrate the App Center SDK in your Xcode project using [Carthage](https://github.com/Carthage/Carthage) version **0.30 or higher**, a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

1. Add the following dependencies to your `Cartfile` to include App Center Analytics and App Center Crashes into your app. 

    ```ruby
    # Use the following line to get the latest version of App Center
    github "microsoft/appcenter-sdk-apple"
    ```

    ```ruby
    # Use the following line to get the specific version of App Center
    github "microsoft/appcenter-sdk-apple" ~> X.X.X
    ```

1. Run `carthage update --platform tvOS`. This will fetch dependencies into a **Carthage/Checkouts** folder, and then build each framework.
1. Open your application target's **General** settings tab. Drag and drop **AppCenter.framework**, **AppCenterAnalytics.framework**, and **AppCenterCrashes.framework** files from the **Carthage/Build/tvOS** folder into Xcode's Project Navigator. The **AppCenter.framework** is required to start the SDK. If it isn't added to the project, the other modules won't work and your app won't compile.
1. A dialog will appear, make sure your app target is checked. Then click **Finish**.

    > [!NOTE]
    > If you use `carthage copy-frameworks` in your **Build Phase** you shouldn't add the App Center SDKs there as they are shipped as static frameworks.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

[!INCLUDE [swift package manager](includes/swift-package-manager.md)]

### 3.4 Integration by copying the binaries into your project

Below are the steps on how to integrate the compiled binaries in your Xcode project to set up App Center Analytics and App Center Crashes for your tvOS app.

[!INCLUDE [xcframework support](includes/xcframeworks.md)]

1. Download the [App Center SDK](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) frameworks provided as a zip file.

2. Unzip the file and you'll see a folder called **AppCenter-SDK-Apple** that contains different frameworks for each App Center service on each platform folder. The framework called `AppCenter` is required in the project as it contains code that's shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party libraries.
   * As a best practice, 3rd-party libraries are usually inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
   * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

4. Open the unziped **AppCenter-SDK-Apple** folder in Finder and copy the folder into your project's folder at the location where you want it. The folder contains frameworks in subfolders for other platforms that App Center SDK supports, so you might need to delete subfolders that you don't need.

5. Add the SDK frameworks to the project in Xcode:
   * Make sure the Project Navigator is visible (⌘+1).
   * Now drag and drop **AppCenter.framework**, **AppCenterAnalytics.framework**, and **AppCenterCrashes.framework** from the Finder (the ones inside the **Vendor** folder) into Xcode's Project Navigator. **AppCenter.framework** is required to start the SDK, make sure it is added to your project, otherwise the other modules won't work and your app won't compile.
   * A dialog will appear, make sure your app target is checked. Then click **Finish**.
   
> [!NOTE]
> The SDK binary isn't packaged following the tvOS framework convention. The reason is that the App Center SDK for tvOS isn't a conventional framework but a static one. You have to link it as a static framework: make sure that you're not embedding the binaries, and don't include them in the "copy bundle resources" build phase.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

## 4. Start the SDK
To use App Center, you must opt in to the module(s) that you want to use. By default no modules are started and you'll have to explicitly call each of them when starting the SDK.

### 4.1 Add the import statements
Open the project's **AppDelegate** file and add the following import statements:

```objc
@import AppCenter;
@import AppCenterAnalytics;
@import AppCenterCrashes;
```
```swift
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
```

### 4.2 Add the `start:withServices:` method

*Insert the following line in the app's `didFinishLaunchingWithOptions` delegate method:

```objc
[MSACAppCenter start:@"{Your App Secret}" withServices:@[[MSACAnalytics class], [MSACCrashes class]]];
```
```swift
AppCenter.start(withAppSecret: "{Your App Secret}", services: [Analytics.self, Crashes.self])
```

### 4.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

The example above shows how to use the `start:withServices` (`start(withAppSecret:services:)` for Swift) method and include both App Center Analytics and App Center Crashes.

If you don't want to use one of the two services, remove the corresponding parameter from the method call above.

Unless you specify each module as a parameter in the start method, you can't use that App Center service. Also, the `start:withServices` (`start(withAppSecret:services:)` for Swift) API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you just want to onboard to App Center Analytics, you should modify the `start:withServices` (`start(withAppSecret:services:)` for Swift) API call as follows:

```objc
[MSACAppCenter start:@"{Your App Secret}" withServices:@[[MSACAnalytics class]]];
```
```swift
AppCenter.start(withAppSecret: "{Your App Secret}", services: [Analytics.self])
```

---

Great, you're all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [App Center Analytics](~/sdk/analytics/tvos.md) and [App Center Crashes](~/sdk/crashes/tvos.md) to learn how to customize and use more advanced functionalities of both services.
