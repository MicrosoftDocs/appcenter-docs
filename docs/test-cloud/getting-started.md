---
title: Getting Started with App Center Test
description: How to start using the test service in App Center
keywords: test
author: lucen-ms
ms.author: lucen
ms.date: 01/31/2020
ms.topic: article
ms.assetid: b5759b2a-5a49-4874-85f3-7e13dfc0fe6b
ms.service: vs-appcenter
ms.custom: test
---

# Getting Started with App Center Test
[!INCLUDE [Retirement announcement for App Center](../includes/retirement.md)]
These steps must be completed before a project can be used with App Center Test.

## 1. Create an App Center account
Create an App Center account at [appcenter.ms](https://appcenter.ms).

## 2. Install the App Center CLI
Test runs are executed using the App Center CLI. If not already installed, follow [these instructions](~/cli/index.md) to install. After installation, run `appcenter login` to link an App Center account with the tool.

## 3. Create an app in App Center
All test assets and operations are within the context of an app. Create the app project to be tested.

## 4. Review the core concepts
Understanding the core concepts of the test service improve ease of use, navigation, and communications with support. See [Test core concepts](~/test-cloud/core-concepts.md) before running your first tests.

## 5. Make sure your tests run locally on a physical device
App Center Test only uses physical devices for testing, not emulators or simulators. For Android developers, this might not make a difference, since an APK targeting an emulator is usually valid for targeting an equivalent real Android device. 

For iOS developers, however, it can be more challenging:
- Apps built for iOS devices and simulators aren't cross-compatible because of different processor architectures.
- Apps built for iOS devices MUST be provisioned using Apple's signing process. iOS provisioning can be difficult to setup initially, and update later when profiles expire or require modification. 
- Some testing frameworks, like Xamarin.UITest & Calabash, are explicitly incompatible with publishing iOS apps to the App Store. These frameworks add assemblies to the IPA that should only be present during development.
- The first time you test on a physical iOS device, you must **Enable UIAutomation** in the device settings.

Skipping local testing is possible, but not recommended. It's much more difficult to diagnose issues running in App Center if the app has unresolved local testing issues. 

## 6. Prepare the project for upload
Each test framework has different requirements for uploading to App Center Test. Follow the appropriate test framework instructions:

- [Appium](~/test-cloud/frameworks/appium/index.md)
- [Espresso](~/test-cloud/frameworks/espresso/index.md)
- [XCUITest](~/test-cloud/frameworks/xcuitest/index.md)
- [Xamarin.UITest](~/test-cloud/frameworks/uitest/index.md)
    - [For Xamarin.Android](~/test-cloud/frameworks/uitest/android/index.md)
    - [For Xamarin.iOS](~/test-cloud/frameworks/uitest/ios/index.md)
- [Calabash (Deprecated)](~/test-cloud/frameworks/calabash/index.md)
