---
# required metadata

title: Analytics | Demo App Tutorials
description: Tutorial to help user set up analytics, track custom events and check logflow.
keywords: mobile-center
authors: sabrinaj206 sshibu
ms.author: t-sajia t-shshib
ms.date: 06/26/2017
ms.topic: article
ms.service: mobile-center
ms.custom: samples
ms.prod: .net-core
ms.assetid: 5c001eab-b3da-476e-ba84-2fa7eb6f500f


# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---


# Analytics

We've included custom events in sample app. In this tutorial, you will learn to view those events and other user analytics in Mobile Center.

If you have not already, first follow the [getting started tutorial](/getting-started.md) to set up the sample app.

## Open the app and view user Analytics
1. Open **.xcworkspace** and run the app.
2. Go to the **Analytics** service in [Mobile Center](https://mobile.azure.com/apps).

Once the app is open, you should see at least one user and one session.

## View Custom Events
1. In the sample app, press the buttons. We've included code from the Mobile Center SDK that will specifically track these events. <!--UPDATE-->
2. Navigate to the **Analytics** service in [Mobile Center](https://mobile.azure.com/apps) and go to the **Events** section.

Mobile Center will show which buttons you pressed.
