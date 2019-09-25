---
title: Get Started with macOS Extensions
description: Get started
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 09/24/2019
ms.topic: get-started-article
ms.assetid: bf7b3627-3ee0-41a8-9023-98a08a3ad4c1
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: macos
dev_langs:  
 - swift
 - objc
---

# Get Started with macOS extensions

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

Note that extensions only support crash reporting.

Let's get started with setting up App Center macOS SDK in your app extension to use App Center Crashes.

## 1. Prerequisites

The following requirements must be met to use App Center SDK:

* Your macOS project is set up in Xcode 10 or later on macOS version 10.12 or later.
* You are targeting devices running on macOS 10.9 or later.
* You are not using any other library that provides Crash Reporting functionality.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select **macOS** as the OS and **Objective-C/Swift** as a platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Settings** page on the App Center Portal. At the top right hand corner of the **Settings** page, click on the **triple vertical dots** and select `Copy app secret` to get your App Secret.

> [!NOTE]
> Using an existing App Secret from another iOS project as side effects. App Center doesn't support filtering by project on the same App Center application. For instance listing crashes for a particular version will list all the crashes from both projects for this version without distinction. It can be confusing.

## 3. Add the App Center SDK modules

The App Center SDK for macOS can be integrated into your app via [Cocoapods](https://cocoapods.org) or by manually adding the binaries to your project.

### 3.1 Integration via Cocoapods

1. Add the following dependencies to your `podfile` to include and App Center Crashes into your app extension. This will pull in the following frameworks: **AppCenter** and **AppCenterCrashes**.

```ruby
pod 'AppCenter/Crashes'
```

2. Run `pod install` to install your newly defined pod and open the project's **.xcworkspace**.

Now that you've integrated the frameworks in your application extension, it's time to start the SDK and make use of the App Center services.

### 3.2 Integration by copying the binaries into your project
Below are the steps on how to integrate the compiled binaries in your Xcode project to set up App Center Crashes for your macOS app extension.

1. Download the [App Center SDK](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) frameworks provided as a zip file.

2. Unzip the file and you will see a folder called **AppCenter-SDK-Apple** that contains different frameworks for each App Center service on each platform folder. The framework called `AppCenter` is required in the project as it contains code that is shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party libraries.
   * As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
   * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

4. Open the unziped **AppCenter-SDK-Apple** folder in Finder and copy the folder into your project's folder at the location where you want it to reside. The folder contains frameworks in subfolders for other platforms that App Center SDK supports, so you might need to delete subfolders that you don't need.

5. Add the SDK frameworks to the project in Xcode:
   * Make sure the Project Navigator is visible (⌘+1).
   * Now drag and drop **AppCenter.framework** and **AppCenterCrashes.framework** from the Finder (the ones inside the **Vendor** folder) into Xcode's Project Navigator. Note that **AppCenter.framework** is required to start the SDK, make sure it is added to your project, otherwise the other modules won't work and your app extension won't compile.
   * A dialog will appear, make sure your app extension target is checked. Then click **Finish**.

> [!NOTE]
> The SDK binary is not packaged following the macOS framework convention. The reason is that the App Center SDK for Mac is not a conventional framework but a static one. You have to link it as a static framework: make sure that you are not embedding the binaries, and don't include them in the "copy bundle resources" build phase.

Now that you've integrated the frameworks in your app extension, it's time to start the SDK and make use of the App Center services.

## 1. Connect your app extension to App Center Portal

There are two ways you can connect your application extension to your App Center app.

* Create a new app in the App Center Portal to obtain an App Secret.
* Use an App Secret from the container app. Note that in this case, user data may not be quite correct.

To learn how to create an App Center application, refer to the [getting started page for macOS](./macos.md#2-create-your-app-in-the-app-center-portal-to-obtain-the-app-secret).

## 3. Start the SDK

In order to use App Center, you must opt in to the module(s) that you want to use. By default, no modules are started, and you will have to explicitly call each of them when starting the SDK. 

### 3.1 Add the import statements

Insert the following lines in the file containing the app extension's entry point. For example inside the main ViewController file of a Today extension.

```objc
@import AppCenter;
@import AppCenterCrashes;
```
```swift
import AppCenter
import AppCenterCrashes
```

### 3.2 Add the `start:withServices:` method

Insert the following line in the app extension's entry point. For example, the `viewDidLoad` method of the main ViewController file of a Today extension.

```objc
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSCrashes class]]];
```
```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSCrashes.self])
```

Currently, only crash reporting is supported for application extensions.

### 3.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application extension. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

Great, you are all set to visualize Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [App Center Crashes](~/sdk/crashes/macos.md) to learn how to customize your app extension and use more advanced functionalities.
