---
title: Get Started with macOS Extensions
description: Get started
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 09/18/2019
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

Once you have integrated the App Center SDK into the container application, you can get started with using it in your extension. Note that extensions support only crash reporting.
To learn how to add App Center SDK to your container app, refer to the documentation for [App Center macOS Getting Started](./macos.md).

## 1. Connect your app extension to App Center Portal

There are two ways you can connect your application extension to your App Center app.

* Create a new app in the App Center Portal to obtain an App Secret.
* Use an App Secret from the container app. Note that in this case, user data may not be quite correct.

To learn how to create an App Center application, refer to the [getting started page for macOS](./macos.md#2-create-your-app-in-the-app-center-portal-to-obtain-the-app-secret).

## 2. Add the App Center SDK modules

The App Center SDK for macOS can be integrated into your app via [Cocoapods](https://cocoapods.org) or by manually adding the binaries to your project.

### 2.1 Integration via Cocoapods

If you've used **CocoaPods** to integrate App Center into your container application, please follow the same steps from [App Center macOS Getting Started](./macos.md#31-integration-via-cocoapods) for the extension target to enable it in your extension.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

### 2.2 Integration by copying the binaries into your project

If you've integrated App Center SDK into your app manually, please follow the next steps:

* Open the app extension's target.
* Open the target's **General** settings tab. Drag and drop the **AppCenter.framework** and **AppCenterCrashes.framework** from the **Project Navigator** to the **Linked Frameworks and Libraries** section.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

## 3. Start the SDK

In order to use App Center, you must opt in to the module(s) that you want to use. By default no modules are started and you will have to explicitly call each of them when starting the SDK.

### 3.1 Add the import statements

Open the extension's main view controller file and add the following import statements:

```objc
@import AppCenter;
@import AppCenterCrashes;
```
```swift
import AppCenter
import AppCenterCrashes
```

### 3.2 Add the `start:withServices:` method

Insert the following line in the extensions's app entry point, for example, `viewDidLoad` controller method:

```objc
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSCrashes class]]];
```
```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSCrashes.self])
```

Currently, only crash reporting is supported for application extensions.

### 3.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

Great, you are all set to visualize Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [App Center Crashes](~/sdk/crashes/macos.md) to learn how to customize your app and use more advanced functionalities.