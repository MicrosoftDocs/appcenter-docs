---
# required metadata

title: Analytics | Demo App Tutorials
description: Tutorial to help user set up analytics, track custom events and check logflow.
keywords: mobile-center
authors: sshibu
ms.author: t-shshib
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

In this tutorial, you will allow data from your app to show up on the Mobile Center Analytics page.

## Start the SDK
1. Obtain the **App Secret** unique to your app by navigating to the **Settings** page in Mobile Center. Once in **Settings**, find the app secret by following the arrow in the picture below:

  ![Find App Secret](/Users/sherin/Desktop/Screenshots/Screen Shot 2017-06-28 at 6.12.32 PM.jpg)

2. Navigate to the **AppDelegate.swift** file. Go to the `didFinishLaunchingWithOptions` method and insert the following:
```
MSMobileCenter.start("{Your App Secret}", withServices: [
      MSAnalytics.self,
      MSCrashes.self
  ])
```
3. Make sure ``{Your App Secret}`` is consistent with what is shown on the Mobile Center portal.
4. Build and launch your app.

## Adding Custom Events
1. Go to the analytics service in Mobile Center.

## Logflow
