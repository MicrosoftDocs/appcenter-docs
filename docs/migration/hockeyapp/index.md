---
title: "HockeyApp Migration"
description: Migrating from HockeyApp to App Center
author: joemellin
ms.author: joemel
ms.date: 04/11/2018
ms.topic: article
ms.assetid: A5AB2B92-0616-4F41-A0E7-43FD3C778059
ms.service: vs-appcenter
---

# HockeyApp Transition Plan

We're committed to migrating your HockeyApp account with zero hassle. That's why we have created a [transition plan](https://www.hockeyapp.net/mobile-center/transition/) that is transparent, easy-to-understand, and effortless for our users. This process is being rolled-out in two different phases:

## Your HockeyApp apps & data in App Center - Available Today

Transitioning should be low-risk for all HockeyApp users, that's why we've synchronized your existing apps into App Center. This allows you to login to App Center using your HockeyApp credentials and try out all the services App Center offers without affecting your HockeyApp workflow. Your apps are now two places at once with back-and-forward synchronicity. You can continue to use HockeyApp as you would normally. 

To get started, [sign-in](https://appcenter.ms/login?utm_medium=referral_link&utm_source=Hockey%20App) to App Center using your existing HockeyApp credentials.

### Accessing your HockeyApp apps

Once logged in, you'll see a list of all of your existing HockeyApp apps (alongside any existing App Center apps you have already created).

HockeyApp apps that are **iOS** or **Android**, and built using **Native**, **Xamarin**, or **React Native** technologies will be ready-to-use within App Center. We're busy working on expanding to other platforms. Keep an eye on our [Product Roadmap](~/general/roadmap.md) for updates on OS and platform expansion and improvements.

### How to use your apps inside App Center

* Extend your test suite using our brand new cloud based [continuous integration](~/build/index.md) and [automated UI testing](~/test-cloud/index.md) services without affecting your HockeyApp workflow.

* App Center's **Distribute** service works alongside HockeyApp. Upload and distribute your new releases using App Center, all while automatically syncing with your HockeyApp account. [More details here](~/migration/hockeyapp/distribution.md)

* App Center's **Crashes** and **Analytics** services will automatically stream data collected from your existing HockeyApp SDK directly into App Center. Note that the App Center Crash service is currently in preview for HockeyApp apps. You can join the preview on the Crash page in App Center to begin collecting crash data. 
  <!-- Read more about HockeyApp [Crashes](~/migration/hockeyapp/crashes.md) and [Analytics](~/migration/hockeyapp/analytics.md) inside App Center. -->

### Limitations

* During this period, all app management (Collaborators, renaming app, deleting app, etc) will remain in HockeyApp. To easily access the HockeyApp version, click the link in the upper, right-hand corner of the 'Getting Started' page in your app.

## Migrating to App Center

We're still working on the specific timing, but once we're there, you can start officially migrating all of your apps, data, organizations, and users with the click of a button. This will make App Center the official owner of your apps.

This will also be the moment when you can migrate your apps to the new App Center SDK. The App Center SDK is built to be faster and more modular than the HockeySDK. Ship the App Center SDK in a future release, and still receive data from the HockeyApp SDK in App Center from past releases. You’ll have a full year to transition SDKs at your own pace.
