---
title: Mobile Center guidance
description: Guidance to HockeyApp, Xamarin Test Cloud, Xamarin Insights customers
keywords: guidance, hockeyapp, xamarin, test cloud, insights
author: piyushjo
ms.author: piyushjo
ms.date: 03/01/2017
ms.topic: article
ms.assetid: 22747507-d1e1-4bb7-a8fc-2618c5bfc8b8
ms.service: mobile-center
---

# Mobile Center in relation to HockeyApp, Xamarin Test Cloud & Xamarin Insights 
Mobile Center is the next version of HockeyApp and Xamarin Test Cloud. 

It provides a unified suite of capabilities that will greatly benefit a mobile app developer during their continuous delivery process of build, test and distribute to testers, while monitoring the app for crashes and user analytics. It also integrates mobile backend services of Identity and Tables (for storage).  Some of these capabilities are built from ground-up while most others are using existing services like HockeyApp (Distribute & Crashes services) and Xamarin Test Cloud (Test service) under the hood.

Today customers can sign-in to Mobile Center using their existing HockeyApp account. We are also working to get your existing apps and data from HockeyApp moved into Mobile Center, so you don’t have to do any migration. 

Mobile Center is in preview right now and is free to use. We will announce the public pricing later. Our philosophy is to keep the product free for the majority of customers even after after the preview period is over.

Today we recommend you to not use Mobile Center for production use but continue using HockeyApp and Xamarin Test Cloud. If you are evaluating Mobile Center in the same app which is also using HockeyApp SDK be aware of the issues described [here](https://docs.microsoft.com/en-us/mobile-center/sdk/limitations).

If you are a Xamarin Insights customer, we do not have any plans to move your data to Mobile Center. We recommend that you move your production apps to HockeyApp as soon as possible, as HockeyApp will offer a transition path to Mobile Center.

It is also on our roadmap to bring over key features from Xamarin Insights like “managed exceptions” and “user profiles” to Mobile Center.

### Further reading
- [Blog post for HockeyApp customers](https://www.hockeyapp.net/blog/2016/11/16/mobile-center-next-generation-hockeyapp.html)

- [Blog post for Xamarin Test Cloud customers](https://blog.xamarin.com/xamarin-test-cloud-announcements-at-microsoft-connect/)
