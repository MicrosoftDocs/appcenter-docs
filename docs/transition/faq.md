---
title: HockeyApp Transition FAQ
description: Frequently asked questions about transitioning from HockeyApp to App Center
author: daadam
ms.author: daadam
ms.date: 11/20/2019
ms.topic: article
ms.assetid: 65485D34-735A-4454-BD6D-0D04B9E173F2
ms.service: vs-appcenter
---

# Frequently asked questions

In the following we collected a list of frequently asked questions for the HockeyApp Transition to App Center. If you are missing anything please [reach out](~/general/support-center.md) to us.

## Migration

### Q: What do I need to do?
A: Your HockeyApp account data including your apps is currently already synchronized to App Center. Sign in with your HockeyApp credentials and complete the transition by [moving your apps](https://appcenter.ms/hockeyapp-transition-center) to App Center. Moving apps will give you full control and lets you take advantage of all the App Center functionality.

### Q: All of my HockeyApp apps are in App Center. Is my transition to App Center complete?
A: Not until you moved all of them to App Center and the HockeyApp icon disappeared from the app. Complete the migration and [move your apps](https://appcenter.ms/hockeyapp-transition-center) to App Center.

### Q: Do I need to change my SDK?
A: Yes, but not before you [moved](~/transition/moving/index.md) your apps to App Center.

### Q: What happens to data sent by the HockeySDK?
A: App Center currently receives data from the HockeySDK and continuous to do so after you have moved an app and the shutdown.

### Q: Does App Center have feature-parity with HockeyApp?
A:App Center does not yet have all of HockeyApp's features, but we are getting close. [View our roadmap](https://github.com/Microsoft/appcenter/wiki/Roadmap) to keep track of this progress.

### Q: How much time does it take to process a migration request?
A: Most requests are handled within 5-10 minutes, however some apps have a large amount of data and sometimes it requires some manual interventions. In those cases it might take a day or two to process the migration request.

### Q: I want to migrate an app but I don't have permission to do so, what can I do?
A: Only the owners of apps have permission to trigger a migration request. If you are not the owner of an app, you have to ask one of the owners to move the app or elevate your access permissions.

### Q: The owner of the app that I want to move has left the company what can I do?
A: Reach out to us via support.

## Crashes

### Q: Why are the crash metrics on App Center different than on HockeyApp?
A: HockeyApp shows and calculates crashes by the time they were received, while App Center shows and calculates by the time they occurred. Depending on app usage it can take multiple days until crashes are sent by the SDK, hence the discrepancy.

## Distribute

### Q: How do we keep our global distribution groups?
A: Before moving your apps, transfer all apps and distribution groups to the same organization on HockeyApp. Distribution groups owned by an organization are similar to HockeyApp distribution groups and can be added to multiple apps.

### Q: I have migrated my app to App Center but I am still using the HockeySDK without authentication, how can I ensure that I can receive the latest release?
A: You need to deploy a release to a public distribution group in App Center.

### Q: I used to use the HockeySDK without authentication, how can I do the same with the App Center SDK?
A: We're currently working on improving this scenario. Until then, it will require to cancel the log-in request to receive the latest release from a public distribution group. On iOS you will see two alerts and you should cancel both.