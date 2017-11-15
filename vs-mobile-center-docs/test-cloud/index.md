---
title: App Center Test
description: Key features of App Center Test Cloud
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 151bd6eb-9238-469a-a598-002849a70798
ms.service: vs-appcenter
ms.custom: test
---

# App Center Test

App Center Test is a test automation service for native and hybrid mobile apps, also known as Test Cloud. Tests written using supported frameworks can be run with little modification on hundreds of unique device model and operating system configurations hosted in a Microsoft data center. Test runs can be initiated using the [App Center Command Line Interface (CLI) tool](~/cli/index.md) or the public [REST API](https://docs.appcenter.ms/api/#/test). Test results, including all associated media assets, are stored in App Center for viewing at any time.

Test runs are executed in a hosted fashion, meaning the necessary assets (typically an app binary and test files) are uploaded to Test Cloud and the test run is executed entirely within our data center environment. Generated assets such as screenshots, video, and device logs are retained for test report viewing.

| Key Features | |
| --- | --- |
| Real devices | Test Cloud uses real mobile devices that are not rooted or jailbroken, providing the best approximation of your users' environment. |
| Screenshots & video | Screenshots are automatically captured and attached to each test step and can be viewed side-by-side for all targeted devices in a test run. Video recording can be enabled for Android test runs. (iOS coming soon) |
| Logs | View the device log for all target devices in a test run and stack traces for failed test steps. |
| Concurrent runs | Run tests on multiple devices simultaneously to speed up time to results. You can learn more about concurrency in the [LINK] core concepts section. |
| Popular framework support | Test Cloud supports the test frameworks that are demonstrated as popular by their adoption in the developer community. Supported frameworks include Appium (Java with JUnit) for Android and iOS, Espresso (Java) for Android, Calabash for Android and iOS, and Xamarin.UITest for Android and iOS. (XCUITest for iOS coming soon) |

Test Cloud does not currently support the following features:
- Manual testing
- Network condition simulation
- Cellular network connections
- VPN
- Load testing

Before getting started, it is recommended to become familiar with Test Cloud's [Core Concepts](~/test-cloud/core-concepts.md).
