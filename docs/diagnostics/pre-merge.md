---
title: Updates on App Center Diagnostics
description: Upcoming features
keywords: crashes, errors, analytics, attachments, events, key value pairs, export data, threads, bug tracker
author: lucen-ms
ms.author: lucen
ms.date: 10/30/2018
ms.topic: article
ms.assetid: 513252EA-C802-4606-B733-FC0916E64EC5
ms.service: vs-appcenter
ms.custom: diagnostics
---

# Updates on App Center Diagnostics are coming soon
The Diagnostics team is releasing backend improvements that will make the App Center Diagnostics service more stable, performant, and scalable. We're also improving the portal experience to help you prioritize your issues.

We're enabling the new Diagnostics experience soon and want to inform you about these changes in advance.

## How does this change affect your data?
Because we want you to enjoy the new improved experience as early as possible, we'll be enabling it soon. Customers who have set retention to 90 days may be surprised to find less than 90 days worth of data for the first few months. At launch, we'll have only processed 28 days worth of data in the new pipeline. 

If during this period, you need access to older data contact us via **? > Contact Support** and we'll grant you access. Your current retention settings haven't been altered and that you still have control over these settings.

## What's different in the new experience?
### More stable backend
We're building a more stable, performant, and scalable backend to provide a great crash and error reporting service for your apps.

### Merged view for crashes and errors (for Xamarin and Unity apps) 
By clicking on Diagnostics, you can now see all your crashes and errors in one merged view, making it easier for you to prioritize what issues are most crucial to your apps and compare your analytics for both. You can still access to your crashes and errors separately by using the top left tabs on the Diagnostics overview page. 

Your crashes will be indicated with a lightning icon, while your errors are indicated with a warning icon. 
 
![Merged view for crashes and errors](~/diagnostics/images/merged-view.png) 
 
### New upload symbols experience 
We've made significant changes on how the symbol upload experience works for your apps. 

If there are missing symbols, App Center will notify you in the main Diagnostics page. Upload your missing symbols directly from this page.

![Missing symbols notification](~/diagnostics/images/missing-symbols-notification.png)

To learn more about missing symbols, you can click on a tab on the top left of the Diagnostics page. App Center will display a list of crashes with missing symbols for the different available versions. 

![Crashes with missing symbols](~/diagnostics/images/missing-symbols.png)
 
To ignore the crashes for an old app version, select the crash group and enable the **Ignore version** option. _This action can't be undone and will ignore these crashes forever._
 
![Ignore all crashes from a version](~/diagnostics/images/ignore-crashes.png)

You can also upload missing symbols for a specific version by clicking on the crash group or by clicking the Upload Symbols on the top right of the page and filter by a specific version.
