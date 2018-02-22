---
title: "Migration"
author: joemellin
ms.author: joemel
ms.date: 04/10/2017
ms.topic: article
ms.assetid: FDA09DCF-92A4-423C-B18D-FB0A776DF39C
ms.service: vs-appcenter 
---

# Migrating Existing Services

App Center is the next generation of HockeyApp, Xamarin Test Cloud, and CodePush.

It provides a unified suite of capabilities that will greatly benefit a mobile app developer during their continuous delivery process of build, test and distribute to testers, while monitoring the app for crashes and user analytics. It also integrates mobile backend services of Identity and Tables (for storage).  Some of these capabilities are built from ground-up while most others are using existing services like HockeyApp (Distribute & Crashes services) and Xamarin Test Cloud (Test service) under the hood.

<!--App Center is in preview right now and is free to use. We will announce the public pricing later. Our philosophy is to keep the product free for the majority of customers even after after the preview period is over.

Today we recommend you to not use App Center for production use but continue using HockeyApp and Xamarin Test Cloud. If you are evaluating App Center in the same app which is also using HockeyApp SDK be aware of the issues described [here](~/sdk/limitations.md).-->

## [HockeyApp](~/migration/hockeyapp/index.md)

Today customers can [sign-in](https://appcenter.ms/login?utm_medium=referral_link&utm_source=Hockey%20App) to App Center using their existing HockeyApp account credentials. We've synchronized your existing HockeyApp apps and data with App Center. This allows you to login to App Center using your HockeyApp credentials and try out all the services App Center offers without affecting your HockeyApp workflow. Your apps are now two places at once with back-and-forward synchronicity. You can continue to use HockeyApp as you would normally. Get the [high-level overview](https://www.hockeyapp.net/mobile-center/about/) on the process or [read the documentation](~/migration/hockeyapp/index.md).

<!-- ## [Microsoft CodePush](~/migration/codepush/index.md) Ian Geoghegan placeholder -->

## [Xamarin Test Cloud](~/migration/test-cloud/index.md)

Microsoft will seamlessly upgrade active paid Xamarin Test Cloud subscriptions to Visual Studio App Center. Visual Studio App Center offers the same devices, performance, and features as Xamarin Test Cloud, plus an upgraded API, unified CLI, and new features like saved device sets. It also integrates our automated test lab with our other App Center services, like cloud-based builds, app distribution, crash reporting, user analytics, and push notifications.

## Xamarin Insights

If you are a Xamarin Insights customer, we do not have any plans to move your data to App Center. We recommend that you move your production apps to HockeyApp as soon as possible, as HockeyApp will offer a transition path to App Center.
