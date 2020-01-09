---
title: Getting Started with App Center Test
description: How to start using the test service in App Center
keywords: test
author: glennwester
ms.author: glwest
ms.date: 08/08/2018
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

- [Appium](~/test-cloud/appium/preparing-for-upload.md)
- [Espresso](~/test-cloud/espresso/preparing-for-upload.md)
- [XCUITest](~/test-cloud/xcuitest/preparing-for-upload.md)
- [Xamarin.UITest](~/test-cloud/uitest/index.md)
    - [For Xamarin.Android](~/test-cloud/uitest/xamarin-android-uitest.md)
    - [For Xamarin.iOS](~/test-cloud/uitest/xamarin-ios-uitest.md)
- [Calabash (Depreciated)](~/test-cloud/calabash/preparing-for-upload.md)