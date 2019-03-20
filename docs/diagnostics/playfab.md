---
title: PlayFab Integration
description: Integrating App Center Diagnostics in PlayFab
keywords: diagnostic, crashes
author: jwhitedev
ms.author: jawh
ms.date: 03/05/2019
ms.topic: article
ms.assetid: 11bf1c34-bca2-4104-9ddc-7b67ae801620
ms.service: vs-appcenter
ms.custom: diagnostics 
---

# PlayFab Integration

 > [!NOTE]
 > PlayFab integration with App Center is currently offered as a preview, and still under active development. If you would like access to the preview, email [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com).

PlayFab users can link their PlayFab titles directly to apps within App Center. Connecting these services brings a complete diagnostics pipeline into PlayFab, exposing App Center crash data. Soon PlayFab player IDs will be attached to crash information, linking crashes to specific players. For example, when a tester reports an issue, developers can look up the crash details in the tester's player profile in the PlayFab portal.

> [!NOTE]
> You must add the [App Center Crash SDK](https://docs.microsoft.com/en-us/appcenter/sdk/) to your app to enable crash collection.

## Getting Started

To get started using App Center Diagnostics in PlayFab, you need to do the following steps:

1. Sign in or create an account at the [PlayFab web portal](https://playfab.com/)
2. Select an existing title, or create a new one, and select **Add-Ons** from the left-hand menu
3. Select App Center from the list then click **Install App Center**

Once you've enabled the plugin, you must then link your apps within App Center and authorize PlayFab to access your App Center data.

1. From the App Center page in Add-Ons, click **Go to App Center**.
2. You'll see a list of all apps you're a manager of. Select one or more apps, or create a new one, that you would like paired to your PlayFab title.
3. From there, click **Connect**, then **Authorize** to pair the apps.

 > [!NOTE]
 > Apps paired to PlayFab titles must be assigned to an Organization. If an app is under a personal account, App Center automatically creates a new Organization and migrates the app to the Org.

### Revoking Access

To revoke PlayFab access to linked App Center apps, use the App Center portal. First, select the Organization the app belongs to and click **Manage**. From there, select the **Integrations** tab. A list of all apps that have granted App Center access will be displayed. To revoke access, click **Edit** button and remove the apps you would no longer like PlayFab to have access to.
