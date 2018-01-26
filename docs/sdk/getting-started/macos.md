---
title: Get Started with macOS
description: Get started
keywords: sdk
author: jaelim-ms
ms.author: jaelim
ms.date: 1/3/2018
ms.topic: get-started-article
ms.assetid: 669af2f0-553c-11e7-b114-b2f933d5fe66
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: macos
---

# Get Started with macOS

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center macOS SDK in your app to use App Center Analytics and App Center Crashes. To add App Center Push to you app, please have a look at the [documentation for App Center Push](~/sdk/push/macos.md).

## 1. Prerequisites

The following requirements must be met to use App Center SDK:

* Your macOS project is set up in Xcode 8 or later on macOS version 10.12 or later.
* You are targeting devices running on macOS 10.9 or later.
* You are not using any other library that provides Crash Reporting functionality.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional desciption for your app.
4. Select **macOS** as the OS and **Objective-C/Swift** as a platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** page or **Settings** page on the App Center Portal.

> [!NOTE]
> App secret is like an api key for your app, it allows events and telemetry to be sent to App Center backend. It doesn't provide any access to your account. It can't be used to invoke App Center REST APIs (like trigger builds or send push notifications). If your code is open source, we recommend you inject the secret at build or in a similar way.

## 3. Add the App Center SDK modules

The App Center SDK for macOS can be integrated into your app via [Cocoapods](https://cocoapods.org) or by manually adding the binaries to your project.

### 3.1  Integration via Cocoapods

1. Add the following dependencies to your `podfile` to include App Center Analytics and App Center Crashes into your app. This will pull in the following frameworks: **AppCenter**, **AppCenterAnalytics** and **AppCenterCrashes**. Alternatively, you can specify which services you want to use in your app. Each service has its own subspec and they all rely on `AppCenter`. It will get pulled in automatically.

	```ruby
	# Use the following line to use App Center Analytics and Crashes.
	pod 'AppCenter'

	# Use the following lines if you want to specify which service you want to use.
	pod 'AppCenter/Analytics'
	pod 'AppCenter/Crashes'
	```

2. Run `pod install` to install your newly defined pod and open your `.xcworkspace`.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

### 3.2 Integration by copying the binaries into your project
Below are the steps on how to integrate the compiled binaries in your Xcode project to set up App Center Analytics and App Center Crashes for your macOS app.

1. Download the [App Center SDK](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) frameworks provided as a zip file.

2. Unzip the file and you will see a folder called **AppCenter-SDK-Apple** that contains different frameworks for each App Center service on each platform folder. The framework called `AppCenter` is required in the project as it contains code that is shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party libraries.
    * As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
    * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

4. Open the unziped **AppCenter-SDK-Apple** folder in Finder and copy the folder into your project's folder at the location where you want it to reside. The folder contains frameworks in subfolders for other platforms that App Center SDK supports, so you might need to delete subfolders that you don't need.

5. Add the SDK frameworks to the project in Xcode:
    * Make sure the Project Navigator is visible (⌘+1).
    * Now drag and drop **AppCenter.framework**, **AppCenterAnalytics.framework** and **AppCenterCrashes.framework** from the Finder (the ones inside the **Vendor** folder) into Xcode's Project Navigator. Note that **AppCenter.framework** is required to start the SDK, make sure it is added to your project, otherwise the other modules won't work and your app won't compile.
    * A dialog will appear, make sure your app target is checked. Then click **Finish**.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

## 4. Start the SDK

In order to use App Center, you need to opt in to the service(s) that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

### 4.1 Add the import statements

**Objective-C**

Open your **AppDelegate.m** file and add the following import statements:

```obj-c
@import AppCenter;
@import AppCenterAnalytics;
@import AppCenterCrashes;
```

**Swift**

Open your **AppDelegate.swift** file and add the following import statements:

```swift
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
```

### 4.2 Add the `start:withServices:` method

**Objective-C**

Insert the following line to start the SDK in your app's **AppDelegate.m** class in the `applicationDidFinishLaunching` method.

```obj-c
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
```

**Swift**

Insert the following line to start the SDK in your app's **AppDelegate.swift** class in the `applicationDidFinishLaunching` method.

```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
```

### 4.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

The example above shows how to use the `start:withServices` method and include both App Center Analytics and App Center Crashes.

If you do not want to use one of the two services, remove the corresponding parameter from the method call above.

Note that, unless you explicitly specify each module as parameters in the start method, you can't use that App Center service. In addition, the `start:withServices` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you just want to onboard to App Center Analytics, you should modify the `start:withServices` API call as follows:

**Objective-C**

```obj-c
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class]]];
```

**Swift**

```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSAnalytics.self])
```

### 4.4 Add internet capabilities for sandboxed apps

If your app is using the App Sandbox, you have to set the capability to allow incoming (Server) and outgoing (Client) connections to allow the app to have access to the internet.
Xcode 9 enables the App Sandbox by default but the capabilities for incoming and outgoing connections need to be set explicitly.

Select your project in the project navigator, select the **Capabilities** tab and if your app is using the sandbox, enable incoming and outgoing connections.

---

Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [App Center Analytics](~/sdk/analytics/macos.md) and [App Center Crashes](~/sdk/crashes/macos.md) to learn how to customize and use more advanced functionalities of both services.

To learn how to get started with Push, read the documentation of [App Center Push](~/sdk/push/macos.md).
