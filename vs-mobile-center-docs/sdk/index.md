---
title: Mobile Center SDK Documentation
description: Using the Mobile Center SDK
keywords: sdk
author: troublemakerben
ms.author: bereimol
ms.date: 04/13/2017
ms.topic: article
ms.assetid: 278e0ad2-1616-4a3c-907a-092b57c81e96
ms.service: mobile-center
ms.custom: sdk
---

1. [Mobile Center](#1-mobile-center)
2. [Get started](#2-get-started)
3. [Requirements](#3-requirements)
4. [Source code](#4-source-code)

# 1. Mobile Center

Mobile Center is mission control for mobile apps.
Get faster release cycles, higher-quality apps, and the insights to build what users want.

The Mobile Center SDK use a modular architecture so you can use any or all of the services below. To learn more about how each service works for your platform, check out the in-depth documentation. 

## 1.1 Mobile Center Analytics

Mobile Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count, device properties like model, OS version, etc. You can define your own custom events to measure things that matter to your business. All the information captured is available in the Mobile Center portal for you to analyze the data.

## 1.2 Mobile Center Crashes

Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash log will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store or Google Play. Crash logs contain valuable information for you to help fix the crash.

## 1.3 Mobile Center Distribute

The Mobile Center SDK will let your users install a new version of the app when you distribute it via Mobile Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the update. Once they chose to update, the SDK starts to update your application. This feature will NOT work if your app is deployed to the app store, if you are developing locally or if the app is running with the DEBUG configuration.

# 2. Get started

* [Mobile Center SDK for Android](get-started/android.md)
* [Mobile Center SDK for iOS](get-started/ios.md)
* [Mobile Center SDK for React Native](get-started/react-native.md)
* [Mobile Center SDK for Xamarin and UWP](get-started/xamarin.md)

# 3. Requirements

The tables below show the required minimum supported versions of the different Mobile Center services.

## 3.1 Android

Android Studio 2.2 or later.

 Service         | Android OS Version | API Level
 -----------------|-------------------|-----------
 Analytics        | 4.0.3 and later   | 15 and later
 Crashes          | 4.0.3 and later   | 15 and later
 Distribute       | 4.0.3 and later   | 15 and later

## 3.2 iOS

 Service          | iOS Version     | Xcode
 -----------------|-----------------|-------
 Analytics        | 8.0 or later    | 8.2 and later
 Crashes          | 8.0 or later    | 8.2 and later
 Distribute       | 8.0 or later    | 8.2 and later

## 3.3 Windows UWP

 Service          | Windows Version    | Xcode
 -----------------|--------------------|-------
 Analytics        | 10 build 10240     | Visual Studio 2015 or later
 Crashes          | not available      | not available
 Distribute       | not available      | not available


# 4. Source code

Our SDK are open source and their code is available publicly on GitHub:

* [Mobile Center SDK for Android](https://github.com/Microsoft/mobile-center-sdk-android/tree/master)
* [Mobile Center SDK for iOS](https://github.com/Microsoft/mobile-center-sdk-ios/tree/master)
* [React Native](https://github.com/Microsoft/MobileCenter-SDK-react-native)
* [Mobile Center SDK for UWP and Xamarin](https://github.com/Microsoft/mobile-center-sdk-xamarin/tree/master)