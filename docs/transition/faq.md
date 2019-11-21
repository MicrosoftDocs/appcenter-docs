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

In the following, we collected a list of frequently asked questions for the HockeyApp Transition to App Center. If you are missing anything, please [reach out](~/general/support-center.md) to us.

## Migration

### What do I need to do?
Your HockeyApp account data including your apps is currently already synchronized to App Center. Sign in with your HockeyApp credentials and complete the transition by [moving your apps](https://appcenter.ms/hockeyapp-transition-center) to App Center. Moving apps will give you full control and lets you take advantage of all the App Center functionality.

### All of my HockeyApp apps are in App Center. Is my transition to App Center complete?
Not until you moved all of them to App Center and the HockeyApp icon disappeared from the app. Complete the migration and [move your apps](https://appcenter.ms/hockeyapp-transition-center) to App Center.

### Do I need to change my SDK?
Yes, but not before you [moved](~/transition/moving/index.md) your apps to App Center.

### What happens to data sent by the HockeySDK?
App Center currently receives data from the HockeySDK and continuous to do so after you have moved an app and the shutdown.

### Does App Center have feature-parity with HockeyApp?
App Center does not yet have all of HockeyApp's features, but we are getting close. [View our roadmap](https://github.com/Microsoft/appcenter/wiki/Roadmap) to keep track of this progress.

### How much time does it take to process a migration request?
Most requests are handled within 5-10 minutes, however some apps have a large amount of data and sometimes it requires some manual interventions. In those cases it might take a day or two to process the migration request.

### I want to migrate an app but I don't have permission to do so, what can I do?
Only the owners of apps have permission to trigger a migration request. If you are not the owner of an app, you have to ask one of the owners to move the app or elevate your access permissions.

### The owner of the app that I want to move has left the company what can I do?
Reach out to us via support.

## Crashes

### Why are the crash metrics on App Center different than on HockeyApp?
HockeyApp shows and calculates crashes by the time they were received, while App Center shows and calculates by the time they occurred. Depending on app usage it can take multiple days until crashes are sent by the SDK, hence the discrepancy.

## Distribute

### How do we keep our global distribution groups?
Before moving your apps, transfer all apps and distribution groups to the same organization in HockeyApp. Shared distribution groups in App Center are similar to HockeyApp distribution groups and can be added to multiple apps.

### My app uses the HockeySDK without authentication in App Center, how can I ensure in-app updates are working?
Releases added to a public distribution group in App Center are available to apps using in-app updates without authentication.

### I use the HockeySDK without authentication, how can I do the same with the App Center SDK?
We're currently working on improving this scenario. Until then, it will require to cancel the log-in request to receive the latest release from a public distribution group. On iOS, you will see two alerts and you should cancel both.