---
title: Get Started with iOS Extensions
description: Get started
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 09/18/2019
ms.topic: get-started-article
ms.assetid: 513247e0-9a7e-4f7a-b212-43fd32474900
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:  
 - swift
 - objc
---

# Get Started with iOS extensions

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

Once you have integrated the App Center SDK into the container application, you can get started with using it in your extension. Note that extensions support only crash reporting.
To learn how to add App Center SDK to your container app, refer to the documentation for [App Center iOS Getting Started](./ios.md).

## 1. Connect your app extension to App Center Portal

There are two ways you can connect your application extension to the App Center app.

1. Create a new app in App Center Portal to obtain App Secret.
2. Use an App Secret from the container app. Note that in this case, users data may not be quite correct.

To learn how to create an App Center application, refer to the [App Center iOS Getting Started](./ios.md#2-create-your-app-in-the-app-center-portal-to-obtain-the-app-secret).

## 3. Add the App Center SDK modules

The App Center SDK for iOS can be integrated into your app via [Cocoapods](https://cocoapods.org) or by manually adding the binaries to your project.

### 3.1  Integration via Cocoapods

If you've used **CocoaPods** to integrate App Center in to your container application, please follow the same steps from [App Center iOS Getting Started](./ios.md#31-integration-via-cocoapods) for the extension target to enable it in your extension.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

### 3.2 Integration by copying the binaries into your project

If you've integration App Center SDK into your app manually, please follow the net steps:

1. Open the app extension's target.
2. Open the target's **General** settings tab. Drag and drop the **AppCenter.framework** and **AppCenterCrashes.framework** from the **Project Navigator** to the **Linked Frameworks and Libraries** section.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

## 4. Start the SDK

In order to use App Center, you must opt in to the module(s) that you want to use. By default no modules are started and you will have to explicitly call each of them when starting the SDK.

### 4.1 Add the import statements

Open the extension's main view controller file and add the following import statements.

```objc
@import AppCenter;
@import AppCenterCrashes;
```
```swift
import AppCenter
import AppCenterCrashes
```

### 4.2 Add the `start:withServices:` method

Insert the following line in the extensions's `viewDidLoad` controller method:

```objc
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSCrashes class]]];
```
```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSCrashes.self])
```

Note that the extension support only crash reporting.

### 4.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

Great, you are all set to visualize Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [App Center Crashes](~/sdk/crashes/ios.md) to learn how to customize and use more advanced functionalities of it.