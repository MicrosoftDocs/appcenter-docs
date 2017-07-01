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

## Get the symbols
In order to process your crashes, you must upload a **symbol file to Mobile Center**. You can download symbols from a build in Mobile Center, or skip this section and use your own.

If you already completed the [Build tutorial](/build.md) and built the sample app:
1. Navigate to the **Build** service in the portal.
2. Select the **master** branch.
3. Click on the latest successful build.
4. Click **Download** at the top of the page and select **Download symbols**.

## Upload symbols
1. Navigate to the **Crashes** service and go to the **Symbols** page.
2. Click **Upload symbols** at the top of the page and upload the symbol file.

## Crashing the sample app
1. Open the sample app.
2. Tap the **crash** button to crash the app.
3. **Reopen the app.** This sends the crash report to the Mobile Center backend.

## View the crashes in Mobile Center
1. Navigate to the **Crashes** service in Mobile Center. After you reopen the app, a crash will show up.
2. Click on the crash to view its details, such as its stack trace, affected devices, and more.
