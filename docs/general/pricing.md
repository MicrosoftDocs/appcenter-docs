---
title: App Center Pricing
description: Information about Visual Studio App Center pricing plans
keywords: pricing
author: jwhitedev
ms.author: jawh
ms.date: 07/23/2019
ms.topic: article
ms.assetid: 1f8b1157-0574-4cc7-a278-a9ff5fa67178
ms.service: vs-appcenter
---

# App Center Pricing

Visual Studio App Center offers both a generous free tier, and paid tier options billed through an Azure subscription. You can see the full breakdown of the pricing on the official [App Center Pricing](https://www.visualstudio.com/app-center/pricing) page.

## Free services

- General: Unlimited apps, unlimited organizations, and unlimited teams
- Analytics & Diagnostics: All Crashes and Analytics features
- Distribution: Unlimited distribution to users, and stores
- Distribution: Unlimited use of CodePush
- Test: Unlimited launch tests
- Push: Unlimited push Notifications

## The free tier

- Build: 1 build pipeline per organization or user account, 240 build minutes per month, and up to 30 minutes per build
- Test: A 30-day free trial for one device with unlimited device hours

## Build paid tier

- Upgrade your build pipeline with unlimited build minutes and up to 60 minutes per build
- Add additional concurrent build pipelines with unlimited build minutes and up to 60 minutes per build
  
## Test paid tier
  
- Basic tier: pay per concurrent device up to 30 hours per device per month
- Enterprise tier: pay per concurrent device with unlimited hours per device per month

## Azure Subscription Services

- Auth: Using this feature will require an Azure connection with Azure B2C whose pricing is found here: [Azure B2C](https://azure.microsoft.com/pricing/details/active-directory-b2c/).
- Data: Using this feature will require an Azure connection with Azure CosmosDB whose pricing is found here: [Azure CosmosDB](https://azure.microsoft.com/pricing/details/cosmos-db/).

## OneSignal Integration

- Push: App Center has an official partnership with OneSignal to enable users to integrate Push notifications into their applications with advanced targeting and segmentation. Pricing for this service is handled by OneSignal and is available on OneSignal's pricing page; [OneSignal](https://onesignal.com/pricing).

## Configuring your billing plan

Refer to the [App Center Billing](~/general/billing.md) article for information on how to set up and configure your billing plan.

## FAQ

- What tier should I choose?

  - Build: depends on the branches you've configured, number of users in your app, and number of apps within your Org. For example: If you have an org with three apps, a maximum of two branches per app, and five developers on the team, you may consider starting with two concurrent build pipelines to ensure a lower queue time and faster development cycle.

  - Test: depends on the number of apps you have, number of tests per day, average length of your tests, and number of devices in your device set.

- What is a concurrent device?

  Concurrent devices determine the number of devices you can run tests on simultaneously. For example, with five concurrent devices, you can test five different device configurations in the same time it would normally take to test one. Concurrency doesn't limit the number of devices you can run during a test. For example, a test run on five devices with one concurrency will run on one device at a time to completion. Concurrency applies to all apps within an Org or account.

- What are device hours?

  We measure usage in device hours, which is a calculation of all activities on a device started by your test. For example, a 12-minute test suite run on five device configurations will consume 60 minutes or 1 device hour. Time spent downloading apps, processing screenshots, and generating test reports don't count as billable time. Device hours are tracked across all apps in the Org or account. Running a 12-minute test on five iOS and five Android devices would be billed as two device hours toward your monthly total.

- What happens if I upgrade mid-month?

  We'll prorate your bill based on the month remaining.

- What will happen if I delete my org during the month?

  The organization will be removed, but will still be billed for the full month.

- What happens if a paid user's subscription has an issue (credit card expiry)?

  Azure will notify you via an email notification first. In App Center, App Center will downgrade to the free tier temporarily until the subscription issue is fixed. Once fixed, we'll convert you back to your previously selected paid plan.

- Can I downgrade during the month?

  You can, but it won't take effect until the next calendar month.
