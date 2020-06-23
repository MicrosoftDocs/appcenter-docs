---
title: Working with Xamarin.UITest
description: How to do common tasks when writing and running Xamarin.UITest.
keywords: uitest test cloud
author: oddj0b
ms.author: vigimm
ms.reviewer: crdun
ms.date: 01/31/2019
ms.topic: article
ms.assetid: 4241c097-00ad-4e3b-bc8b-db0134354bdf
ms.service: vs-appcenter
ms.custom: test
---

# Working with Xamarin.UITest
The documents in this section discuss various tasks for writing and running Xamarin.UITests.

## [Android signing](android-signing.md)
Normally the default Xamarin.UITest Android signing, using a generated debug keystore, works fine. But, sometimes you may need to sign your APK and the test server with your actual Android keystore. This guide describes when it may be needed and how to specify your Android keystore information.

## [Backdoors](backdoors.md)
*Backdoors* are methods that can be invoked during a test run to do some special action to configure or set up testing state on a device. For example, a backdoor may be used to seed a database with some test data so that all of the tests in a given fixture have the same data.

## [Categorized Test](categorized-tests.md)
This guide discusses how to categorize your tests, allowing you to run a subset of your entire test suite.

## [Entering Text](entering-text.md)
This guide discusses how to enter text into views and how to clear text from views.

## [Files](files.md)
This guide discusses how to upload files and access them from your tests in App Center Test.

## [Gestures](gestures.md)
Simulate gestures such as taps and swipes in your Xamarin.UITests.

## [REPL](repl.md)
Discusses how to use the REPL to help create Xamarin.UITests.

## [iOS Simulators](ios-simulator.md)
This guide describes how to specify which iOS simulator to use for your local Xamarin.UITests.

## [Timeouts & Waiting](timeouts.md)
This guide will discuss how to use timeouts and waits in Xamarin.UITest.

## [Web Views](webviews.md)
Describes how to use the Xamarin.UITest APIs to interact with web views in a mobile app.