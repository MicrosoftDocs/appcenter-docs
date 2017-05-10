---
title: "Migration"
author: ianjanicki
ms.author: iajani
ms.date: 04/10/2017
ms.topic: article
ms.assetid: FDA09DCF-92A4-423C-B18D-FB0A776DF39C
ms.service: mobile-center
---

# Migrating Existing Services

Mobile Center is the next generation of HockeyApp, Xamarin Test Cloud, and CodePush.

It provides a unified suite of capabilities that will greatly benefit a mobile app developer during their continuous delivery process of build, test and distribute to testers, while monitoring the app for crashes and user analytics. It also integrates mobile backend services of Identity and Tables (for storage).  Some of these capabilities are built from ground-up while most others are using existing services like HockeyApp (Distribute & Crashes services) and Xamarin Test Cloud (Test service) under the hood.

Mobile Center is in preview right now and is free to use. We will announce the public pricing later. Our philosophy is to keep the product free for the majority of customers even after after the preview period is over.

Today we recommend you to not use Mobile Center for production use but continue using HockeyApp and Xamarin Test Cloud. If you are evaluating Mobile Center in the same app which is also using HockeyApp SDK be aware of the issues described [here](https://docs.microsoft.com/en-us/mobile-center/sdk/limitations).

## [HockeyApp](~/migration/hockeyapp/index.md)

Today customers can [sign-in](https://mobile.azure.com/login?utm_medium=referral_link&utm_source=Hockey%20App) to Mobile Center using their existing HockeyApp account. We are also working to get your existing apps and data from HockeyApp moved into Mobile Center, so you don’t have to do any migration. Get the [high-level overview](https://www.hockeyapp.net/mobile-center/about/) on the process or [read the documentation](~/migration/hockeyapp/index.md).

## Xamarin Test Cloud

Today, customers can try the new Test experience in Mobile Center. In the next few months, all current Test Cloud customers will have their accounts seamlessly migrated to Mobile Center with no additional work. Coming Summer 2017.

<!-- ## [Microsoft CodePush](~/migration/codepush/index.md) Ian Geoghegan placeholder -->

## Xamarin Insights

If you are a Xamarin Insights customer, we do not have any plans to move your data to Mobile Center. We recommend that you move your production apps to HockeyApp as soon as possible, as HockeyApp will offer a transition path to Mobile Center.
