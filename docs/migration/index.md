---
title: "Migration"
description: App Center migration guide
author: glennwester
ms.author: glwest
ms.date: 12/06/2019
ms.topic: article
ms.assetid: FDA09DCF-92A4-423C-B18D-FB0A776DF39C
ms.service: vs-appcenter
---

# Migrating Existing Services

App Center is the next generation of HockeyApp and CodePush.

It provides a unified suite of capabilities that will greatly benefit a mobile app developer during their continuous delivery process of build, test and distribute to testers, while monitoring the app for crashes and user analytics. It also integrates mobile backend services of Auth, Data and Push that allows you to manage user identities, partition data according to a user's identity and even send push notifications to audiences, devices or signed-in users.  Some of these capabilities are built from ground-up while most others are using existing services like HockeyApp (Distribute & Crashes services) and Xamarin Test Cloud (Test service) under the hood.

<!-- ## [Microsoft CodePush](~/migration/codepush/index.md) Ian Geoghegan placeholder -->

## [Xamarin Insights](~/migration/xamarin-insights/index.md)

Visual Studio App Center is the next generation of Xamarin Insights, offering similar feature set and performance. After retirement, you must remove the Xamarin Insights SDK from your apps and move to the App Center SDK to ensure continuity.
