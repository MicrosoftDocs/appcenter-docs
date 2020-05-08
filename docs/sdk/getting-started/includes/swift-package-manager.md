---
title: Shared docs for Apple Swift Package Manager
description: Shared docs for Apple Swift Package Manager
keywords: sdk
author: winnie
ms.author: yuli1
ms.date: 05/07/2020
ms.topic: include
ms.assetid: 12b31177-2d25-4fda-a193-136e84049f90
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---

### 3.3 Integration via Swift Package Manager

> [!NOTE]
> Only the **Analytics** and **Crashes** modules support the use of Swift Package Manager at the moment.

1. From the Xcode menu click **File > Swift Packages > Add Package Dependency**.
1. In the dialog that appears, enter the repository URL: https://github.com/microsoft/appcenter-sdk-apple.git.
1. In **Version**, select **Up to Next Major** and take the default option.
1. Choose **AppCenterAnalytics** and/or **AppCenterCrashes** in the **Package Product** column.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the App Center services.

> [!NOTE]
> If you're integrating App Center via SPM and want to use it in your app's extension target as well, make sure that you provide `DISABLE_DIAMOND_PROBLEM_DIAGNOSTIC=YES` in your configuration. This is necessary to avoid SPM limitations in linking a module to multiple targets.
