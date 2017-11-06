---
title: Get Started with React Native
description: Get Started
keywords: sdk
author: elamalani
ms.author: elamalani
ms.date: 08/07/2017
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

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center React Native SDK in your app to use App Center Analytics and App Center Crashes.

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* You are using a React Native project that runs React Native 0.34 or later.
* You are targeting devices that are running on Android Version 4.0.3/API level 15 or later, or iOS version 8.0 or later.
* The default way to use the SDK requires [Cocoapods](https://cocoapods.org). Nonetheless, it is possible to link the SDK manually.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional desciption for your app.
4. Select the appropriate OS (Android or iOS) and select **React Native** as the platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the App Center Portal.

## 3. Add the App Center SDK modules

The default integration of the SDK uses Cocoapods for iOS. If you are not using Cocoapods in your app, you need to integrate the React Native SDK manually for your iOS app.

### 3.1 Integrate the SDK automatically

#### 3.1 Add App Center SDK modules

1. Open a Terminal and navigate to the root of your React Native project, then enter the following line to add App Center Analytics and Crashes to the app:

	```
	npm install appcenter mobile-center-analytics mobile-center-crashes --save
	```

	The App Center SDK uses a modular approach, where you just add the modules for App Center services that you want to use. **mobile-center-analytics** and
	**mobile-center-crashes** make sense to add to almost every app, as they provide value with no additional setup required. **mobile-center** provides general
	purpose App Center [APIs](../other-apis/react-native.md), useful for multiple services.

2. Link the plugins to the React Native app by using the react-native link command.

	```
	react-native link
	```

	> [!NOTE]
	> On React Native **0.47.0**, there is a [bug](https://github.com/facebook/react-native/pull/15321) when using link without parameters.
	> 
	> If you are using that version, please link all modules separately:
	> ```
	> react-native link mobile-center
	> react-native link mobile-center-analytics
	> react-native link mobile-center-crashes
	> ```

	For iOS, it will try to download the iOS App Center SDK from **Cocoapods**, if you see an error like:

	```
	Added code to initialize iOS App Center SDK in ios/reactnativesample/AppDelegate.m
	Analyzing dependencies [!] Unable to find a specification for RNMobileCenterShared (~> {version})	
	```

	Please run the following command:

	```
	pod repo update
	```

	And then retry running `react-native link`.

3. A set of prompts will appear asking for additional information. The first will ask for the App Secret, which enables App Center to map this app to the right user account.

	```
	What is the Android App Secret? 0000-0000-0000-0000-000000000000

	What is the iOS App Secret? 0000-0000-0000-0000-000000000000
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

We **strongly** recommend integrating the SDK via Cocoapods as described above. Nonetheless, it's also possible to integrate the iOS native SDK manually.

> [!NOTE]
> The latest App Center React Native SDK doesn't necessarily depend on the latest App Center iOS SDK, because the iOS SDK is updated and released before the React Native one.
>
> The consequence is that you have to know which version of the iOS SDK the React Native SDK depends on.

1. Download the [App Center SDK for React Native](https://github.com/Microsoft/mobile-center-sdk-react-native/releases/latest) frameworks provided as a zip file.

2. From the release notes on Github, please also download the corresponding frameworks of the App Center SDK for iOS.

3. Unzip both archives and you will see a folder called **MobileCenter-SDK-Apple/iOS** that contains different frameworks for each App Center service. The framework called `MobileCenter` is required in the project as it contains code that is shared between the different modules. You will also see a folder named **RNMobileCenterShared** which contains a single framework for the React Native bridge for iOS which is also required.

4. [Optional] Create a subdirectory for 3rd-party libraries.
    * As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a **Vendor** subdirectory now (under the **ios** directory of your project).
    * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

5. Open Finder and copy the previously unzipped **MobileCenter-SDK-Apple/iOS** and **RNMobileCenterShared** folders into your project's folder at the location where you want it to reside.

6. Add the SDK frameworks to the project in Xcode:
    * Make sure the Project Navigator is visible (⌘+1).
    * Now drag and drop **MobileCenter.framework**, **MobileCenterAnalytics.framework**, **MobileCenterCrashes.framework** and **RNMobileCenterShared.framework** from the Finder (in the location from the previous step) into Xcode's Project Navigator. Note that **MobileCenter.framework** and **RNMobileCenterShared.framework** are required to start the SDK, make sure they are added to your project, otherwise the other modules won't work and your app won't compile.
    * A dialog will appear, make sure your app target is checked. Then click **Finish**.

## 4. Start the SDK

Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically. There is no additional setup required. Look at [Analytics](~/sdk/analytics/react-native.md) and [Crashes](~/sdk/crashes/react-native.md) section for APIs guides and walkthroughs to learn what App Center can do.
