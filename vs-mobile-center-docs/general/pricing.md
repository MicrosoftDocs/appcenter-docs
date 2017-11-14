---
title: App Center Pricing Information
description: Information about Visual Studio App Center pricing plans
keywords: pricing
author: joemellin
ms.author: joemel
ms.date: 11/13/2017
ms.topic: article
ms.assetid: 1f8b1157-0574-4cc7-a278-a9ff5fa67178
ms.service: vs-appcenter
---

# App Center Pricing

Visual Studio App Center offers both a generous free tier as well as paid tier options, paid through an Azure subscription. The free tier includes:

  - Unlimited apps, unlimited orgs, and unlimited teams.
  - Crashes and Analytics completely free 
  - 1 concurrent build pipeline per organization or user account and up to 30 minutes for each build.
  - Push notifications to up to 5 audiences.
  - Unlimited distribution to users, and stores.
  - Unlimited launch tests, and a 30-day free trial for Tests with unlimited device hours.

  You can update the following App Center services as your team grows: 

  - Additional concurrent build pipelines and build minutes

     You can purchase additional build pipeline concurrences with unlimited build hours per month and each build can last up to 60 minutes.

  - Test on real devices 

    For the test service, you pay per device concurrencies. The more device concurrencies you have the more tests you can run in parallel. Once you decide on the number of device concurrencies, you can decide for the limited hours option (30 hours per device per month) or unlimited device hours:
    - Device concurrency with limited hours 
    - Device concurrency with unlimited hours

  - Advanced campaings with Push

    Upgrading to the advanced option, will allow you to choose more than 5 audience groups. Although pricing will not take effect till 2018, you still need to opt-in to this option if you would like to add more than 5 audience groups.

You can see the full breakdown of the pricing on the official [pricing page](https://www.visualstudio.com/app-center/pricing)	

## Customizing your plan

You can configure a plan for either your org, or user settings. If you choose to configure a plan for an org, all apps under this org will get the upgraded services. Otherwise, if you configure for your user account, it will reflect only on apps under your account.

Here's how to get started with billing:

1. From an org go to **Org > Manage > Billing**. If you're buying the services for your user account, click on the user's menu (bottom-left corner) and click on **settings > billing**.
   
   
1. In the billing settings page, click on configure plan.
This view will walk you through purchasing your new plan. By default, the sliders will be set to the free tier. 
You can configure the sliders to add more Builds, Tests or upgrade your push service. 

    - In the Test section, If you would like to choose a concurrent device(s) without device hours limits, click the drop-down and choose **Enterprise usage**. 

    - For push, you have to switch to **Advance** if you are using more than 5 audience groups. You won't be charged for using this until 2018. You still need to opt in to the **Advance** mode to be able to use it.
 
1. After you have customized your plan, click on continue.

    - To connect your org/user to an Azure subscription, jump to this [section](/azure-subscriptions/index.md).

    - Otherwise, if you already have one ore more subscriptions associated to your org/user settings and you can choose which one to use for billing.

1.	If you're happy with the plan selected, click on **Configure**, and wait for the final screen.

## FAQ

- What tier should I choose?

  There's no magical formula to help you choose exactly how many builds or tests for your account, but here's our guidance: 

	- Build: this depends on the branches you have configured, number of users in your app, and number of apps within your org. For example: If you have an org, with 3 apps, maximum of 2 branches each and 5 developers on the team, you might consider starting with 2 build concurrencies to ensure a low queue time and fast development cycle. 

	- Test: Similar to build, this depends on number of apps you have, number of tests per day, average length of your tests and number of devices in your device set. 

  We measure usage in device hours, which is a calculation of all activities on a device initiated by your test. For example, a 12-minute test suite run on 5 device configurations will consume 60 minutes, or 1 device hour. 
	
- What is device concurrency?

  Device concurrency determines the number of devices you can use simultaneously. For example, with 5 concurrent devices you can test 5 different device configurations in the same amount of time it would normally take to test 1.

- What are device hours?

  We measure usage in device hours, which is a calculation of all activities on a device initiated by your test. For example, a 12-minute test suite run on 5 device configurations will consume 60 minutes, or 1 device hour. Time spent downloading apps, processing screenshots, and generating test reports do not count as billable time.

- What happens if I upgrade mid-month?

  They will be charged for only 50% (prorated)

- What happens I delete my org during the month?

  We warn the user about losing their data including billing, if they proceed they still pay for the full month.

- What happens if a paid user's subscription has an issue (credit card expiry)? 

  Azure will notify you via an email notification first. In App Center you will be downgraded the free tier temporarily until youfix their subscription issue. Once it's fixed we will convert you back to your previously selected paid plan.

- Can I downgrade during the month? 

  You can, but it will not take effect until the next calendar month. 

- Can I use my Free Azure subscription or credits from my Dev Essentials subscription?

  No, free Azure Subscriptions or credits from Dev Essentials subscriptions cannot be used to pay for App Center

- Can I use an Azure Subscription with spending limits?

  No, before you can select your subscription you need to turn spending limits off permanently. Learn more here.