---
title: App Center Test
description: Key features of App Center Test Cloud
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 05/18/2018
ms.topic: article
ms.assetid: 151bd6eb-9238-469a-a598-002849a70798
ms.service: vs-appcenter
ms.custom: test
---

# App Center Test

App Center Test is a test automation service for native and hybrid mobile apps, also known as Test Cloud. Tests written using [supported frameworks](https://docs.microsoft.com/en-us/appcenter/test-cloud/preparing-for-upload/) can be run with little modification on hundreds of unique device model and operating system configurations hosted in a Microsoft data center. Initiate test runs using the [App Center Command Line Interface](~/cli/index.md) or the public [REST API](https://openapi.appcenter.ms/#/test). App Center stores test results, including all associated media assets, for viewing at any time.

Test runs execute in a hosted fashion; upload the necessary assets (typically an app binary and test files) to Test Cloud to execute tests within our data center environment. Generated assets, such as screenshots and device logs, are retained for test report viewing.

App Center Test maintains a 6 month data retention policy for test report data. All test reports older than 6 months from present date will be removed.


| Key Features | |
| --- | --- |
| Real devices | Test Cloud uses real mobile devices that are not rooted or jailbroken, providing the best approximation of your users' environment. |
| Screenshots | Screenshots are automatically captured and attached to each test step and can be viewed side-by-side for all targeted devices in a test run. |
| Logs | View the device log for all target devices in a test run and stack traces for failed test steps. |
| Concurrent runs | Run tests on multiple devices simultaneously to speed up time to results. You can learn more about concurrency in the [Core Concepts](~/test-cloud/core-concepts.md) section. |
| Popular framework support | Test Cloud supports the test frameworks that are demonstrated as popular by their adoption in the developer community. Supported frameworks include Appium (Java with JUnit) for Android and iOS, Espresso (Java) for Android, Calabash for Android and iOS, and Xamarin.UITest for Android and iOS. (XCUITest for iOS coming soon) |

Test Cloud does not currently support the following features:
- Manual testing
- Network condition simulation
- Cellular network connections
- VPN
- Load testing

Before getting started, it is recommended to become familiar with Test Cloud's [Core Concepts](~/test-cloud/core-concepts.md).
