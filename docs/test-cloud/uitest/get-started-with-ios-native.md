---
title: Automate an iOS native app with Xamarin.UITest
description: A guide that shows you how-to automate your iOS Swift or Objective-C app with Xamarin.UITest.
keywords: Xamarin.UITest, iOS, Swift, Obc-c, Objective-C, automated, testing, ui testing.
author: oddj0b
ms.author: vigimm
ms.date: 05/06/2020
ms.topic: get-started-article
ms.assetid: 842394DD-CFDA-4B2D-B4E6-3405ED036369
ms.custom: test
---

# Automate iOS native apps with Xamarin.UITest

To follow the guide, you must have access to the app source code.

## Add an automation backend to your app

Part of the Xamarin.UITest toolchain is the backend that runs alongside the app. The Xamarin.UITest test script communicates with the backend, which executes the commands on the simulator or device.

Because Xamarin.UITest shares backend with Calabash, first step is to [link the calabash.framework by using one of the three recommended method in the docs start](https://github.com/calabash/calabash-ios#step-1-link-calabashframework).

After following the Calabash guide, you should see that a server is running in the Xcode output area, when running the app through Xcode.

You build the `.app` file from the terminal like this: `xcrun xcodebuild build-for-testing -project ProjectFile.xcodeproj -configuration ConfiguratonWithCalabashLinked -sdk iphonesimulator13.4 -scheme SchemeWithCalabashLinked -derivedDataPath DerivedData`

The following switches must match your project:
- `-project`
- `-configuration`
- `-scheme`

## Run your Xamarin.UITest on a simulator

With the Calabash backend setup, the next step is to configure your Xamarin.UITest so that is opens your app on a simulator. [See the Working with Simulators page on how identify simulators](working-with-simulators.md). 

The `.AppBundle()` and `.DeviceIdentifier()` must be configured. You can find the AppBundle in the DerivedData if your app was built using the command from Add an automation backend to your app.

## Run a test

The test will be started from Visual Studio for Mac by selecting Unit Tests in the right side.
