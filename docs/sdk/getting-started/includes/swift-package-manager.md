---
title: Shared docs for Apple Swift Package Manager
description: Shared docs for Apple Swift Package Manager
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 01/04/2021
ms.topic: include
ms.assetid: 12b31177-2d25-4fda-a193-136e84049f90
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---

### 3.3 Integration via Swift Package Manager

1. From the Xcode menu click **File > Swift Packages > Add Package Dependency**.
1. In the dialog that appears, enter the repository URL: https://github.com/microsoft/appcenter-sdk-apple.git.
1. In **Version**, select **Up to Next Major** and take the default option.
1. Choose the modules you need in the **Package Product** column.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

> [!NOTE]
> If you're integrating App Center via SwiftPM and want to use it in your app's extension target as well, make sure that you provide `DISABLE_DIAMOND_PROBLEM_DIAGNOSTIC=YES` in your configuration. This is necessary to avoid SwiftPM limitations in linking a module to multiple targets.
