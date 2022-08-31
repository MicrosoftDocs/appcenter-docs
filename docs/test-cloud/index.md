---
title: App Center Test
description: Key features of App Center Test
keywords: test cloud
author: lucen-ms
ms.author: lucen
ms.date: 12/07/2020
ms.topic: article
ms.assetid: 151bd6eb-9238-469a-a598-002849a70798
ms.service: vs-appcenter
ms.custom: test
---

# App Center Test
App Center Test (formerly Xamarin Test Cloud) is a test automation service for native and hybrid mobile apps. Tests written using [supported frameworks](/appcenter/test-cloud/preparing-for-upload/) can be run on hundreds of unique device models and operating systems that are hosted in our data center. Start test runs using the [App Center Command Line Interface](~/cli/index.md) or the public [REST API](https://openapi.appcenter.ms/#/test). App Center stores test results, including media assets, for viewing for up to six months.

Test runs execute in a hosted fashion: upload the app binary and test files to execute tests in our data center. Generated assets, such as screenshots and device logs, are kept for test reports.

App Center Test maintains a six-month data retention policy for test report data. All test reports older than six months are removed.

> [!TIP]
> The App Center Test UI only displays the 50 most recent test runs for each Test Series. You can access older test runs using the App Center API.

## Key Features 
- **Real devices** - We use real Android & iOS devices that aren't rooted or jailbroken, providing the best approximation of your users' environment. 
- **Screenshots** - Screenshots are automatically captured for each test step and can be viewed side by side for all devices in a test report. 
- **Logs** - View the device logs in a test run and stack traces for failed test steps.
- **Concurrent runs** - Run tests on multiple devices simultaneously to speed up time to results. You can learn more about concurrency in the [Core Concepts](~/test-cloud/core-concepts.md) section. 
- **Popular framework support** 
   - Appium (Java with JUnit) 
   - Calabash 
   - Espresso (Android only)
   - Xamarin.UITest 
   - XCUITest (iOS only)

App Center Test doesn't currently support the following features:
- Manual testing
- Network condition simulation
- Cellular network connections
- VPN
- Load testing

Before getting started, it's recommended to become familiar with [Test's Core Concepts](~/test-cloud/core-concepts.md).
