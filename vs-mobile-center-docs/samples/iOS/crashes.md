---
# required metadata

title: Crashes | Sample App Tutorials
description: Tutorial on viewing crashes from a sample iOS app in Mobile Center
keywords: mobile-center
authors: sabrinaj206
ms.author: t-sajia
ms.date: 06/28/2017
ms.topic: article
ms.service: mobile-center
ms.custom:
ms.prod: .net-core
ms.assetid: c1a3c385-3f62-4a6f-8cd8-661bdb4db795

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---

# Crashes
In this tutorial, you will learn to view crashes from a sample iOS app in Mobile Center.

If you have not already, first follow the [getting started tutorial](/getting-started.md) to set up the sample app.

## Replace the App Secret
In order for the sample app to send information to Mobile Center, the app secret must be changed in XCode.
1. Open the **.xcworkspace**.
2. In **AppDelegate.swift**, edit the **didFinishLaunchingWithOptions** delegate method and replace App Secret.

## Crashing the sample app
1. ??
2. Tap the **crash** button to crash the app.
3. **Reopen the app.** This sends the crash report to the Mobile Center backend.


## View the crashes in Mobile Center
There are **two ways you can distribute** the app.

If you already completed the [Build tutorial](/build.md) and built the sample app:
1. Navigate to the **Build** tab in the portal.
2. Select the **master** branch.
3. Click on the latest successful build. **The build must be signed.** You can learn more [here](https://developer.apple.com/support/certificates/).
4. Click **Distribute** at the top of the page.
5. Select the **Beta Testers** group you just made.
6. Click **Next** and then **Distribute build**.

Alternatively, you can upload a .ipa file from your computer:
1. Navigate to the **Distribute** tab in the portal.
2. Select the **Beta Testers** distribution group you just made.
3. Click **Distribute new release** at the top of the page.
4. Upload your **.ipa** file.
5. Click **Next** and then **Distribute build**.

## Install the sample app
1. You should receive an email with a link to download the sample app.
2. Open the link and follow the instructions to register your device with Mobile Center, and the app will begin installing.
