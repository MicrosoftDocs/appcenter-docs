---
title: Get Started with React Native
description: Get Started
keywords: sdk
author: elamalani
ms.author: elamalani
ms.date: 07/19/2017
ms.topic: get-started-article
ms.assetid: 8c185dee-ae25-4582-bd7c-14163e6fe392
ms.service: mobile-center
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

The Mobile Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up Mobile Center React Native SDK in your app to use Mobile Center Analytics and Mobile Center Crashes.

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* You are using a React Native project that runs React Native 0.34 or later.
* You are targeting devices that are running on Android Version 4.0.3/API level 15 or later, or iOS version 8.0 or later.
* The default way to use the SDK requires [Cocoapods](https://cocoapods.org). Nonetheless, it is possible to link the SDK manually.

## 2. Create your app in the Mobile Center Portal to obtain the App Secret

If you have already created your app in the Mobile Center portal, you can skip this step.

1. Head over to [mobile.azure.com](https://mobile.azure.com).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional desciption for your app.
4. Select the appropriate OS (Android or iOS) and select **React Native** as the platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the Mobile Center Portal.

## 3. Add the Mobile Center SDK modules

The default integration of the SDK uses Cocoapods for iOS. If you are not using Cocoapods in your app, you need to integrate the React Native SDK manually for your iOS app.

### 3.1 Integrate the SDK automatically

#### 3.1 Add Mobile Center SDK modules

1. Open a Terminal and navigate to the root of your React Native project, then enter the following line to add Mobile Center Analytics and Crashes to the app:

	```
	npm install mobile-center mobile-center-analytics mobile-center-crashes --save
	```

	The Mobile Center SDK uses a modular approach, where you just add the modules for Mobile Center services that you want to use. **mobile-center-analytics** and
	**mobile-center-crashes** make sense to add to almost every app, as they provide value with no additional setup required. **mobile-center** provides general
	purpose Mobile Center [APIs](../other-apis/react-native.md), useful for multiple services.

2. Link the plugins to the React Native app by using the react-native link command.

	```
	react-native link
	```

	For iOS, it will try to download the iOS Mobile Center SDK from **Cocoapods**, if you see an error like:

	```
	Added code to initialize iOS Mobile Center SDK in ios/reactnativesample/AppDelegate.m
	Analyzing dependencies [!] Unable to find a specification for RNMobileCenterShared (~> {version})	
	```

	Please run the following command:

	```
	pod repo update
	```

	And then retry running `react-native link`.

3. A set of prompts will appear asking for additional information. The first will ask for the App Secret, which enables Mobile Center to map this app to the right user account.

	```
	What is the Android App Secret? 0000-0000-0000-0000-000000000000

	What is the iOS App Secret? 0000-0000-0000-0000-000000000000
	```

	If you provided the App Secret previously, you won't be prompted again instead seeing the current value for the secret and where to change it in the source if needed.

	The SDK will then ask whether or not to send user events automatically. [Learn more about sending user events manually.](~/sdk/analytics/react-native.md)

	```
	For the Android app, should user tracking be enabled automatically? (Use arrow keys)
        ❯ Enable Automatically
          Enable in JavaScript

	For the iOS app, should user tracking be enabled automatically? (Use arrow keys)
        ❯ Enable Automatically
          Enable in JavaScript
	```

	Finally it will ask whether or not to send crash reports automatically. [Learn more about processing on crash reports in JS](~/sdk/crashes/react-native.md).

	```
	For the Android app, should crashes be sent automatically or processed in JavaScript before being sent? (Use arrow keys)
        ❯ Automatically
          Processed in JavaScript by user

	For the iOS app, should crashes be sent automatically or processed in JavaScript before being sent? (Use arrow keys)
        ❯ Automatically
          Processed in JavaScript by user
	```

### 3.2 [iOS only] Integrate the iOS SDK manually

We **strongly** recommend integrating the SDK via Cocoapods as described above. Nonetheless, it's also possible to integrate the SDK manually.

#### 3.2.1 Download the binaries

Download the [Mobile Center iOS SDK](https://github.com/Microsoft/MobileCenter-SDK-iOS/releases) and the [ReactNative Mobile Center iOS SDK](https://github.com/Microsoft/MobileCenter-SDK-React-Native/releases) frameworks provided as two zip files. Unzip the files and you will see different frameworks for each Mobile Center services and the ReactNative Mobile Center framework. 

#### 3.2.2 Add the binaries to your Xcode project

1. Make sure the Project Navigator is visible `(⌘+1)`. Drag and drop the frameworks into your project to add them to the top level within your project.
2. A dialog will appear. Select “Create groups” and set the checkmark for “Add to targets” for your target. Then click Finish.

> **Note:** `MobileCenter.framework` is required to start the SDK. Make sure it is added to your project, otherwise the other modules won’t work and your app won’t compile.

## 4. Start the SDK

Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically. There is no additional setup required. Look at [Analytics](~/sdk/analytics/react-native.md) and [Crashes](~/sdk/crashes/react-native.md) section for APIs guides and walkthroughs to learn what Mobile Center can do.
