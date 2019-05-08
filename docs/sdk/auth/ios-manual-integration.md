---
title: App Center Auth for iOS
description: Using Auth in App Center
keywords: sdk, auth
author: amchew
ms.author: achew
ms.date: 02/20/2019
ms.topic: article
ms.assetid: ee09ce87-2661-4503-bc09-7c6b8c2018fe
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:
 - swift
 - objc
---

# App Center Auth manual integration

If you don't want to use Cocoapods, you can integrate the modules by copying the binaries into your project. Follow the steps below:

1. Download the [App Center SDK](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) frameworks provided as a zip file.

2. Unzip the file and you will see a folder called **AppCenter-SDK-Apple/iOS** that contains different frameworks for each App Center service. The framework called `AppCenter` is required in the project as it contains code that is shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party libraries.
   * As a best practice, 3rd-party libraries usually reside inside a subdirectory, often called **Vendor**. If your project isn't organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
   * Create a group called **Vendor** inside your Xcode project to mimic the file structure on disk.

4. Open Finder and copy the unzipped **AppCenter-SDK-Apple/iOS** folder into your project's folder at the location where you want it to reside.

5. Add the SDK framework to the project in Xcode:
   * Make sure the Project Navigator is visible (⌘+1).
   * Now drag and drop **AppCenter.framework** and **AppCenterAuth.framework** from the Finder (the ones inside the **Vendor** folder) into Xcode's Project Navigator. Note that **AppCenter.framework** is required to start the SDK, make sure it is added to your project, otherwise the other modules will not work and your project will not compile successfully.
   * A dialog will appear, make sure your app target is checked. Then click **Finish**.
