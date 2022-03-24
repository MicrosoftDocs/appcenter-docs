---
title: App Center SDK Documentation
description: Using the App Center SDK
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 03/24/2022
ms.topic: article
ms.assetid: 278e0ad2-1616-4a3c-907a-092b57c81e96
---

# App Center SDK

App Center is your continuous integration, delivery and learning solution for iOS, Android, Windows, and macOS apps.
Get faster release cycles, higher-quality apps, and the insights to build what users want.

> [!WARNING]
> Don't embed any of your [API tokens](../api-docs/index.md) into source code.

## App Center Services

The App Center SDKs use a modular architecture so you can use any or all of the services below. To learn more about how each service works for your platform, check out the in-depth documentation.

### App Center Analytics

App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count, device properties like model, OS version, etc. You can define your own custom events to measure things that matter to your business. All the information captured is available in the App Center portal for you to analyze the data.

### App Center Crashes

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash log will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store or Google Play. Crash logs contain valuable information for you to help fix the crash.

### App Center Distribute

The App Center SDK will let your users install a new version of the app when you distribute it via App Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the update. Once they chose to update, the SDK starts to update your application. This feature WON'T work if your app is deployed to the app store.

## Get started

* [App Center SDK for Android](getting-started/android.md)
* [App Center SDK for iOS](getting-started/ios.md)
* [App Center SDK for React Native](getting-started/react-native.md)
* [App Center SDK for Xamarin](getting-started/xamarin.md)
* [App Center SDK for Unity](getting-started/unity.md)
* [App Center SDK for UWP](getting-started/uwp.md)
* [App Center SDK for WPF/WinForms](getting-started/wpf-winforms.md)
* [App Center SDK for macOS](getting-started/macos.md)
* [App Center SDK for tvOS](getting-started/tvos.md)

## Requirements

The tables below show the required minimum supported versions of the different App Center services.

### Android

Android Studio 2.2 or later.

Service          | Android OS Version | API Level
-----------------|--------------------|-------------
Analytics        | 5.0 and later      | 21 and later
Crashes          | 5.0 and later      | 21 and later
Distribute       | 5.0 and later      | 21 and later

### iOS

Service          | iOS Version     | Xcode
-----------------|-----------------|--------------
Analytics        | 9.0 or later    | 11 and later
Crashes          | 9.0 or later    | 11 and later
Distribute       | 9.0 or later    | 11 and later

### Unity

Service    |  Unity version  | iOS Version  | Android Version            | UWP Windows Version
-----------|-----------------|--------------|----------------------------|---------------------
Analytics  | 2018.1 or later | 9.0 or later | 5.0 / API Level 21 or later| 10.0.16299 or later
Crashes    | 2018.1 or later | 9.0 or later | 5.0 / API Level 21 or later| not available
Distribute | 2018.1 or later | 9.0 or later | 5.0 / API Level 21 or later| not available

### Windows UWP

Service          | Windows Version    | Visual Studio
-----------------|--------------------|----------------------------------------
Analytics        | 10 build 16299     | Visual Studio 2017 Update 15.9 or later
Crashes          | 10 build 16299     | Visual Studio 2017 Update 15.9 or later
Distribute       | not available      | not available

### WPF and WinForms

Service          | .NET Framework | .NET Core     | Windows Version | Visual Studio
-----------------|----------------|---------------|-----------------|----------------------------------------
Analytics        | 4.6.1 or later | 3.0 or later  | 10 build 10240  | Visual Studio 2017 Update 15.9 or later
Crashes          | 4.6.1 or later | 3.0 or later  | 10 build 10240  | Visual Studio 2017 Update 15.9 or later
Distribute       | not available  | not available | not available   | not available

.NET Core is supported only when the WPF/WinForms application runs on Windows.

### React Native

Service    |  RN version   | iOS Version              | Android Version
-----------|---------------|--------------------------|----------------------------
Analytics  | 0.34 or later | 9.0 or later & Cocoapods | 5.0 / API Level 21 or later
Crashes    | 0.34 or later | 9.0 or later & Cocoapods | 5.0 / API Level 21 or later
Distribute | 0.34 or later | 9.0 or later & Cocoapods | 5.0 / API Level 21 or later

### macOS

Service          | macOS Version   | Xcode
-----------------|-----------------|--------------
Analytics        | 10.9 or later   | 11 or later
Crashes          | 10.9 or later   | 11 or later

### tvOS

Service          | tvOS Version    | Xcode
-----------------|-----------------|--------------
Analytics        | 11.0 or later   | 11 and later
Crashes          | 11.0 or later   | 11 and later

## Source Code and Release Notes

The App Center SDKs are open-source and available publicly on GitHub:

* [App Center SDK for Android code](https://github.com/Microsoft/AppCenter-SDK-Android) and [release notes](https://github.com/Microsoft/AppCenter-SDK-Android/releases)
* [App Center SDK for iOS and macOS code](https://github.com/Microsoft/AppCenter-SDK-Apple) and [release notes](https://github.com/Microsoft/AppCenter-SDK-Apple/releases)
* [App Center SDK for React Native code](https://github.com/Microsoft/AppCenter-SDK-React-Native) and [release notes](https://github.com/Microsoft/AppCenter-SDK-React-Native/releases)
* [App Center SDK for Windows and Xamarin code](https://github.com/Microsoft/AppCenter-SDK-DotNet) and [release notes](https://github.com/Microsoft/AppCenter-SDK-DotNet/releases)
* [App Center SDK for Unity code](https://github.com/microsoft/appcenter-sdk-unity) and [release notes](https://github.com/microsoft/appcenter-sdk-unity/releases)