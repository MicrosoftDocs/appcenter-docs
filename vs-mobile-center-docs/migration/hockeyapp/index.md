---
title: "HockeyApp Migration"
author: joemellin
ms.author: joemel
ms.date: 04/10/2017
ms.topic: article
ms.assetid: A5AB2B92-0616-4F41-A0E7-43FD3C778059
ms.service: vs-appcenter
---

# HockeyApp Transition Plan

We're committed to migrating your HockeyApp account with zero hassle. That's why we have created a [transition plan](https://www.hockeyapp.net/mobile-center/transition/) that is transparent, easy-to-understand, and effortless for our users. This process is being rolled-out in two different phases:

## Preview your apps & data in App Center - Available Today

Transitioning should be low-risk for all HockeyApp users, that's why we've synchronized your existing apps into App Center. Your apps are now two places at once with back-and-forward synchronicity, so you and your team are always up-to-date.

To get started, [sign-in](https://appcenter.ms/login?utm_medium=referral_link&utm_source=Hockey%20App) to App Center using your existing HockeyApp credentials.

We're starting with HockeyApp Preseason program participants, and will slowly roll-out to more and more of the HockeyApp user base. If you would like to try our preview, please contact support@hockeyapp.net.

### How to join the preview

Go to your HockeyApp dashboard and click on the 'Join' button in the header. This will start the sync and migration process.

> [!NOTE]
> Only app owners will see this banner. If you are a Preseason customer and are missing apps, make sure to tell the owner of your apps to join the program.

### Accessing your HockeyApp apps

Once logged in, you'll see a list of all of your existing HockeyApp apps (alongside any exiting App Center apps you have already created).

HockeyApp apps that are **iOS** or **Android**, and built using **Native**, **Xamarin**, or **React Native** technologies will be ready-to-use within App Center. We're busy working on expanding to other platforms. Keep an eye on our [Product Roadmap](~/general/roadmap.md) for updates on OS and platform expansion and improvements.

### How to use your apps inside App Center

* Extend your test suite using our brand new cloud based [continuous integration](~/build/index.md) and [automated UI testing](~/test-cloud/index.md) services without affecting your HockeyApp workflow.

* App Center's **Distribute** service works alongside HockeyApp. Upload and distribute your new releases using App Center, all while automatically syncing with your HockeyApp account. [More details here](~/migration/hockeyapp/distribution.md)

* App Center's **Crashes** and **Analytics** services will automatically stream data collected from your existing HockeyApp SDK directly into App Center.
<!-- Read more about HockeyApp [Crashes](~/migration/hockeyapp/crashes.md) and [Analytics](~/migration/hockeyapp/analytics.md) inside App Center. -->

### Limitations

* During this Preview period, all app management (Collaborators, renaming app, deleting app, etc) will remain in HockeyApp. To easily access the HockeyApp version, click the link in the upper, right-hand corner of the 'Getting Started' page in your app.

## Transition to App Center - Late 2017

When App Center enters General Availability later this year, you can start officially migrating all of your apps, data, organizations, and users with the click of a button. This will make App Center the official owner of your apps.

This will also be the moment when you can migrate your apps to the new App Center SDK. The App Center SDK is built to be faster and more modular than the HockeySDK. Ship the App Center SDK in a future release, and still receive data from the HockeyApp SDK in App Center from past releases. You’ll have a full year to transition SDKs at your own pace.
