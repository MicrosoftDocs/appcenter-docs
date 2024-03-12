---
title: Publish an iOS package to TestFlight (Internal Testers)
description: Learn how to release to internal testers in TestFlight from App Center
keywords: distribute, stores, fastlane, testflight
author: lucen-ms
ms.author: lucen
ms.date: 02/10/2020
ms.topic: article
ms.assetid: c6a908c8-6273-4e30-92c0-7c40ccf58aa9
ms.service: vs-appcenter
---

# Publish an iOS package to TestFlight (Internal Testers)

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

> [!TIP]
> [Build your app according to Apples guidelines](https://developer.apple.com/app-store/submissions/)

1. From the Stores home page, select “App Store Connect users”. We only support internal group "App Store Connect Users"
2. Click **Publish to TestFlight** in the upper-right corner.
3. At the first step of the wizard, you must upload you .ipa file. After the file has been successfully uploaded, you'll see details, like icon and version. Click **Next**.
4. Enter release notes. Only plain text is supported and release notes must be longer than 10 characters. Select **Next**.
5. Click **Publish**. The status for this release on the store details page will show as **Submitted**. Submitted means that the .ipa has been delivered to App Store Connect for evaluation.
6. Once App Center has completed the hand-over of the app to App Store Connect, the status of the app  changes to **Published**, and the app is available to download through Apple's TestFlight service.
7. If a failure occurs with publishing by Apple, the status will change to **Failed** with the appropriate error message.
