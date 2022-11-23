---
title: Get Started with macOS
description: Get started with macOS
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 01/18/2021
ms.topic: article
ms.assetid: 669af2f0-553c-11e7-b114-b2f933d5fe66
ms.tgt_pltfrm: macos
dev_langs:  
 - swift
 - objc
---

# Get Started with macOS
> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [iOS Extensions](ios-extensions.md)
> * [React Native](react-native.md)
> * [MAUI/Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [macOS Extensions](macos-extensions.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center macOS SDK in your app to use App Center Analytics and App Center Crashes.

## 1. Prerequisites
The following requirements must be met to use App Center SDK:

* Your macOS project is set up in Xcode 11 or later on macOS version 10.14.4 or later.
* You're targeting devices running on macOS 10.13 or later.
* You're not using any other library that provides Crash Reporting functionality.

> [!NOTE]
> App Center SDK will **drop support for Xcode 10** with the June SDK release.

App Center SDK Analytics and Crashes are compatible with Mac Catalyst via XCFramework or SwiftPM.

App Center SDK is compatible with Apple Silicon.

## 2. Create your app in the App Center Portal to obtain the App Secret
If you've already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top-right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select **macOS** as the OS and **Objective-C/Swift** as a platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you've created an app, you can obtain its **App Secret** on the **Settings** page on the App Center Portal. At the top right-hand corner of the **Settings** page, click on the **triple vertical dots** and select `Copy app secret` to get your App Secret.

## 3. Add the App Center SDK modules
The App Center SDK for macOS can be added to your app via [Cocoapods](https://cocoapods.org), [Carthage](https://github.com/Carthage/Carthage), [Swift Package Manager](https://github.com/apple/swift-package-manager) or by manually adding the binaries to your project.

> [!NOTE]
> In the `4.0.0` version of App Center breaking changes were introduced. Follow the [Migrate to App Center SDK 4.0.0 and higher](../getting-started/migration/apple-sdk-update.md) section to migrate App Center from previous versions.

### 3.1 Integration via Cocoapods
1. Add the following dependencies to your `podfile` to include App Center Analytics and App Center Crashes into your app. This pulls in the following frameworks: **AppCenter**, **AppCenterAnalytics**, and **AppCenterCrashes**. Instead, you can specify which services you want to use in your app. Each service has its own subspec and they all rely on `AppCenter`. It will get pulled in automatically.

	```ruby
	# Use the following line to use App Center Analytics and Crashes.
	pod 'AppCenter'

	# Use the following lines if you want to specify which service you want to use.
	pod 'AppCenter/Analytics'
	pod 'AppCenter/Crashes'
	```

2. Run `pod install` to install your newly defined pod and open the project's `.xcworkspace`.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

### 3.2 Integration via Carthage
Below are the steps on how to integrate the App Center SDK in your Xcode project using [Carthage](https://github.com/Carthage/Carthage) version **0.30 or higher**, a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

1. Add the following dependencies to your `Cartfile` to include App Center into your app. This pulls in all the frameworks. Then you can link only those frameworks that you want to use in your app.

    ```ruby
    # Use the following line to get the latest version of App Center
    github "microsoft/appcenter-sdk-apple"
    ```

    ```ruby
    # Use the following line to get the specific version of App Center
    github "microsoft/appcenter-sdk-apple" ~> X.X.X
    ```
    
1. Run `carthage update --platform macOS`. This fetches dependencies into a **Carthage/Checkouts** folder, and then builds each framework.
1. Open your application target's **General** settings tab. Drag and drop **AppCenter.framework**, **AppCenterAnalytics.framework**, and **AppCenterCrashes.framework** files from the **Carthage/Build/macOS** folder into Xcode's Project Navigator. The **AppCenter.framework** is required to start the SDK. If it isn't added to the project, the other modules won't work and your app won't compile.
1. A dialog will appear, make sure your app target is checked. Then click **Finish**.

    > [!NOTE]
    > If you use `carthage copy-frameworks` in your **Build Phase** you shouldn't add the App Center SDKs there as they're shipped as static frameworks.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

[!INCLUDE [swift package manager](includes/swift-package-manager.md)]

### 3.4 Integration by copying the binaries into your project
Below are the steps on how to integrate the compiled binaries in your Xcode project to set up App Center Analytics and App Center Crashes for your macOS app.

[!INCLUDE [xcframework support](includes/xcframeworks.md)]

1. Download the [App Center SDK](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) frameworks provided as a zip file.

2. Unzip the file and you'll see a folder called **AppCenter-SDK-Apple** that contains different frameworks for each App Center service on each platform folder. The framework called `AppCenter` is required in the project as it contains code that's shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party libraries.
   * 3rd-party libraries are usually in a subdirectory (it's often called **Vendor**), so if your project doesn't use a subdirectory for libraries, create a **Vendor** subdirectory now.
   * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

4. Open the unzipped **AppCenter-SDK-Apple** folder in Finder and copy the folder into your project's folder at the location where you want it. The folder contains frameworks in subfolders for other platforms that App Center SDK supports, so you might need to delete unneeded subfolders.

5. Add the SDK frameworks to the project in Xcode:
   * Make sure the Project Navigator is visible (⌘+1).
   * Now drag and drop **AppCenter.framework**, **AppCenterAnalytics.framework**, and **AppCenterCrashes.framework** from the Finder (the ones inside the **Vendor** folder) into Xcode's Project Navigator. **AppCenter.framework** is required to start the SDK. If it's missing the other modules won't work, and your app won't compile.
   * A dialog will appear, make sure your app target is checked. Then click **Finish**.
   
> [!NOTE]
> The SDK binary isn't packaged following the macOS framework convention. The reason is that the App Center SDK for Mac isn't a conventional framework but a static one. You've to link it as a static framework: make sure that you aren't embedding the binaries, and don't include them in the "copy bundle resources" build phase.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

## 4. Start the SDK
To use App Center, you must opt in to the module(s) that you want to use. By default no modules are started and you must call each one when starting the SDK.
If you're developing for an extension, refer to the [Extension getting started page](./macos-extensions.md).

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
Insert the following line in the app's `didFinishLaunchingWithOptions` delegate method:

```objc
[MSACAppCenter start:@"{Your App Secret}" withServices:@[[MSACAnalytics class], [MSACCrashes class]]];
```
```swift
AppCenter.start(withAppSecret: "{Your App Secret}", services: [Analytics.self, Crashes.self])
```

If you have a Catalyst application, you can pass app secrets for both iOS and macOS at the same time:

```objc
[MSACAppCenter start:@"ios={Your iOS App Secret};macos={Your macOS App Secret}" withServices:@[[MSACAnalytics class], [MSACCrashes class]]];
```
```swift
AppCenter.start(withAppSecret:"ios={Your iOS App Secret};macos={Your macOS App Secret}", services: [Analytics.self, Crashes.self])
```

[!INCLUDE [app secret warning](../includes/app-secret-warning.md)]

[!INCLUDE [apple-configure-appcenter](includes/apple-configure-appcenter.md)]

### 4.3 Replace the placeholder with your App Secret
Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can copy-paste the whole sample.

The example above shows how to use the `start:withServices` (`start(withAppSecret:services:)` for Swift) method and include both App Center Analytics and App Center Crashes.

If you don't want to use one of the two services, remove the corresponding parameter from the method call above.

Unless you explicitly specify each module as parameters in the start method, you can't use that App Center service. Also, the `start:withServices` (`start(withAppSecret:services:)` for Swift) API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you want to onboard to App Center Analytics, you should modify the `start:withServices` (`start(withAppSecret:services:)` for Swift) API call as follows:

```objc
[MSACAppCenter start:@"{Your App Secret}" withServices:@[[MSACAnalytics class]]];
```
```swift
AppCenter.start(withAppSecret: "{Your App Secret}", services: [Analytics.self])
```

### 4.4 Add internet capabilities for sandboxed apps
If your app is using the App Sandbox, you've to set the capability to allow outgoing (Client) connections to allow the app to have access to the internet.
Xcode 9 enables the App Sandbox by default but the capabilities for outgoing connections need to be set explicitly.

Select your project in the project navigator, select the **Capabilities** tab and if your app is using the sandbox, enable outgoing connections.

---

Great, you're all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.

Look at the [App Center Analytics docs](~/sdk/analytics/macos.md) and [App Center Crashes docs](~/sdk/crashes/macos.md) to learn how to customize and use advanced features of each service.