---
title: Supported Test Frameworks
description: List of test frameworks supported by App Center
keywords: test cloud
author: lucen-ms
ms.author: kegr
ms.date: 07/29/2020
ms.topic: article
ms.assetid: 20291348-5cf7-421d-b7d9-7d518551ec57
ms.service: vs-appcenter
ms.custom: test
---

# Supported Test Frameworks

App Center Test is a test automation service for native and hybrid mobile applications. The list below outlines the test frameworks currently supported.

| Test framework | Vendor      | Language | Documentation & resources                |
| -------------- | ----------- | ---------|----------------------------------------- |
| [Appium](~/test-cloud/frameworks/appium/index.md) | Open Source | Java with JUnit | [https://appium.io](https://appium.io) |
| Calabash       | Microsoft   | Ruby with Cucumber | [https://github.com/calabash/calabash-ios](https://github.com/calabash/calabash-ios) |
| [Espresso](~/test-cloud/frameworks/espresso/index.md) | Google | Java or Kotlin | [https://developer.android.com/training/testing/espresso/](https://developer.android.com/training/testing/espresso/) |
| Xamarin.UITest ([iOS](~/test-cloud/frameworks/uitest/ios/index.md), [Android](~/test-cloud/frameworks/uitest/android/index.md)) | Microsoft | C# or F# with NUnit | [UITest](~/test-cloud/frameworks/uitest/index.md) |
| [XCUITest](~/test-cloud/frameworks/xcuitest/index.md) | Apple | Swift or Objective-C | [Testing with Xcode - User Interface Testing](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html) |

For teams selecting a test framework for the first time, it's recommended to use the framework that's native to the platform.

- Espresso for Android apps
- Xamarin.UITest for Xamarin cross-platform apps
- XCUITest for iOS apps

The outlier to this approach is Appium. Appium may be a good choice for teams with either Appium or Selenium experience or for teams with non-Xamarin apps that desire cross-platform tests. More information is available on the [Appium website](https://appium.io).
