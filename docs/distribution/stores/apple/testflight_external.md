---
title: Publish an iOS package to TestFlight (External Testers)
description: Learn how to release to external testers in TestFlight from App Center
keywords: distribute, stores, testflight, fastlane
author: oddj0b
ms.author: vigimm
ms.date: 01/18/2019
ms.topic: article
ms.assetid: ccc31919-b918-4cf5-8c07-8ab982cf6192
ms.service: vs-appcenter
---

# Publish an iOS package to TestFlight (External Testers)

1. From the Stores home page, select the external group to distribute to.
2. Click on **Publish to Store** in the upper-right corner.
3. At the first step of the wizard, you must upload you .ipa file and after the file have a been successfully uploaded you'll se details like icon and version. Click **Next**.
4. Click on **Publish**. The status for this release on the store details page will show as **Submitted**. Submitted means that the .ipa have been delivered to App Store Connect for evaluation.
5. Once App Center has completed the hand-over of the app to iTunes, the status of the app will change to **Published**. And the app is available to download through Apple's TestFlight service.
6. If a failure occurs with publishing by Apple, the status will change to **Failed** with the appropriate error message.
