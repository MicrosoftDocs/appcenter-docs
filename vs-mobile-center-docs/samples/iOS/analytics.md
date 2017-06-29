---
# required metadata

title: Analytics | Demo App Tutorials
description: Tutorial to help user get data from analytics by enabling the SDK.
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
3. Replace ``{Your App Secret}`` with your actual app secret. If you do not wish to use Mobile Center Crashes, you can remove it from the `start:withServices` method above.
4. Save and close the file.
5. Build and launch your app.

## Go to Analytics in Mobile Center
  1. Look for one active user and at least one session.
  2. As you obtain more users, the charts will become more useful.

An example of what the analytics page might look like at a more advanced stage:

![Analytics Page 1 of 2](/Users/sherin/Desktop/Screenshots/Screen Shot 2017-06-28 at 6.53.36 PM.jpg)

![Analytics Page 2 of 2](/Users/sherin/Desktop/Screenshots/Screen Shot 2017-06-28 at 6.54.22 PM.jpg)
