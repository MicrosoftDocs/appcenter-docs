---
title: App Center Test
description: Key features of App Center Test Cloud
keywords: test cloud
author: king-of-spades
ms.author: kegr
ms.reviewer: kegr
ms.date: 01/31/2020
ms.topic: article
ms.assetid: 151bd6eb-9238-469a-a598-002849a70798
ms.service: vs-appcenter
ms.custom: test
---

# App Center Test

App Center Test is a test automation service for native and hybrid mobile apps, also known as Test Cloud. Tests written using [supported frameworks](https://docs.microsoft.com/appcenter/test-cloud/preparing-for-upload/) can be run on hundreds of unique device models and operating systems which are hosted in our data center. Start test runs using the [App Center Command Line Interface](~/cli/index.md) or the public [REST API](https://openapi.appcenter.ms/#/test). App Center stores test results, including media assets, for viewing for up to six months.

Test runs execute in a hosted fashion: upload the necessary assets, typically an app binary and test files, to execute tests in our data center. Generated assets, such as screenshots and device logs, are kept for test reports.

App Center Test maintains a six-month data retention policy for test report data. All test reports older than six months are removed.

| Key Features | |
| --- | --- |
| Real devices | Test Cloud uses real mobile devices that aren't rooted or jailbroken, providing the best approximation of your users' environment. |
| Screenshots | Screenshots are automatically captured and attached to each test step and can be viewed side by side for all targeted devices in a test run. |
| Logs | View the device log for all target devices in a test run and stack traces for failed test steps. |
| Concurrent runs | Run tests on multiple devices simultaneously to speed up time to results. You can learn more about concurrency in the [Core Concepts](~/test-cloud/core-concepts.md) section. |
| Popular framework support | Test Cloud supports test frameworks demonstrated as popular by their adoption in the developer community: Appium (Java with JUnit) for Android and iOS, Espresso (Java) for Android, Calabash for Android and iOS, Xamarin.UITest for Android and iOS, and XCUITest for iOS. |

Test Cloud doesn't currently support the following features:

- Manual testing
- Network condition simulation
- Cellular network connections
- VPN
- Load testing

Before getting started, it's recommended to become familiar with Test Cloud's [Core Concepts](~/test-cloud/core-concepts.md).
