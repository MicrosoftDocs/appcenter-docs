---
# required metadata

title: Distribute | Sample App Tutorials
description: Tutorial to distribute a sample iOS app to a group in Mobile Center.
keywords: mobile-center
authors: sabrinaj206
ms.author: t-sajia
ms.date: 06/27/2017
ms.topic: article
ms.service: mobile-center
ms.custom:
ms.prod: .net-core
ms.assetid: e4c351f6-0284-4747-a682-3e0773d3cfe1

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---

# Distribute
In this tutorial, you will learn to distribute a sample iOS app to yourself, then install and use the app on your device.

If you have not already, first follow the [getting started tutorial](/getting-started.md) to set up the sample app.


### Prerequisites
- Code signed (optional)

## Create a distribution group
1. Navigate to the **Distribute** service on the Mobile Center portal.
2. Click **New Group** at the top of the page.
3. Name the group **Beta Testers** and add your email in the invitation box below.
4. Press **Create Group**.

## Distribute the sample app
There are **two ways you can distribute** the app.

If you already completed the [Build tutorial](/build.md) and built the sample app:
1. Navigate to the **Build** tab in the portal.
2. Select the **master** branch.
3. Click on the latest successful build. **The build must be signed.**
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
