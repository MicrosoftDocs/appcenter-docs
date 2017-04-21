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

# Mobile Center SDK

Mobile Center is mission control for mobile apps.
Get faster release cycles, higher-quality apps, and the insights to build what users want.

## Mobile Center Services

The Mobile Center SDKs use a modular architecture so you can use any or all of the services below. To learn more about how each service works for your platform, check out the in-depth documentation.

### Mobile Center Analytics

Mobile Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count, device properties like model, OS version, etc. You can define your own custom events to measure things that matter to your business. All the information captured is available in the Mobile Center portal for you to analyze the data.

### Mobile Center Crashes

Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash log will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store or Google Play. Crash logs contain valuable information for you to help fix the crash.

### Mobile Center Distribute

The Mobile Center SDK will let your users install a new version of the app when you distribute it via Mobile Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the update. Once they chose to update, the SDK starts to update your application. This feature will NOT work if your app is deployed to the app store.

## Get started

* [Mobile Center SDK for Android](getting-started/android.md)
* [Mobile Center SDK for iOS](getting-started/ios.md)
* [Mobile Center SDK for React Native](getting-started/react-native.md)
* [Mobile Center SDK for Xamarin and UWP](getting-started/xamarin.md)

## Requirements

The tables below show the required minimum supported versions of the different Mobile Center services.

### Android

Android Studio 2.2 or later.

 Service          | Android OS Version | API Level
 -----------------|-------------------|-----------
 Analytics        | 4.0.3 and later   | 15 and later
 Crashes          | 4.0.3 and later   | 15 and later
 Distribute       | 4.0.3 and later   | 15 and later

### iOS

 Service          | iOS Version     | Xcode
 -----------------|-----------------|-------
 Analytics        | 8.0 or later    | 8.2 and later
 Crashes          | 8.0 or later    | 8.2 and later
 Distribute       | 8.0 or later    | 8.2 and later

### Windows UWP

 Service          | Windows Version    | Xcode
 -----------------|--------------------|-------
 Analytics        | 10 build 10240     | Visual Studio 2015 or later
 Crashes          | not available      | not available
 Distribute       | not available      | not available

### React Native

Service   |  RN version   | iOS Version              | Android Version
 ---------|---------------|--------------------------|-------
Analytics | 0.34 or later | 8.0 or later & Cocoapods | 4.0.3/API Level 15 or later
Crashes   | 0.34 or later | 8.0 or later & Cocoapods | 4.0.3/API Level 15 or later


## Source code

The Mobile Center SDKs is open-source and available publicly on GitHub:

* [Mobile Center SDK for Android](https://github.com/Microsoft/mobile-center-sdk-android/tree/master)
* [Mobile Center SDK for iOS](https://github.com/Microsoft/mobile-center-sdk-ios/tree/master)
* [Mobile Center SDK for React Native](https://github.com/Microsoft/MobileCenter-SDK-react-native)
* [Mobile Center SDK for UWP and Xamarin](https://github.com/Microsoft/mobile-center-sdk-xamarin/tree/master)
