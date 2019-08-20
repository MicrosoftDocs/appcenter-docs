---
title: HockeyApp Transition FAQ
description: Frequently asked questions about transitioning from HockeyApp to App Center
author: daadam
ms.author: daadam
ms.date: 08/01/2019
ms.topic: article
ms.assetid: 65485D34-735A-4454-BD6D-0D04B9E173F2
ms.service: vs-appcenter
---

# HockeyApp Transition FAQ

## Transition to App Center

#### What do I need to do?

Your HockeyApp account data including your apps is currently already synchronized to App Center. Sign in with your HockeyApp credentials and complete the transition by [moving your apps](https://appcenter.ms/hockeyapp-transition-center) to App Center. That will give you full control and lets you take advantage of all the App Center functionality.

#### All of my HockeyApp apps are in App Center. Does this mean my transition to App Center is complete?

Not until you've moved all of them to App Center and the HockeyApp icon disappeared from the app. Complete the migration and [move your apps](https://appcenter.ms/hockeyapp-transition-center) to App Center.

#### Do I need to change my SDK?

Yes, but not before you've [moved](~/transition/moving/index.md) them to App Center.

#### What happens to data sent by the HockeySDK?

App Center currently receives data from the HockeySDK and continuous to do so after you've moved an app and the shutdown.

#### Will in-app updates continue to work when I've moved my app?

Yes.

#### Why are the crash metrics on App Center different than on HockeyApp?

HockeyApp shows and calculates crashes by the time they were received while App Center is doing it by the time they occurred. Depending on app usage it can take multiple days until crashes are sent by the SDK, hence the discrepancy.

#### Does App Center have feature-parity with HockeyApp?

App Center does not yet have all of HockeyApp's features, but we're getting close. [View our roadmap](https://github.com/Microsoft/appcenter/wiki/Roadmap) to keep track of this progress.

#### Will HockeyApp be shutdown before reaching feature-parity?

No, we'll complete the features on our [roadmap](https://github.com/Microsoft/appcenter/wiki/Roadmap) first.

#### Will the services I use in HockeyApp be free in App Center?

Yes! The services offered by HockeyApp (distribution, crash reporting and analytics) will continue to be free in App Center.

#### When will HockeyApp shutdown?

On November 16, 2019.