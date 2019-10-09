---
title: "HockeyApp Transition"
description: Transition from HockeyApp to App Center
author: derpixeldan
ms.author: daadam
ms.date: 10/09/2019
ms.topic: article
ms.assetid: A5AB2B92-0616-4F41-A0E7-43FD3C778059
ms.service: vs-appcenter
---

# HockeyApp Transition

App Center is built to be the successor of HockeyApp that fills the gap and offers a full continuous integration to delivery lifecycle. A single solution for continuously building, testing, releasing, and monitoring your apps.

The known HockeyApp services, Distribution, Crash Reporting, and Analytics are available in App Center, where they join new services exclusive to App Center: Build, Test, Push Notifications, Auth and Data. We continued to build additional features such as iOS auto-provisioning and public app store integrations. Because HockeyApp’s distribution, crash reporting, and analytics services are available in App Center, HockeyApp will be retired on November 16, 2019.

## November 16, 2019: Farewell, HockeyApp!

Today, all your user and organization accounts are fully transitioned to App Center. If you haven’t moved your apps yet, we will start moving them over automatically, beginning November 16, 2019. Once your app is moved, you’ll no longer have access to it through HockeyApp. You’ll need to use App Center.

It will take us a few months to complete the move of all apps, and we’ll start with apps that have little active usage. If your app is affected by any of the feature gaps listed on our [public repository](https://github.com/Microsoft/appcenter/wiki/Roadmap#hockeyapp), you can expect for your app to be one of the last we move.

## The three stages of the transition

The three stages of the transition are complete.

### Stage 1: Your HockeyApp data in App Center

All your HockeyApp data is synchronized to App Center. That allows you to work in both App Center and HockeyApp with your HockeyApp apps. To get started, simply [sign-in to App Center](https://appcenter.ms/login?utm_medium=referral_link&utm_source=Hockey%20App) using your existing HockeyApp credentials. The settings and user management still needs to be handled on HockeyApp. [Learn more about your HockeyApp data in App Center](~/transition/side-by-side.md).

> [!NOTE]
> Your existing HockeyApp accounts, apps and data are synchronized to App Center. This allows you to [sign-in to App Center](https://appcenter.ms/login?utm_medium=referral_link&utm_source=Hockey%20App) using your HockeyApp credentials.

### Stage 2: Move your apps to App Center

While we synchronize your apps from HockeyApp to App Center, your data is still tied to HockeyApp together with the user management and all the settings. Moving your app will also remove the synchronization with HockeyApp, and give you full control of your apps in App Center. This is also the moment when you can update your apps to use the new App Center SDK. The App Center SDK is built to be faster and more modular than the HockeySDK. Ship the App Center SDK in a future release of the app, and still receive data from the HockeySDK in App Center from past releases.

### Stage 3: Switch the user and account management to App Center

The last stage of the transition has switched the user and accounts management from HockeyApp to App Center. No action is required on your end.