# iOS Getting Started

> [!div class="op_single_selector"]
- [iOS](ios)
- [Android](android)
- [Xamarin](xamarin)
- [React Native](react-native)

Let's get started with setting up Mobile Center iOS SDK in your app to use Analytics and Crashes services:

Contents:

1. [Prerequisites](#1-prerequisites)
2. [Add Mobile Center SDK modules](#2-add-mobile-center-sdk-modules)
3. [Start the SDK](#3-start-the-sdk)

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* An iOS project that is set up in Xcode on macOS version 10.12
* The minimum OS target supported by the Mobile Center SDK is iOS 8.0 or later
* You aren't using any other SDK that provides Crash Reporting functionality

## 2. Add Mobile Center SDK modules

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

## 2.1 Integration by copying the binaries into your project
Below are the steps on how to integrate the compiled libraries in your Xcode project to setup the Mobile Center SDK for your iOS app.

1. Download the [Mobile Center iOS SDK](https://github.com/Microsoft/MobileCenter-SDK-iOS/releases) frameworks provided as a zip file.

2. Unzip the file and you will see a folder called `MobileCenter-SDK-iOS` that contains different frameworks for each Mobile Center service. There is a framework called `MobileCenter`, which is required in the project as it contains the logic for persistence, forwarding etc.

3. [Optional] Create a subdirectory for 3rd-party-libraries.
 	* As a best practice, 3rd-party libraries usually reside inside a subdirectory (it's often called `Vendor`), so if you don't have your project organized with a subdirectory for libraries, now would be a great start for it. This subdirectory is often called `Vendor`.
 	* Create a group called `Vendor` inside your Xcode project to mimic your file structure on disk.

4. Open Finder and copy the previously unzipped `MobileCenter-SDK-iOS` folder into your project's folder at the location where you want it to reside.

5. Add the SDK frameworks to the project in Xcode:
    * Make sure the Project Navigator is visible (⌘+1).
    * Now drag and drop `MobileCenter.framework`, `MobileCenterAnalytics.framework`, and `MobileCenterCrashes.framework` from Finder (the ones inside the Vendor folder) into Xcode's Project Navigator on the left side. Note that `MobileCenter.framework` is required to start the SDK. So make sure it's added to your project, otherwise the other modules won't work and your app won't compile.
    * A dialog will appear again. Make sure your app target is checked. Then click Finish.

## 2.2  Integration using CocoaPods
Add the following to your `podfile` to include all services into your app. This will pull in MobileCenter, MobileCenterAnalytics and MobileCenterCrashes. Alternatively, you can specify which services you want to use in your app. Each service has it's own subspec and they all rely on MobileCenter. It will get pulled in automatically.

```ruby
  # Use the following line to use all services.
  pod 'MobileCenter'

  # Use the following line if you want to specify which service you want to use.
  pod 'MobileCenter/MobileCenterAnalytics'
  pod 'MobileCenter/MobileCenterCrashes'
```

2. Run `pod install` to install your newly defined pod, open your `.xcworkspace` and it's time to start the SDK and make use of the Mobile Center services.


Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the Mobile Center services.

## 3. Start the SDK

To start the Mobile Center SDK in your app, follow these steps:

1. **Add `import` statements:**  You need to add the following import statements before starting the SDK. Open your AppDelegate.m file and add the following lines at the top of the file below your own import statements.

    **Objective-C**
    Open your AppDelegate.m file and add the following lines at the top of the file below your own import statements.

        @import MobileCenter;
        @import MobileCenterAnalytics;
        @import MobileCenterCrashes;

    **Swift**
    Open your AppDelegate.swift file and add the following lines.

        import MobileCenter
        import MobileCenterAnalytics
        import MobileCenterCrashes


3. **Start the SDK:** Mobile Center provides developers with three modules to get started: MobileCenter (required), Analytics and Crashes. In order to use Mobile Center services, you need to opt in for the module(s) that you'd like, meaning by default no modules are started and you will have to explicitly call each of them, both Analytics and Crashes, when starting the SDK.

    **Objective-C**
    Insert the following line to start the SDK in your app's AppDelegate.m class in the didFinishLaunchingWithOptions method.

        [MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];

    **Swift**
    Insert the following line to start the SDK in your app's AppDelegate.swift class in the didFinishLaunchingWithOptions method.

        MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])

    You can also copy paste the `start` method call from the Getting Started page on Mobile Center portal once your app is selected. It already includes the App Secret so that all the data collected by the SDK corresponds to your application. Make sure to replace {Your App Secret} text with the actual value for your application.

The example above shows how to use the `start` method and include both the Analytics and Crashes module. If you wish not to use Analytics, remove the parameter from the method call above. Note that, unless you explicitly specify each module as parameters in the start method, you can't use that Mobile Center service. Also, the `start` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically. Look at [Analytics](/sdk/iOS/analytics) and [Crashes](/sdk/iOS/crashes) section for APIs to use in your app.
