---
title:  Moving from HockeyApp to App Center
description: 
keywords: transition
author: derpixeldan
ms.author: daadam
ms.date: 08/01/2019
ms.topic: article
ms.assetid: e63546cb-7b00-42a4-9931-4b4826151148
ms.service: vs-appcenter
ms.custom: hockeyapp
---

# Moving apps from HockeyApp to App Center

Even though your app data is synchronized to App Center already, it still originates in HockeyApp. The settings and user management can only be handled in HockeyApp. Moving apps will remove the synchronization and give you full control in App Center.

Any HockeyApp app can move to App Center. If the platform doesn't exist yet, we will add support for it soon. In App Center, you'll move an app from HockeyApp to App Center from the App Center App's Overview. Apps can be moved by the owner or the owners of the organization owning the app. If an app was created in HockeyApp is indicated with a little HockeyApp icon behind the app title in the list of apps.

> [!NOTE]
> After you moved an app it still receives data from the HockeySDK in App Center from past releases. In-app updates also remain functional.

Not all features or functionality is supported on App Center in the same way as on HockeyApp. Find out more about the compatibilities and what data is being moved:

* [Incompatibilities](incompatibilities.md)
* [Data being moved](data.md)