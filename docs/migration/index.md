---
title: Migration
description: App Center migration guide
author: king-of-spades
ms.author: kegr
ms.date: 02/20/2020
ms.topic: article
ms.assetid: FDA09DCF-92A4-423C-B18D-FB0A776DF39C
ms.service: vs-appcenter
---

# Migrating Existing Services
App Center is the next generation of HockeyApp and CodePush.

It provides a unified suite of capabilities that will greatly benefit a mobile app developer during their continuous delivery process of building, testing and distributing to testers, while monitoring the app for crashes and user analytics. Some of these capabilities are built from ground-up while most others are using existing services like HockeyApp (Distribute & Crashes services) and Xamarin Test Cloud (Test service) under the hood.

## [HockeyApp](~/transition/index.md)
HockeyApp has been retired and all apps have been migrated to App Center.

## [App Center Push](~/migration/push/index.md)

App Center Push has been retired, and you must remove the App Center Push SDK from your apps and move to [Notification Hubs](https://docs.microsoft.com/azure/notification-hubs/). Learn more about [App Center's mobile backend retirement](https://devblogs.microsoft.com/appcenter/app-center-mbaas-retirement/).
