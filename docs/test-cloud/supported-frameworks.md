---
title: Supported Test Frameworks
description: List of test frameworks supported by App Center
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 11/28/2018
ms.topic: article
ms.assetid: 20291348-5cf7-421d-b7d9-7d518551ec57
ms.service: vs-appcenter
ms.custom: test
---

# Supported Test Frameworks

App Center Test is a test automation service for native and hybrid mobile applications. Several popular test frameworks are supported and the list of supported frameworks is evaluated continually based on user requests and market popularity. The list below outlines the test frameworks currently supported.



| Test framework | Vendor      | Documentation & resources                |
| -------------- | ----------- | ---------------------------------------- |
| Appium         | Open Source | [https://appium.io](https://appium.io)   |
| Calabash       | Microsoft   | [http://calaba.sh](http://calaba.sh)     |
| Espresso       | Google      | [https://developer.android.com/training/testing/espresso/](https://developer.android.com/training/testing/espresso/) |
| Xamarin.UITest | Microsoft   | [UITest](~/test-cloud/uitest/index.md) |
| XCUITest       | Apple       | [Testing with Xcode - User Interface Testing](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html) |

For teams selecting a test framework for the first time, it is recommended to use the framework that is native to the platform.

- Espresso for Android apps
- Xamarin.UITest for Xamarin cross-platform apps
- XCUITest for iOS apps

The outlier to this approach is Appium. Appium may be a good choice for teams with either Appium or Selenium experience or for teams with non-Xamarin apps that desire cross-platform tests. More information is available on the [Appium website](http://appium.io).
