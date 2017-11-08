---
title: Supported Test Frameworks
description: List of test frameworks supported by Mobile Center
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 20291348-5cf7-421d-b7d9-7d518551ec57
ms.service: mobile-center
ms.custom: test
---

# Supported Test Frameworks

Test Cloud is a test automation service for native and hybrid mobile applications. Several popular test frameworks are supported and the list of supported frameworks is evaluated continually based on user requests and market popularity. The list below outlines the test frameworks currently supported.

To file a request for a new test framework or vote for an existing request, visit the [feature request portal](https://testcloud.ideas.aha.io).

|Test framework| Vendor |Documentation & resources |
|--|--|--|
| Appium | Open Source | [https://appium.io](https://appium.io) |
| Calabash | Microsoft | [http://calaba.sh](http://calaba.sh) |
| Espresso | Google | [https://google.github.io/android-testing-support-library/docs/espresso/](https://google.github.io/android-testing-support-library/docs/espresso/) |
| Xamarin.UITest | Microsoft | [https://developer.xamarin.com/guides/testcloud/uitest/](https://developer.xamarin.com/guides/testcloud/uitest/)|

> [!NOTE]
> Support for XCUITest is planned for early 2017.

For teams selecting a test framework for the first time, it is recommended to use the framework that is native to the platform.

- Espresso for Android apps
- Xamarin.UITest for Xamarin cross-platform apps
- And, once supported, XCUITest for iOS apps

The outlier to this approach is Appium. Appium may be a good choice for teams with either Appium or Selenium experience or for teams with non-Xamarin apps that desire cross-platform tests. More information is available on the [Appium website](http://appium.io/slate/en/master/#about-appium).
