---
title: "HockeyApp to App Center API migration"
description: Transition from HockeyApp to App Center
author: derpixeldan
ms.author: daadam
ms.date: 08/15/2019
ms.topic: article
ms.assetid: 32b8f487-40ed-4649-93fb-bfddf0538dd8
ms.service: vs-appcenter
---

# API migration

With the shutdown of HockeyApp most APIs will go away and only a subset remains functional. On App Center, only apps that have been moved over from HockeyApp are still able to access those API's. We recommend to upgrade to the App Center API as soon as you've made yourself familiar with them. The following APIs retain functional after you've moved an app to App Center.

## Upload API

Uploading a version via `POST /api/2/apps/APP_ID/app_versions/upload` will still work after you've moved your app. The following parameters will be passed to App Center:

* *ipa* - optional, .ipa for iOS, .app.zip for Mac OS X, or .apk file for Android
* *dsym* - optional, .dSYM.zip file (iOS and OS X) or mapping.txt (Android); note that the extension has to be .dsym.zip (case-insensitive) for iOS and OS X and the file name has to be mapping.txt for Android
* *notes* - optional, release notes as Markdown
* *notify* - optional, notify testers:
    * `0` - Don't notify testers
    * `1` - Notify all testers that can install this app
    * `2` - Notify all testers
* *status* - optional, download status:
    * 1: Don't allow users to download or install the version
    * 2: Available for download or installation
* *teams* - optional, a comma-separated list of names
* *users* - optional, a comma-separated list of names
* *mandatory* - optional, set version as mandatory
    * `0` - no
    * `1` - yes

## SDK

API's used by the HockeySDK such as for uploading crash logs or retrieving versions for in-app updates remain functional. That way your legacy versions with the HockeySDK integrated will still deliver data to App Center also after the shutdown of HockeyApp.