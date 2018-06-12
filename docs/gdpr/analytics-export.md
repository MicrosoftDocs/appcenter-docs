---
title: Export Analytics Data 
description: How to export Analytics data for a user
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 05/21/2018 
ms.topic: article 
ms.assetid: D08809D5-4CF5-461C-9F43-3F75986CC376
ms.service: vs-appcenter
---

# Export Analytics Data

## Overview

With App Center, you can export all of your raw Analytics data into Azure Blob Storage using the [continuous export](~/analytics/export.md) feature. You'll export all data from the moment you set up export and backfill data for the last 28 days.

## Set up Analytics data export

To export Analytics data, configure export from your app settings in the App Center portal by following the [App Center Analytics Export documentation](~/analytics/export.md).

You can also use our Export API to do so:

```
POST https://openapi.appcenter.ms/v0.1/apps/{username}/{appname}/export_configurations
```

## Provide a copy of this data to my users

**Prerequisite:** In order to accomplish this scenario, you must have a way to map the App Center install IDs to individual users.

In order to provide a specific user with his/her data, you must go through the exported data and copy the logs with the relevant install ID(s) to a separate file. This new file should contain all exportable data for your end-user; if you have any questions about what data you are required to return be sure to check with appropriate legal counsel.

> [!NOTE]
> We are working on some code samples that will help you filter the exported data for a specific install ID.
