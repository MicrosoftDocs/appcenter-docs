---
# required metadata

title: Using Team Services for UI Testing | Mobile Center Test
description: How to get started with UI Testing in VSTS
keywords: test, VSTS, espresso, appium
author: Oddj0b

ms.date: 05/02/2017
ms.topic: article
ms.service: mobile-center

ms.assetid: 225497b6-6f5a-460a-b842-0d43756deaa9 

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
ms.reviewer: vigimm

---

# Using Team Services for UI Testing

With our Mobile Center Test plugin for Visual Studio Team Services (VSTS), you can run your Appium, Espressor and Xamarin.UITest test scripts in Mobile Center Test. You can read more about the the frameworks on the [Supported frameworks](supported-frameworks.md) page.

Each framework will have it's own section of this document where you can read about the basic requirements for setting up a build step definition in VSTS.

## Appium
Before you can start testing using Appium Java, there's prerequisite steps. You'll need the applicatino binary (apk or ipa file), you need to activate your trial for Mobile Center Test, this is done on [Mobile Center](https://mobile.azure.com/) and select Test in the left-hand menu. And you need to prepare your repository, read more [here](preparing-for-upload/appium.md).

### VSTS setup
You start by adding the Mobile Center Test step. Inside the VSTS step definition there is 5 section we'll focus on the first 3, which is _general_, _prepare_ and _run test_. In the general section there's two options, and only information in `Binary Application File Path` is necessary. Insert the path to your app binary (`.apk` or `.ipa`).

Under the Prepare Tests section, first make sure `Prepare Tests` is checked on and that Appium is chosen under `Test Framework`. Insert the path to the Appium test-classes, dependency-jars and `pom.xml`. In most cases all this can be found in a `upload` folder.

If everything is done correctly in the above steps we're ready to run the test on Mobile Center Tests devices. You'll need to configure your test run, you can read about that on the [Starting a test run](starting-a-test-run.md) page.

By now you have your app slug, device selection, system language and test series. The app slug is normally something similiar to `<username>/<appname>` insert that into the `App Slug` field. Your device selection which is a mixture of letters and numbers, is inserted in the `Devices` field. Your test series is a free text which can be anything, normally it starts with Master and you can leave it like that. Lastly we have the system language which is a drop down menu, this is which language the devices running your test is using.

You'll also need to create a Mobile Center connection, you'll need an API token which you can read more about on the [API documentation](../api-docs/index.mdv) page.
 
You're all set and ready to queue up the build.

## Espresso
Before you can start testing using Espresso, there's prerequisite steps. You'll need to built an Android application with the Espresso tests (apk file), you need to activate your trial for Mobile Center Test, this is done on [Mobile Center](https://mobile.azure.com/) and select Test in the left-hand menu. And you need to prepare your repository, read more [here](preparing-for-upload/espresso.md).

### VSTS setup
Inside the VSTS step definition there is 5 section where we'll focus on the first 2, which is general and run test. In the general section there's two options, and we only need to fill the `Binary Application File Path` field with the path to your app binary (`.apk`). Usually this is `<project>/build/outputs/apk`.

If everything is done correctly in the above steps we're ready to run the test on Mobile Center Tests devices. You'll need to configure your test run, you can read about that on the [Starting a test run](starting-a-test-run.md) page.

By now you have your app slug, device selection, system language and test series. The app slug is normally something similiar to `username/appname` fill the `App Slug` with that and your device selection which is a mixture of letters and numbers, this is inserted in the `Devices` field. Your test series is a free text which can be anything, normally it starts with Master and you can leave it like that. Lastly we have the system language which is a drop down menu, this is which language the devices running your test is using.

You'll also need to create a Mobile Center connection, you'll need an API token which you can read more about on the [API documentation](../api-docs/index.mdv) page.
 
You're all set and ready to queue up the build.

## Xamarin.UITest
Before you can start testing using Xamarin.UITest, there's prerequisite steps. You'll need the application binary (apk or ipa file), you need to activate your trial for Mobile Center Test, this is done on [Mobile Center](https://mobile.azure.com/) and select Test in the left-hand menu. And you need to prepare your repository, read more [here](preparing-for-upload/uitest.md).

### VSTS setup
You start by adding the Mobile Center Test step. Inside the VSTS step definition there is 5 section we'll focus on the first 3, which is _general_, _prepare_ and _run test_. In the general section there's two options, and only information in `Binary Application File Path` is necessary. Insert the path to your app binary (`.apk` or `.ipa`).

Under the Prepare Tests section, first make sure `Prepare Tests` is checked on and that UI Test is chosen under `Test Framework`. Your `Build Directory` is normally `<ProjectName>/bin/<configuration>`.

If everything is done correctly in the above steps we're ready to run the test on Mobile Center Tests devices. You'll need to configure your test run, you can read about that on the [Starting a test run](starting-a-test-run.md) page.

By now you have your app slug, device selection, system language and test series. The app slug is normally something similiar to `username/appname` fill the `App Slug` with that and your device selection which is a mixture of letters and numbers, this is inserted in the `Devices` field. Your test series is a free text which can be anything, normally it starts with Master and you can leave it like that. Lastly we have the system language which is a drop down menu, this is which language the devices running your test is using.

You'll also need to create a Mobile Center connection, you'll need an API token which you can read more about on the [API documentation](../api-docs/index.mdv) page.

Happy testing go and queue up that build.
