---
title: Testing your latest build on a real device
description: How to test if your app starts on a real device
keywords: test, build, ios, android
author: siminapasat
ms.author: siminap
ms.date: 03/28/2017
ms.topic: article
ms.service: vs-appcenter
ms.assetid: ccc7e62f-90ad-4634-a25b-2e720fb34dff 
ms.custom: build
ms.reviewer: vigimm
---

# Testing on Real Devices

In this document, you'll learn how a successful build can be launched on a real device using App Center Test. Launching your app is very helpful when validating that your latest build is working.

## Configuring your branch

First, the branch needs to be setup before it's ready to run the launch test. You can read more about configuring your branch in the Configure a build respectively for [Android](~/build/android/first-build.md) and [iOS](~/build/ios/first-build.md).

Secondly, you need a subscription to App Center Test before you can enable launch test. If you're a first-time user of App Center Test, there's a free trial so you can see how it works. To activate your free trial, you can use the link below the *Run a launch test on a device* option.

When you have an active subscription it's time to enable testing, all you’ll need to do is to toggle *Run a launch test on a device* option to on and click *Finish setup* button. During the new build, there will be two parts, a build and a test part, so it's normal to have prolonged build time. The benefit is that you know whether your app starts on a physical device.

Finding your launch test result can be done in two ways:

1. When the test is completed the app collaborators will receive an e-mail with test results
2. Go to *Test* in the left-hand menu and follow along in the progress

## Unsupported configurations

When a build is running, the build configuration is composed of several parts: the build definitions you made in the code or in the IDE, and the settings you have chosen in App Center. The way configurations work is platform and language specific. Below are some known configurations where launch test is not supported.

* Some Android configurations can create several APK files. Which makes it unclear to the build service which binary to test. If you disable **Generate one package(.apk) per selected ABI** in your Android Build options, only one APK is created.
* Simulator builds for Xamarin apps don't output a binary and therefore can't be tested. This is the case for both Android and iOS.
* Android apps without Internet permissions cannot be tested using App Center Test. Internet permissions are needed for the test infrastructure to communicate with your app. In order to use launch test for your Android project, make sure to declare internet permissions in your app manifest
* iOS unsigned builds don't generate an `.ipa` file and they can't be tested on a real device.
