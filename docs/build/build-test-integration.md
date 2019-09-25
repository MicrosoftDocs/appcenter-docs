---
title: Testing Builds on Real Devices
description: Instructions for how to launch your most recent build on a physical device to make sure it works
keywords: test, build, ios, android
author: siminapasat
ms.author: siminap
ms.date: 09/25/2019
ms.topic: article
ms.service: vs-appcenter
ms.assetid: ccc7e62f-90ad-4634-a25b-2e720fb34dff 
ms.custom: build
ms.reviewer: vigimm
---

# Testing Builds on Real Devices

In this document, you'll learn how to integrate App Center Build and App Center Test to run your latest successful build on real devices. 

## Configuring your build for Launch Testing

1. Log into https://appcenter.ms
2. Create your app by going to **Add new > Add new app**. More details: [Creating and Managing Apps](~/dashboard/creating-and-managing-apps.md)
3. Name your app, select the target OS of your app, and the platform your app is written in.
4. Select the **Build** icon on the left side of the screen, it's a triangle arrow/playbutton.
5. Connect your code repository. More details: [App Center Build Introduction](~/build/index.md).
6. Choose your branch & click either the "Configure button" to create a new configuration or the wrench icon to edit an existing configuration. 
7. For the most part, you can configure your app however you want; but at a minimum your build must:
   - Be an [Android](~/build/android/first-build.md) or [iOS](~/build/ios/first-build.md) app.
   - Be a device build.
8. Select the "launch testing" icon.
9. Save & Build your configuration. If you can't save, usually it's because you've selected invalid or incomplete settings for your configuration; so check for warnings on the configuration page.  

During the new build, there will be two parts, a build and a test part, so it's normal to have prolonged build time. The benefit is that you know whether your app starts on a physical device.

Finding your launch test result can be done in two ways:

1. When the test is completed the app collaborators will receive an e-mail with test results
2. Go to *Test* in the left-hand menu and follow along in the progress

## Unsupported configurations

When a build is running, the build configuration is composed of several parts: the build definitions you made in the code or in the IDE, and the settings you have chosen in App Center. The way configurations work is platform and language specific. Below are some known configurations where launch test is not supported.

* Some Android configurations can create several APK files. Which makes it unclear to the build service which binary to test. If you disable **Generate one package(.apk) per selected ABI** in your Android Build options, only one APK is created.
* Simulator builds for Xamarin apps don't output a binary executable file, and therefore can't be tested. This is the case for both Android and iOS.
* Android apps without Internet permissions cannot be tested using App Center Test. Internet permissions are needed for the test infrastructure to communicate with your app. In order to use launch test for your Android project, make sure to declare internet permissions in your app manifest
* iOS unsigned builds don't generate an `.ipa` file and they can't be tested on a real device.
