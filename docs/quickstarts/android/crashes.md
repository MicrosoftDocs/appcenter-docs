---
# required metadata

title: View Crashes Sent From Android App in App Center
description: Tutorial on viewing crashes from a sample Android app in App Center
keywords: app center
author: sshibu
ms.author: t-shshib
ms.date: 07/28/2017
ms.topic: article
ms.service: vs-appcenter
ms.assetid: 9e2c6890-26e9-4b8a-a4fb-f43c8e55c1fb

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]
---

# View Crashes Sent From Android App in App Center
If you have not already, follow the [getting started tutorial](getting-started.md) to set up the sample app.

## Crashing the sample app
1. Navigate to the app repository in your local machine and open the app module in Android Studio.

2. Click **Run > Run 'app'** from the toolbar. Create a new virtual device of your choice if one is not available to you already, select it, and open the app in the Android Emulator.

3. Swipe over to the **Crashes** page. Tap the **Send a sample crash** button to crash the app.

4. **Reopen the app.** This sends the crash report to the App Center backend.  


## View the crashes in App Center
1. Navigate to the **Crashes** service in App Center. It may take a couple minutes for the crash report to show up after reopening the app.

2. Click on the crash to view its details, such as its stack trace, affected devices, and more.
