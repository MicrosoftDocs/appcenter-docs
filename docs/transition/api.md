---
title: "HockeyApp to App Center API migration"
description: Transition from HockeyApp to App Center
author: derpixeldan
ms.author: daadam
ms.date: 09/05/2019
ms.topic: article
ms.assetid: 32b8f487-40ed-4649-93fb-bfddf0538dd8
ms.service: vs-appcenter
---

# API migration

With the shutdown of HockeyApp, most APIs will go away and only a subset will remain functional. On App Center, only apps that [have been moved over from HockeyApp](~/transition/moving/index.md) are still able to access the below mentioned APIs. We recommend to upgrade to the [App Center API](~/api-docs/index.md) as soon as you make yourself familiar with them. The following APIs will remain functional after you moved an app to App Center:

## Upload API

Uploading a version via `POST /api/2/apps/APP_ID/app_versions/upload` will still work after you moved your app. The following parameters will be passed to App Center:

> [!NOTE]
> Distribution Groups have to be specified with their names instead of their ID. Tags will cease to work with App Center.

* **ipa** - Required (when no dsym specified), .ipa for iOS, .apk for Android and so on
* **dsym** - Required (when no ipa specified), .dsym.zip (case-insensitive) for iOS/macOS and mapping.txt for Android
* **notes** - Optional, release notes as Markdown
* **notify** - Optional, notify testers:
    * `0` - Don't notify testers
    * `1` - Notify testers of the specified target audience
    * `2` - Notify testers of the specified target audience
* **status** - Optional, download status:
    * 1: Don't allow users to download or install the version
    * 2: Available for download or installation
* **teams** - Optional, a comma-separated list of distribution group names (empty string will release to the "Collaborators" group when no users specified), for example:
    * `"Beta Testers", "Internal"`
* **users** - Optional, a comma-separated list of user IDs, for example:
    * `123, 124`
* **mandatory** - Optional, set version as mandatory
    * `0` - no
    * `1` - yes

## SDK

APIs used by the HockeySDK remain functional. That way, legacy versions with the HockeySDK integrated will still deliver data to App Center. The APIs also remain functional after the shutdown of HockeyApp.