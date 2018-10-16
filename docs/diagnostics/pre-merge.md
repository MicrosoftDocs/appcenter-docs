---
title: Updates on App Center Diagnostics are coming soon
description: An introduction to the App Center Diagnostics feature set
keywords: crashes, errors, analytics, attachments, events, key value pairs, export data, threads, bug tracker
author: blparr
ms.author: blparr
ms.date: 10/15/2018
ms.topic: article
ms.assetid: 513252EA-C802-4606-B733-FC0916E64EC5
ms.service: vs-appcenter
ms.custom: diagnostics
---

# Updates on App Center Diagnostics are coming soon

The Diagnostics team has been working hard to provide a better experience. On the one hand, we are releasing some relevant backend improvements, using a new pipeline that will make the App Center Diagnostics service more stable, performant, and scalable. We are also improving the portal experience to help you better prioritize your issues.

We plan to enable the new Diagnostics experience by the end of this month and we want to inform you about these changes in advance.

## How does this affect your data?

Because we want you to enjoy the new improved experience as early as possible, we will be enabling it at the end of this month. Customers who have set retention to 90 days may be surprised to find less than 90 days worth of data for the first few months. This is because as of launch, we will only have processed 28 days worth of data in the new pipeline. If, during this period, you need access to older data please reach out to us via the blue chat button and we will grant you with access. Note that your current retention settings have not been altered and that you still have control over these settings.

## What is different in the new experience?

### More stable backend

We have invested a lot of time and resources on building a more stable, performant and scalable backend to provide a great crash and error reporting service for your apps.

### Merged view for crashes and errors (for Xamarin apps) 
 
By clicking on Diagnostics, you can now see all your crashes and errors in one merged view, making it easier for you to prioritize what issues are more crucial to your apps and compare your analytics for both. Note that you can still access to your crashes and errors separately by using the top left tabs on the Diagnostics overview page. 
Your crashes will be indicated with a lightning icon, while your errors are indicated with a warning icon. 
 
![Merged view for crashes and errors](~/diagnostics/images/merged-view.png) 
 
### New upload symbols experience 
 
We have made some significant changes on how the symbol upload experience works for your apps. 

If there are missing symbols, App Center will notify you in the main Diagnostics page. Upload your missing symbols directly from this page.

![Missing symbols notification](~/diagnostics/images/missing-symbols-notification.png)

To learn more about missing symbols, you can click on a tab on the top left of the Diagnostics page. App Center will display a list of crashes with missing symbols for the different available versions. 

![Crashes with missing symbols](~/diagnostics/images/missing-symbols.png)
 
To ignore the crashes for an old app version, select the crash group and enable the **Ignore version** option. Note that this action cannot be undone and this will ignore these crashes forever.
 
![Ignore all crashes from a version](~/diagnostics/images/ignore-crashes.png)

You can also upload missing symbols for a specific version by clicking on the crash group or by clicking the Upload Symbols on the top right of the page and filter by a specific version.
