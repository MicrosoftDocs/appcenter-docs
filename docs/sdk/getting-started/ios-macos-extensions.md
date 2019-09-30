---
title: Shared docs for Apple Extensions
description: Shared docs for Apple Extensions
keywords: sdk
author: winnieli
ms.author: yuli1
ms.date: 09/30/2019
ms.topic: article
ms.assetid: 15fb99ba-7f1a-47ec-94ac-a4b9f8ffaed0
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---

## 3. Add the App Center SDK modules

The App Center SDK can be integrated into your app via [Cocoapods](https://cocoapods.org), [Carthage](https://github.com/Carthage/Carthage) or by manually adding the binaries to your project.

### 3.1 Integration via Cocoapods

1. Add the following dependencies to your `podfile` to include App Center Crashes into your app. This will pull in the following frameworks: **AppCenter** and **AppCenterCrashes**.

	```ruby
	pod 'AppCenter/Crashes'
	```

2. Run `pod install` to install your newly defined pod and open the project's **.xcworkspace**.

> [!NOTE]
> If you see an error like ```[!] Unable to find a specification for `AppCenter` ```
>  while running `pod install`, please run `pod repo update` to get the latest pods from the Cocoapods repository and then run `pod install`.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

### 3.2 Integration via Carthage

Below are the steps on how to integrate the App Center SDK in your Xcode project using [Carthage](https://github.com/Carthage/Carthage) version **0.30 or higher**, a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

1. Add the following dependencies to your `Cartfile` to include App Center into your app. This will pull in all the frameworks. Then you can link only those frameworks that you want to use in your app.

    ```ruby
    # Use the following line to get the latest version of App Center
    github "microsoft/appcenter-sdk-apple"
    ```

    ```ruby
    # Use the following line to get the specific version of App Center
    github "microsoft/appcenter-sdk-apple" ~> X.X.X
    ```

2. Run `carthage update`. This will fetch dependencies into a **Carthage/Checkouts** folder, and then build each framework.  
3. Open your application target's **General** settings tab. Drag and drop **AppCenter.framework** and **AppCenterCrashes.framework** files from the **Carthage/Build/** folder into Xcode's Project Navigator. The **AppCenter.framework** is required to start the SDK. If it is not added to the project, the other modules won't work and your app won't compile.
4. A dialog will appear, make sure your app target is checked. Then click **Finish**.

    > [!NOTE]
    > If you use `carthage copy-frameworks` in your **Build Phase** you should not add the App Center SDKs there, as they are shipped as static frameworks.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

### 3.3 Integration by copying the binaries into your project
Below are the steps on how to integrate the compiled binaries in your Xcode project to set up App Center Crashes for your app extension.

1. Download the [App Center SDK](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) frameworks provided as a zip file.

2. Unzip the file and you will see a folder called **AppCenter-SDK-Apple** that contains different frameworks for each App Center service on each platform folder. The framework called `AppCenter` is required in the project as it contains code that is shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party libraries.
   * As a best practice, 3rd-party libraries usually reside inside a subdirectory, often called **Vendor**. If the project isn't organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
   * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

4. Open the unzipped **AppCenter-SDK-Apple** folder in Finder and copy the folder into your project's folder at the location where you want it to reside. The folder contains frameworks in subfolders for other platforms that App Center SDK supports, so you might need to delete subfolders that you don't need.

5. Add the SDK frameworks to the project in Xcode:
   * Make sure the Project Navigator is visible (⌘+1).
   * Now drag and drop **AppCenter.framework** and **AppCenterCrashes.framework** from the Finder (in the location from the previous step) into Xcode's Project Navigator. The **AppCenter.framework** is required to start the SDK. If it is not added to the project, the other modules won't work and your app extension won't compile.
   * A dialog will appear, make sure your app extension target is checked. Then click **Finish**.

Now that you've integrated the frameworks in your app extension, it's time to start the SDK and make use of the App Center services.

## 4. Start the SDK

In order to use App Center, you must opt in to the module(s) that you want to use. By default, no modules are started, and you will have to explicitly call each of them when starting the SDK. 

### 4.1 Add the import statements

Insert the following lines in the file containing the app extension's entry point. For example inside the main ViewController file of a Today extension.

```objc
@import AppCenter;
@import AppCenterCrashes;
```
```swift
import AppCenter
import AppCenterCrashes
```

### 4.2 Add the `start:withServices:` method

Insert the following line in the app extension's entry point. For example inside the `viewDidLoad` method of the main ViewController file of a Today extension.

```objc
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSCrashes class]]];
```
```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSCrashes.self])
```

Currently, only crash reporting is supported for application extensions.

### 4.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application extension. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

Great, you are all set to visualize Crashes data on the portal that the SDK collects automatically.