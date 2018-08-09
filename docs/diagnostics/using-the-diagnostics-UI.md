---
title: Using the Diagnostics UI
description: help using the Diagnostics UI in App Center
keywords: crashes, errors, annotate, status, download
author: winnieli1208
ms.author: yuli1
ms.date: 08/08/2018
ms.topic: article
ms.assetid: 5c420816-0fe9-4da1-bfaf-bc2a1fb6739b
ms.service: vs-appcenter
ms.custom: analytics 
---

# Using the Diagnostics UI

## General

App Center’s Diagnostics service is designed for you easily monitor your apps health and for you to dive deeper into a crash report to get the information you need to fix the crash.  

1. Login to the App Center Portal
2. Select an application
3. In the navigation area on the left, select Diagnostics

You’ll see a high-level overview of how many crashes and crash free users your app has along with a list of crash groups. Click on a crash group to find more information including a list of specific crash reports, devices and OSs affected.

### Annotate a group

You can annotate your crash groups in App Center diagnostics to keep track of notes and other important information. To leave an annotation:

1. Select the Diagnostics service
2. Select a crash group
3. In the upper right-hand corner, click the annotate button
4. Leave a text in the text box and your note will be automatically saved

![Annotate a crash group](~/diagnostics/images/annotate.png)

### Track the status of your groups

Mark each of your crash groups as open, closed, or ignored. To mark the status of your groups:

1. Select a crash group or select multiple crash groups
2. Click on the **Mark as** button  
3. Select the state (open, closed, ignored)

Any new crash instance which is part of a closed or ignored crash group will not reopen or unignore the corresponding crash group.

![Track the status of your crash and error groups](~/diagnostics/images/track-status.png)

Use the **Filter** option in the upper-right corner of the page to filter crashes by open, closed, and ignored, focusing your view on the data that matters.

### Download Diagnostics Data

You can download your diagnostics data to access raw data for further analysis. To download your diagnostics data:  

1. Navigate to the Diagnostics section
2. Select Crashes or Errors
3. Select on a specific crash group
4. Select a specific crash report
5. In the upper right-hand corner, click on the Download button and select a format (JSON or Text)

![Download diagnostics data](~/diagnostics/images/download.png)
