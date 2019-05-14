---
title: Preparing Xamarin.UITests for Upload
description: How to upload Xamarin.UITests to App Center for Test
keywords: test cloud
author: glennwester
ms.author: glwest
ms.reviewer: crdun
ms.date: 11/02/2018
ms.topic: article
ms.assetid: 10be6410-6661-45df-931d-2737ed369752
ms.service: vs-appcenter
ms.custom: test
---

# Preparing Xamarin.UITests for Upload

The steps necessary to prepare an app and its corresponding test suite for upload
to App Center vary depending on the test framework. The section below provides instructions for preparing Xamarin.UITests for upload to App Center Test.

> [!NOTE]
> Xamarin.UITest requires NUnit 2.6.3 or 2.6.4 to run tests. Xamarin.UITest is not compatible with NUnit 3.x.

## Preparing Xamarin.Android Apps

> [!IMPORTANT]
> Running Xamarin.UITest on Windows requires [setting the ANDROID_HOME environment variable with the path to the Android SDK](https://www.360logica.com/blog/how-to-set-path-environmental-variable-for-sdk-in-windows/)

To prepare a Xamarin.Android app and Xamarin.UITests for submission to App Center for Test:

1. Ensure that the app requests the `INTERNET` permission.
2. Disable **Use Shared Mono Runtime**. The Shared Mono Runtime will prevent Xamarin.UITests from running in App Center for Test.

    In Visual Studio 2017, open the project properties, and select the **Android Options** tab. In the first section, look for **Packaging Properties**, then uncheck the **Use Shared Runtime** checkbox.

    In Visual Studio for Mac, open **Build > Android Build** then select **Project Options**. On the **General** tab, look for **Packaging and Deployment** and uncheck the **Use Shared Mono Runtime** checkbox.

## Preparing Xamarin.iOS Apps

Xamarin.iOS apps must have the Xamarin Test Cloud Agent linked into the app's .ipa file. The Xamarin Test Cloud Agent is a special, embedded HTTP server that allows Xamarin.UITests to interact with the iOS user interface. The Test Cloud Agent is added to the iOS project via NuGet.

> [!TIP]
> Non-Xamarin.iOS apps are also supported by Xamarin.UITest, but instead of the Xamarin Test Cloud Agent require [linking Calabash](https://github.com/calabash/calabash-ios/wiki/Tutorial%3A-How-to-add-Calabash-to-Xcode).

### Visual Studio for Mac

For an iOS project in Visual Studio for Mac, right click on the **Packages** folder, select **Add Package**. Search for **Xamarin Test Cloud Agent**, and click **Add Package**:

![Adding the Xamarin Test Cloud Agent](~/test-cloud/preparing-for-upload/images/05-addpackage-xs.png)

### Visual Studio (Windows)

> [!IMPORTANT]
> Xamarin.UITests for iOS apps cannot be executed locally on Windows. You can still create, compile and upload to App Center Test from Windows.

For an iOS project in Visual Studio for Windows, right click on project and select **Manage NuGet Packages** from the context menu. In the **NuGet Package Manager** Search for **Xamarin Test Cloud Agent** and click **OK** to install that package:

![Adding the Xamarin Test Cloud Agent](~/test-cloud/preparing-for-upload/images/05-addpackage-vs.png)

### Initialize the Xamarin Test Cloud Agent

After adding the Xamarin Test Cloud Agent to the iOS project, you must initialize the Xamarin Test Cloud Agent when the iOS app starts. Edit the **AppDelegate** class and add the following snippet to the `FinishedLaunching` method:

```csharp
#if ENABLE_TEST_CLOUD
Xamarin.Calabash.Start();
#endif
```

> [!WARNING]
> Apple will reject your app if you submit an app that includes the Xamarin Test Cloud Agent. The Xamarin Test Cloud Agent is only supported for apps signed with Development Provisioning Profiles. When submitted to App Center Test, IPAs are automatically re-signed with one of our Development Provisioning Profiles if possible.

When you surround the initialization code in the **ENABLE_TEST_CLOUD** conditional compile statement, the Xamarin linker will leave the Xamarin Test Cloud Agent in builds that use the **ENABLE_TEST_CLOUD** flag; conventionally **Debug** builds but not **Release** builds. New Xamarin.iOS apps created in Visual Studio use this approach.

Once a test suite is prepared, next [setup a test run](~/test-cloud/starting-a-test-run.md) to upload and run your tests.
