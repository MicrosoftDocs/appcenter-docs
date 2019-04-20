---
title: "HockeyApp Transition"
description: Transition from HockeyApp to App Center
author: derpixeldan
ms.author: daadam
ms.date: 11/16/2018
ms.topic: article
ms.assetid: A5AB2B92-0616-4F41-A0E7-43FD3C778059
ms.service: vs-appcenter
---

# HockeyApp Transition

We announced in 2017 that HockeyApp features and functionality would move to Visual Studio App Center. A single solution for continuously building, testing, releasing, and monitoring your apps. We’ve spent the last year bringing HockeyApp’s Distribution, Crash Reporting, and Analytics services to App Center, where they join new services exclusive to App Center: Build, Test, and Push Notifications. We continued to build additional features - such as iOS auto-provisioning and public app store integrations - that makes App Center even better than HockeyApp. Because HockeyApp’s distribution, crash reporting, and analytics services are now available in App Center, HockeyApp will be retired on November 16, 2019.

> [!TIP]
> Find a detailed roadmap about the progress and remaining feature gaps in our [public repository on GitHub](https://github.com/Microsoft/appcenter/wiki/Roadmap#hockeyapp).

## The three stages of the transition

While stage 1 is completed already, we're currently working on making stage 2 available to you.

### Stage 1: Your HockeyApp data in App Center

All your HockeyApp data is synchronized to App Center. That allows you to work in both App Center and HockeyApp with your HockeyApp apps. To get started, simply [sign-in to App Center](https://appcenter.ms/login?utm_medium=referral_link&utm_source=Hockey%20App) using your existing HockeyApp credentials. The settings and user management still needs to be handled on HockeyApp. [Learn more about your HockeyApp data in App Center](~/transition/side-by-side.md).

> [!NOTE]
> Your existing HockeyApp accounts, apps and data are synchronized to App Center. This allows you to [sign-in to App Center](https://appcenter.ms/login?utm_medium=referral_link&utm_source=Hockey%20App) using your HockeyApp credentials.

### Stage 2: Move your apps to App Center

While we synchronize your apps from HockeyApp to App Center, your data is still tied to HockeyApp together with the user management and all the settings. Starting in early 2019, we will enable you to move apps fully to App Center. Moving your app will also remove the synchronization with HockeyApp, and give you full control of your apps in App Center. This will also be the moment when you can update your apps to use the new App Center SDK. The App Center SDK is built to be faster and more modular than the HockeySDK. Ship the App Center SDK in a future release of the app, and still receive data from the HockeyApp SDK in App Center from past releases. [Follow our roadmap](https://github.com/Microsoft/appcenter/wiki/Roadmap#hockeyapp) for the latest updates.

> [!NOTE]
> Moving apps to App Center will be available in early 2019.

### Stage 3: Move your account to App Center including all apps

The last stage of the transition enables you to move entire accounts. User and organization accounts can be moved including your apps. For organizations, we also move all distribution groups owned by it. Moving your account removes the synchronization with HockeyApp and all the owned apps. All data will be exclusively available in App Center going forward.

## November 16, 2019: Farewell, HockeyApp!

After November 16, 2019, all HockeyApp customers will use the next generation of Distribution, Crash Reporting, and Analytics services in App Center and HockeyApp will no longer be accessible. We’re excited about HockeyApp’s future in App Center, and can’t wait for you to experience all the new features in App Center that will greatly improve your ability to quickly deliver high-quality apps.
