---
title: Mobile Center SDK Documentation
description: Using the Mobile Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 03/24/2017
ms.topic: article
ms.assetid: 278e0ad2-1616-4a3c-907a-092b57c81e96
ms.service: mobile-center
ms.custom: sdk
---

# SDK Documentation

The Mobile Center SDK lets you add Mobile Center services to your mobile application.
Each service comes with its own module so that you can quickly add the services required for your app.

The SDK is currently in public preview and supports the following services:

1. **Analytics** – Mobile Center Analytics helps you understand user behavior and customer engagement to improve your mobile app. The SDK automatically captures session count, device properties like model, OS Version etc. and pages. You can define your own custom events to measure things that matter to your business. All the information captured is available in the Mobile Center portal for you to analyze the data.

2. **Crashes** – The Mobile Center SDK will automatically generate a crash log every time your app crashes. The log is first written to the device’s storage and when the user starts the app again, the crash report will be forwarded to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store, Google Play or other app stores. Crash logs contain viable information for you to help resolve the issue. The SDK gives you a lot of flexibility how to handle a crash log. As a developer you can collect and add additional information to the report if you like.

3. **Distribute** – Our SDK will let your users install a new version of the app when you distribute it via Mobile Center. When a new version of the app is available, the SDK will present an update dialog to the users to either download or ignore the latest version. Once they click **Download**, SDK will start the installation process of your application. Note that this feature will **NOT** work if your app is deployed to the app store, if you are developing locally or if the app is a debug build.

## Get Started

* [Android](getting-started/android.md)
* [iOS](getting-started/ios.md)
* [React Native](getting-started/react-native.md)
* [Xamarin](getting-started/xamarin.md)

## Minimum Supported Versions

The tables below show the minimum supported versions of Mobile Center services.

### Android

 Services         | Android   | API Level
 -----------------| ----------| ----------
 Analytics        | 4.0.3 and higher   | >=15
 Crashes          | 4.0.3 and higher    |  >=15
 Distribute       | 4.0.3 and higher    |  >=15

### iOS

 Services         | iOS    | Xcode
 -----------------| -------| ------
 Analytics        | 8.0    | 8.0
 Crashes          | 8.0    | 8.0
 Distribute       | 8.0    | 8.0

## Repo Location

Our SDK is open source and the code is available publicly on GitHub:

* [Android](https://github.com/Microsoft/mobile-center-sdk-android/tree/master)
* [iOS](https://github.com/Microsoft/mobile-center-sdk-ios/tree/master)
* [React Native](https://github.com/Microsoft/MobileCenter-SDK-react-native)
* [Xamarin](https://github.com/Microsoft/mobile-center-sdk-xamarin/tree/master)

Please follow the README file for more information.
