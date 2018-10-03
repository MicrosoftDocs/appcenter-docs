---
title: App Center Pricing Information
description: Information about Visual Studio App Center pricing plans
keywords: pricing
author: joemellin
ms.author: joemel
ms.date: 10/03/2018
ms.topic: article
ms.assetid: 1f8b1157-0574-4cc7-a278-a9ff5fa67178
ms.service: vs-appcenter
---

# App Center Pricing

Visual Studio App Center offers both a generous free tier as well as paid tier options, paid through an Azure subscription. 
## The free tier

- Unlimited apps, unlimited organizations, and unlimited teams
- Crashes and Analytics features completely free 
- 1 build pipeline per organization or user account, 240 build minutes per month, and up to 30 minutes per build
- Push notifications to up to 5 audience groups
- Unlimited distribution to users, and stores
- Unlimited use of CodePush
- Unlimited launch tests
- A 30-day free trial for 1 device with unlimited device hours 

## Build paid tier 

- Upgrade your build pipeline with unlimited build minutes and up to 60 minutes per build 
- Add additional concurrent build pipelines with unlimited build minutes and up to 60 minutes per build 
  
## Test paid tier 
  
- Basic tier: pay per concurrent device up to 30 hours per device per month 
- Enterprise tier: pay per concurrent device with unlimited hours per device per month

## Push paid tier 

- Choose more than 5 audience groups 
- Pricing will not take effect until second half of 2018


> You can see the full breakdown of the pricing on the official [pricing page](https://www.visualstudio.com/app-center/pricing)    

## Customizing your plan

You can configure a plan for either your org or your user account. If you configure a plan for an org, all apps under this org will be under the configured plan. If you configure for your user account, all apps under your user account will be under the configured plan.

Here's how to get started with billing:

1. If configuring for your account, click on the user's menu and click on **settings > billing**. If configuring for your org, go to **org > manage > billing**. 
   
2. In the billing settings page, click on **configure plan**.
   This view will walk you through purchasing your new plan. By default, the sliders will be set to the free tier. 
   You can configure the sliders to add more Builds, Tests or upgrade your push service. 

   - To choose the concurrent device(s) without device hours limits, click the drop-down and choose **Enterprise usage**. 

   - To use more than 5 audience groups, click the drop-down and choose **Advance** 
 
3. After you have customized your plan, click on continue.

   - To connect your org/user to an Azure subscription, refer to this document about [Azure Subscriptions](~/general/azure-subscriptions/index.md).

   - If you already have one or more subscriptions associated with your org/user settings and you can choose which one to use for billing.

4. Click on **Configure**, and wait for the final screen.

## FAQ

- What tier should I choose?

  - Build: depends on the branches you have configured, number of users in your app, and number of apps within your Org. For example: If you have an org, with 3 apps, maximum of 2 branches each and 5 developers on the team, you might consider starting with 2 concurrent build pipelines to ensure a low queue time and fast development cycle. 

  - Test: depends on the number of apps you have, number of tests per day, average length of your tests and number of devices in your device set. 

- What is a concurrent device?

  Concurrent devices determine the number of devices you can run tests on simultaneously. For example, with 5 concurrent devices, you can test 5 different device configurations in the same amount of time it would normally take to test 1. Concurrency does not limit the number of devices you can run during a test. For example, a test run on 5 devices with 1 concurrency will run on 1 device at a time to completion. Concurrency applies to all apps within an Org or account.

- What are device hours?

  We measure usage in device hours, which is a calculation of all activities on a device initiated by your test. For example, a 12-minute test suite run on 5 device configurations will consume 60 minutes or 1 device hour. Time spent downloading apps, processing screenshots, and generating test reports do not count as billable time. Device hours are tracked across all apps in the Org or account. Running a 12-minute test on 5 iOS and 5 Android devices would be billed as two device hours toward your monthly total.

- What happens if I upgrade mid-month?

  You will be billed prorated. 

- What happens I delete my org during the month?

  You will lose the data from your org and will still pay for the full month.

- What happens if a paid user's subscription has an issue (credit card expiry)? 

  Azure will notify you via an email notification first. In App Center, you will be downgraded to the free tier temporarily until the subscription issue is fixed. Once it's fixed we will convert you back to your previously selected paid plan.

- Can I downgrade during the month? 

  You can, but it will not take effect until the next calendar month. 

- Can I use my Free Azure subscription or credits from my Dev Essentials subscription?

  No, free Azure Subscriptions or credits from Dev Essentials subscriptions cannot be used to pay for App Center.

- Can I use an Azure Subscription with spending limits?

  No, before you can select your subscription you need to turn spending limits off.
