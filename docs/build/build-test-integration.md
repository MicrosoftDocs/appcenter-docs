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

In this document, you'll learn how to integrate App Center Build and [App Center Test](~/test-cloud/index.md) to run your latest successful build on real devices. 

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
> [!WARNING]
> Some Android configurations can create several APK files. Which makes it unclear to the build service which binary to test. If you disable **Generate one package(.apk) per selected ABI** in your Android Build options, only one APK is created.

Select the "Test on a real device" switch on the branch configuration page. The launch test adds a few minutes to your build time since the build waits for the test to complete. The benefit is that you know whether your app starts on a physical device.

Finding your launch test result can be done in a few ways:

- On the results page for each Build, a link to the launch test is displayed.
- Go to **Test** in the left-hand menu, and select **Test Series > Launch-Tests** to view all launch tests for that app. 

App Center Launch Testing doesn't require a trial or paid license for App Center Test, or that you configure any UI tests yourself. For Android apps, the Launch Testing feature automatically handles testing using Xamarin.UITest, while for iOS it uses Appium. 

## Automatically Deploy to App Center Test
You can also integrate Build & Test in order to automatically run a full UI test suite with each build of your app, though there are some additional requirements and limitations to consider compared to Launch Testing:

- A valid Test trial or paid license is required.
- Only UI tests written using Appium (JUnit), Calabash, Espresso, XCUITest or Xamarin.UITest are currently supported. 
- Some testing frameworks require additional setup to enable App Center Test support, including [Appium](~/test-cloud/preparing-for-upload/appium.md), [Espresso](~/test-cloud/preparing-for-upload/espresso.md) & [XCUITest](~/test-cloud/preparing-for-upload/xcuitest.md) 
- You need to use a Post-Build script to handle any tasks your test suite requires that isn't handled by your app build directly. This might include compiling your test dlls & will include a command to upload your test suite to the Test service.
- The Build service doesn't extend it's timeout limit (1 hour) for full UITests, so unless test runs are very short, using the `--async` flag in your upload command is required. Because of this, your Build completion status won't reflect whether the test suite passed or not.

Step-by-step instructions:
1. Configure your app, Build & Test trial or license. (You can ignore the "Launch Test" setting in Build).
2. It's highly recommended to make sure that your test suite runs locally on a physical device, and that you can upload it locally to the Test service before attempting to integrate with Build. 
3. Write your [post-build script](~/build/custom/scripts/index.md#post-build). Optional but highly recommended is to leverage App Center's [environment variables](~/build/custom/variables/index.md) to assist with writing a valid build script.
4. Make sure to manually save your Build configuration in App Center after the first time you add a build script or if you change it's location in your repository. The build script should be located in the main app project's root folder. 
5. Within your build script, make sure to build your test suite if it wasn't already built along with your main app.
6. Also within your build script, provide and execute an upload command for App Center Test that:
- Points to all your Test dependencies, including your test dlls, app package & any other requirements of your test such as included datafiles. 
- Use the `--async` command to make sure your Build doesn't wait for the test suite to complete
- **DO NOT** include any of your app dependencies. These should already be present in your app package, and including them in the upload can cause unpredictable behavior in your test run. 

