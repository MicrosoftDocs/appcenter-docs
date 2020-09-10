---
title: Getting Started with App Center Test
description: How to start using the test service in App Center
keywords: test
author: king-of-spades
ms.author: kegr
ms.date: 01/31/2020
ms.topic: article
ms.assetid: b5759b2a-5a49-4874-85f3-7e13dfc0fe6b
ms.service: vs-appcenter
ms.custom: test
---

# Getting Started with App Center Test

The requisite steps below must be completed before a project can be used with App Center Test .

## 1. Create an App Center account
Create an App Center account at [appcenter.ms](https://appcenter.ms).

## 2. Install the App Center CLI
Test runs are executed using the App Center CLI. If not already installed, follow [these instructions](~/cli/index.md) to install. After installation, run `appcenter login` to link an App Center account with the tool.

## 3. Create an app in App Center
All test assets and operations are within the context of an app. Create the app project to be tested.

## 4. Review the core concepts
Understanding the core concepts of the test service improve ease of use, navigation, and communications with support. It is recommended to become familiar with [these concepts](~/test-cloud/core-concepts.md) before running your first tests.

## 5. Prepare the project for upload
Each test framework has different requirements for uploading to App Center Test. Follow the appropriate test framework instructions:

- [Appium](~/test-cloud/frameworks/appium/index.md)
- [Espresso](~/test-cloud/frameworks/espresso/index.md)
- [XCUITest](~/test-cloud/frameworks/xcuitest/index.md)
- [Xamarin.UITest](~/test-cloud/frameworks/uitest/index.md)
    - [For Xamarin.Android](~/test-cloud/frameworks/uitest/android/index.md)
    - [For Xamarin.iOS](~/test-cloud/frameworks/uitest/ios/index.md)
- [Calabash (Deprecated)](~/test-cloud/frameworks/calabash/index.md)
