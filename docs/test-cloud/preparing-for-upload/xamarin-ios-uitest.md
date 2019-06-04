---
title: Preparing Xamarin.iOS app for testing
description: A step-by-step guide to set up Xamarin.UITest for Xamarin.iOS apps
author: oddj0b
ms.author: vigimm
ms.date: 05/30/2019
ms.topic: article
ms.assetid: D938098B-EA2F-4EC8-BCB2-A79D25B2F964
ms.service: vs-appcenter 
---

# Preparing Xamarin.iOS Apps

The section below provides instructions for preparing Xamarin.UITests for upload to App Center Test. Select your platform to begin.

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

When you surround the initialization code in the **ENABLE_TEST_CLOUD** conditional compile statement, the Xamarin linker will leave the Xamarin Test Cloud Agent in builds that use the **ENABLE_TEST_CLOUD** flag. Normally **Debug** builds but not **Release** builds. New Xamarin.iOS apps created in Visual Studio use this approach.

Once a test suite is prepared, next [setup a test run](~/test-cloud/starting-a-test-run.md) to upload and run your tests.
