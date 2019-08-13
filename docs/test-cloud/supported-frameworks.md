---
title: Supported Test Frameworks
description: List of test frameworks supported by App Center
keywords: test cloud
author: oddj0b
ms.author: vigimm
ms.date: 08/13/2018
ms.topic: article
ms.assetid: 20291348-5cf7-421d-b7d9-7d518551ec57
ms.service: vs-appcenter
ms.custom: test
---

# Supported Test Frameworks

App Center Test is a test automation service for native and hybrid mobile applications. Several popular test frameworks are supported and the list of supported frameworks is evaluated continually based on user requests and market popularity. The list below outlines the test frameworks currently supported.



| Test framework | Vendor      | Language | Documentation & resources                |
| -------------- | ----------- | ---------|----------------------------------------- |
| [Appium](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fappcenter%2Ftest-cloud%2Fpreparing-for-upload%2Fappium&data=02%7C01%7Cvigimm%40microsoft.com%7Cfcdcf109f6e24c31083408d71cd9cc0f%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637009594079276537&sdata=WIEGc1lsyy%2FrLibPsFzR%2BnlpPMHt1n%2BWriKiMrXVQbU%3D&reserved=0)         | Open Source | Java with JUnit | [https://appium.io](https://appium.io)   |
| Calabash       | Microsoft   | Ruby with Cucumber | [https://calaba.sh](https://calaba.sh)     |
| [Espresso](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fappcenter%2Ftest-cloud%2Fpreparing-for-upload%2Fespresso&data=02%7C01%7Cvigimm%40microsoft.com%7Cfcdcf109f6e24c31083408d71cd9cc0f%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637009594079296531&sdata=Mj2lHQXBWDBswx7zkeBBoXHFacb06mW9PlgoJ9wR2Y4%3D&reserved=0)       | Google      | Java or Kotlin | [https://developer.android.com/training/testing/espresso/](https://developer.android.com/training/testing/espresso/) |
| Xamarin.UITest ([iOS](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fappcenter%2Ftest-cloud%2Fpreparing-for-upload%2Fxamarin-ios-uitest&data=02%7C01%7Cvigimm%40microsoft.com%7Cfcdcf109f6e24c31083408d71cd9cc0f%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637009594079306526&sdata=2hBgx8R23FxdY2GYaplMbx4J7q03eAPzn81aCVia%2F8g%3D&reserved=0) [Android](https://docs.microsoft.com/en-gb/appcenter/test-cloud/preparing-for-upload/xamarin-android-uitest) | Microsoft   | C# or F# with NUnit | [UITest](~/test-cloud/uitest/index.md)) |
| [XCUITest](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fappcenter%2Ftest-cloud%2Fpreparing-for-upload%2Fxcuitest&data=02%7C01%7Cvigimm%40microsoft.com%7Cfcdcf109f6e24c31083408d71cd9cc0f%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637009594079316523&sdata=1VedcoIIQK9PMaq1sv6kg18tobJ%2BziVxi9a1uMucqcw%3D&reserved=0)       | Apple       | Swift or Objective-C | [Testing with Xcode - User Interface Testing](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html) |

For teams selecting a test framework for the first time, it is recommended to use the framework that is native to the platform.

- Espresso for Android apps
- Xamarin.UITest for Xamarin cross-platform apps
- XCUITest for iOS apps

The outlier to this approach is Appium. Appium may be a good choice for teams with either Appium or Selenium experience or for teams with non-Xamarin apps that desire cross-platform tests. More information is available on the [Appium website](https://appium.io).
