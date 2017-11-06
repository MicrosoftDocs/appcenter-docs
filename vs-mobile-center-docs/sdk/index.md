---
title: App Center SDK Documentation
description: Using the App Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 10/06/2017
ms.topic: article
ms.assetid: 278e0ad2-1616-4a3c-907a-092b57c81e96
ms.service: vs-appcenter
ms.custom: sdk
---

# App Center SDK

App Center is mission control for mobile apps.
Get faster release cycles, higher-quality apps, and the insights to build what users want.

## App Center Services

The App Center SDKs use a modular architecture so you can use any or all of the services below. To learn more about how each service works for your platform, check out the in-depth documentation.

### App Center Analytics

App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count, device properties like model, OS version, etc. You can define your own custom events to measure things that matter to your business. All the information captured is available in the App Center portal for you to analyze the data.

### App Center Crashes

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash log will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store or Google Play. Crash logs contain valuable information for you to help fix the crash.

### App Center Distribute

The App Center SDK will let your users install a new version of the app when you distribute it via App Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the update. Once they chose to update, the SDK starts to update your application. This feature will NOT work if your app is deployed to the app store.

### App Center Push

App Center Push enables you to send push notifications to users of your app from the App Center portal.

## Get started

* [App Center SDK for Android](getting-started/android.md)
* [App Center SDK for iOS](getting-started/ios.md)
* [App Center SDK for React Native](getting-started/react-native.md)
* [App Center SDK for Xamarin](getting-started/xamarin.md)
* [App Center SDK for UWP](getting-started/uwp.md)

## Requirements

The tables below show the required minimum supported versions of the different App Center services.

### Android

Android Studio 2.2 or later.

 Service          | Android OS Version | API Level
 -----------------|-------------------|-----------
 Analytics        | 4.0.3 and later   | 15 and later
 Crashes          | 4.0.3 and later   | 15 and later
 Distribute       | 4.0.3 and later   | 15 and later
 Push             | 4.0.3 and later   | 15 and later


### iOS

 Service          | iOS Version     | Xcode
 -----------------|-----------------|-------
 Analytics        | 8.0 or later    | 8.2 and later
 Crashes          | 8.0 or later    | 8.2 and later
 Distribute       | 8.0 or later    | 8.2 and later
 Push             | 8.0 or later    | 8.2 and later


### Windows UWP

 Service          | Windows Version    | Visual Studio
 -----------------|--------------------|-------
 Analytics        | 10 build 10240     | Visual Studio 2015 or later
 Crashes          | not available      | not available
 Distribute       | not available      | not available
 Push             | 10 build 10240     | Visual Studio 2015 or later


### React Native

Service    |  RN version   | iOS Version              | Android Version
 ----------|---------------|--------------------------|-------
Analytics  | 0.34 or later | 8.0 or later & Cocoapods | 4.0.3/API Level 15 or later
Crashes    | 0.34 or later | 8.0 or later & Cocoapods | 4.0.3/API Level 15 or later
Distribute | not available | not available            | not available
Push       | 0.34 or later | 8.0 or later & Cocoapods | 4.0.3/API Level 15 or later



## Source code

The App Center SDKs is open-source and available publicly on GitHub:

* [App Center SDK for Android](https://github.com/Microsoft/mobile-center-sdk-android/tree/master)
* [App Center SDK for iOS](https://github.com/Microsoft/mobile-center-sdk-ios/tree/master)
* [App Center SDK for React Native](https://github.com/Microsoft/MobileCenter-SDK-react-native)
* [App Center SDK for UWP and Xamarin](https://github.com/Microsoft/mobile-center-sdk-xamarin/tree/master)
