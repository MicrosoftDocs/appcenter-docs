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

## Supported Configurations
For the most part, you can configure your app however you want; but for App Center device testing it must:
   - Be an [Android](~/build/android/first-build.md) or [iOS](~/build/ios/first-build.md) app
   - Generate an app package compatible with running on physical devices
   - Android apps require Internet permissions for the test infrastructure to communicate with your app. Make sure to declare internet permissions in your app manifest

## Configuring your build
1. Log into https://appcenter.ms
2. Create your app by going to **Add new > Add new app**. More details: [Creating and Managing Apps](~/dashboard/creating-and-managing-apps.md)
3. Name your app, select the target OS of your app, and the platform your app uses.
4. Select the **Build** icon on the left side of the screen, it's a triangle arrow/playbutton.
5. Connect your code repository. More details: [App Center Build Introduction](~/build/index.md).
6. Choose your branch & click either the "Configure button" to create a new configuration or the wrench icon to edit an existing configuration. 
7. Apply your settings & save your configuration. If you close the settings page without saving it will default back to it's previous settings. If you can't save, usually it's because you've selected invalid or incomplete settings for your configuration; so check for warnings on the configuration page.  

## Enable Launch Testing
* Some Android configurations can create several APK files. Which makes it unclear to the build service which binary to test. If you disable **Generate one package(.apk) per selected ABI** in your Android Build options, only one APK is created.

Select the "Test on a real device" switch on the branch configuration page.

The launch test adds a few minutes to your build time since the build waits for the test to complete. The benefit is that you know whether your app starts on a physical device.

Finding your launch test result can be done in a few ways:

- On the results page for each Build, a link to the launch test is displayed.
- Go to **Test** in the left-hand menu, and select **Test Series > Launch-Tests** to view all launch tests for that app. 

