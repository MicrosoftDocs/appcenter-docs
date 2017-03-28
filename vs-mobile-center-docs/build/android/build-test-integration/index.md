---
# required metadata

title: Testing your latest build on a real device | Mobile Center Build
description: How to test if your app starts on a real device
keywords: test, build, ios
author: oddj0b
ms.author: vigimm
ms.date: 03/28/2017
ms.topic: article
ms.service: mobile-center
ms.assetid: ccc7e62f-90ad-4634-a25b-2e720fb34dff 

ms.reviewer: vigimm

---



# Testing on Real Devices

In this document, you'll learn how to run a successful build on a test device using our Test service.

## Before you start

* Configure your branch accordingly to your choice of programming language (Java, Xamarin.iOS etc.)
* Activate a free trial or use your existing subscription

To configure your branch see here [Configure a build](../first-build/index.md).

Before you can start the integration between our Build & Test service, you need a subscription to our Test service. If you're a first-time user of Mobile Center Test, there's a free trial so you can see how it works. To activate your free trial, you can use the link below the _Run a launch test on a device_.

## Start testing

With all the hard work done it's time to enable testing, all you’ll need to do is revisit the branch settings and enabled _Run a launch test on a device_ and apply changes. In the new build, there will be two portions, both a build and a test, so it's normal to have prolonged build time. The benefit is that you know whether your app starts on a physical device.

Finding your test can be done in two ways: 

1. Either you wait for an e-mail with the test result 
2. Go to _Test_ in the left-hand menu and follow along in the progress.

## Known issues

* If your build creates multiple .apks our service doesn't know which binary is the correct

* Simulator builds for Xamarin apps
