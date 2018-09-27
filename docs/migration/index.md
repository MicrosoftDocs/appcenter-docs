---
title: "Migration"
description: App Center migration guide
author: glennwester
ms.author: glwest
ms.date: 08/08/2018
ms.topic: article
ms.assetid: FDA09DCF-92A4-423C-B18D-FB0A776DF39C
ms.service: vs-appcenter
---

# Migrating Existing Services

App Center is the next generation of HockeyApp, Xamarin Test Cloud, and CodePush.

It provides a unified suite of capabilities that will greatly benefit a mobile app developer during their continuous delivery process of build, test and distribute to testers, while monitoring the app for crashes and user analytics. It also integrates mobile backend services of Identity and Tables (for storage).  Some of these capabilities are built from ground-up while most others are using existing services like HockeyApp (Distribute & Crashes services) and Xamarin Test Cloud (Test service) under the hood.

## [HockeyApp](~/migration/hockeyapp/index.md)

App Center is the new home for the next generation of HockeyApp’s distribution, crash reporting and analytics services. We will, at some point in the future, announce plans to shut down HockeyApp and migrate all customers and their data to App Center. Prior to the announcement and during the subsequent year-long shutdown period, customers will be able to use both HockeyApp and App Center together. 

We've synchronized your existing HockeyApp apps and data with App Center in what we consider our side-by-side experience. This allows you to [sign-in to App Center](https://appcenter.ms/login?utm_medium=referral_link&utm_source=Hockey%20App) today using your HockeyApp credentials, and try out all the new services App Center offers without affecting your HockeyApp workflow. Your apps are now two places at once with back-and-forward synchronization. You can continue to use HockeyApp as you would normally.  Get the [high-level overview](https://www.hockeyapp.net/appcenter/about/) on the process or [read the documentation](~/migration/hockeyapp/index.md). 

<!-- ## [Microsoft CodePush](~/migration/codepush/index.md) Ian Geoghegan placeholder -->

## [Xamarin Test Cloud](~/migration/test-cloud/index.md)

Microsoft has seamlessly upgraded active paid Xamarin Test Cloud subscriptions to Visual Studio App Center. Visual Studio App Center offers the same devices, performance, and features as Xamarin Test Cloud, plus an upgraded API, unified CLI, and new features like saved device sets. It also integrates our automated test lab with our other App Center services, like cloud-based builds, app distribution, crash reporting, user analytics, and push notifications.

## [Xamarin Insights](~/migration/xamarin-insights/index.md)

Visual Studio App Center is the next generation of Xamarin Insights, offering similar feature set and performance. After retirement, you must remove the Xamarin Insights SDK from your apps and move to the App Center SDK to ensure continuity.
