---
# required metadata

title: Testing your latest build on a real device | Mobile Center Build
description: How to test if your app starts on a real device
keywords: test, build, ios, android
author: oddj0b
ms.author: vigimm
ms.date: 03/28/2017
ms.topic: article
ms.service: mobile-center
ms.assetid: ccc7e62f-90ad-4634-a25b-2e720fb34dff 

ms.reviewer: vigimm

---

# Testing on Real Devices
In this document, you'll learn how a successful build can be launched on a real device using Mobile Center Test. Launching your app is very helpful when validating that your latest build is working.

## Configuring your branch
First, off the branch needs to be setup before it's ready to run the launch test. You can read more about configuring your branch in the Configure a build respectively for [Android](android/first-build/index.md) and [iOS](ios/first-build/index.md).

Secondly, you need a subscription to Mobile Center Test before you can enable launch test. If you're a first-time user of Mobile Center Test, there's a free trial so you can see how it works. To activate your free trial, you can use the link below the _Run a launch test on a device_ option.

When you have an active subscription it's time to enable testing, all you’ll need to do is to toggle _Run a launch test on a device_ option to on and click _Finish setup_ button. During the new build, there will be two parts, a build and a test part, so it's normal to have prolonged build time. The benefit is that you know whether your app starts on a physical device. What happens during the extended build is described more detailed in the [FAQ](faq.md#why-do-i-get-an-extended-build-time-when-run-launch-test-on-a-device-is-enabled)

Finding your launch test result can be done in two ways: 

1. When the test is completed the app collaborators will receive an e-mail with test results 
2. Go to _Test_ in the left-hand menu and follow along in the progress

## Unsupported configurations
A configuration is put together of several parts, one part of the branch configurations like described above. Another is the build definitions which are included in the code. Android for example, can contain Gradle which is read and executed by Mobile Center Build. Below are some known configurations that currently don't work with launch test.

* Some Android configurations can create several APK files. Which makes it unclear to the build service which binary to test. This can be done in several ways, one way we've seen is with the option _Generate apk per ABI_ which should be disabled 
* Simulator builds for Xamarin apps, doesn't output a binary and there can't be tested. This is a problem for both iOS and Android
* Android apps needs internet permissions, it's used by Mobile Center Test to communicate with your app. You specify permissions in your manifest, or else Mobile Center Test can't communicate with the app
