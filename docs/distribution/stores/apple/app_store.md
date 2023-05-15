---
title: Publish an iOS package to the App Store (Production)
description: Learn how to release to App Store from App Center
keywords: distribute, stores, fastlane, app store
author: lucen-ms
ms.author: lucen
ms.date: 02/10/2020
ms.topic: article
ms.assetid: ede8ed54-baed-4e9d-be2b-6606e41adaa2
ms.service: vs-appcenter
---

# Publish an iOS package to the App Store (Production)

> [!TIP]
> [Build your app according to Apple's guidelines](https://developer.apple.com/app-store/submissions/)

1. From the Stores home page, select the “Production” store created above.
2. Select **Publish to App Store** in the upper-right corner.
3. At the first step of the wizard, you must upload your .ipa file. After the file has a been successfully uploaded, you'll see details, like icon and version. Select **Next**.
4. Enter release notes. Only plain text is supported and release notes must be longer than 10 characters. Select **Next**.
5. Select **Publish**. The status for this release will show as **Submitted** on the store details page. Submitted means that the .ipa has been delivered to App Store Connect for evaluation.
6. Once App Center has completed the hand-over of the app to App Store Connect, the status of the app changes to **Published**, and the app is available to download through Apple's App Store.
7. If a failure occurs while publishing by Apple, the status on the store details page changes to **Failed** with the appropriate error message. For more information, see [Apple's app review process](https://developer.apple.com/app-store/review/).
