---
title: Export Analytics Data 
description: How to export Analytics data for a user
keywords: GDPR, DSR, privacy, EU
author: lucen-ms
ms.author: lucen
ms.date: 07/16/2018 
ms.topic: article 
ms.assetid: D08809D5-4CF5-461C-9F43-3F75986CC376
ms.service: vs-appcenter
---

# Export Analytics Data

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

## Overview
With App Center, you can export all of your raw Analytics data into Azure Blob Storage using the [continuous export](~/analytics/export.md) feature. You'll export all data from the moment you set up export and backfill data for the last 28 days.

## Set up Analytics data export
To export Analytics data, configure export by following the [Analytics Export guide](~/analytics/export.md).

You can also use our Export API:

```NA
POST https://openapi.appcenter.ms/v0.1/apps/{username}/{appname}/export_configurations
```

## Provide a copy of this data to my users
**Prerequisite:** To copy this data for your users, you need to map the App Center install IDs to individual users.

To provide a specific user with their data, review the exported data and copy the logs with the relevant install ID(s) to a separate file. This new file should contain all exportable data for your end user. If you have any questions about what data you're required to return, check with appropriate legal counsel.

