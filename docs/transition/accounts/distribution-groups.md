---
title: Shared Distribution Groups from HockeyApp
description: The third stage of the HockeyApp Transition switches the account and user management from HockeyApp to App Center
keywords: transition
author: derpixeldan
ms.author: daadam
ms.date: 10/03/2019
ms.topic: article
ms.assetid: f50173b7-ef2d-4c37-acd7-246a6f27e3e5
ms.service: vs-appcenter
ms.custom: hockeyapp
---

# Shared Distribution Groups from HockeyApp

Distribution groups owned by an organization that were created in HockeyApp can now be managed in App Center. Shared distribution groups for user accounts are not supported in App Center.

> [!NOTE]
> To retain the share functionality of your distribution groups across apps on App Center make sure the distribution groups assigned to an app are owned by the same organization as the app. [Read more](~/transition/moving/incompatibilities.md#distribution-groups) about the limitation.

## Testers
The testers of a HockeyApp distribution group owned by an organization are now managed in App Center.

## Apps
Apps in a distribution group that were moved to or created in App Center can be controlled only in App Center. HockeyApp apps that haven't been moved still need to be controlled in HockeyApp. Move the apps to fully manage them as part of a shared distribution group in App Center.