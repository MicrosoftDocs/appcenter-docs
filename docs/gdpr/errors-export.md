---
title: Exporting Errors Data 
description: How to export Errors data for a user
keywords: GDPR, DSR, privacy, EU
author: lucen-ms
ms.author: lucen
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 4D39AC7D-56BD-4CCD-8884-EB3C16E13E55
ms.service: vs-appcenter
---

# Exporting Errors Data

[!INCLUDE [Retirement announcement for App Center](../includes/retirement.md)]

## Overview

App Center provides the ability to export all your raw data into Azure Blob Storage using our [continuous export](~/analytics/export.md) feature from the moment you set up export and backfill data for the last 28 days.

## How to set up export for Errors data

To export Errors data, call the following App Center API:

```
"POST /v0.1/apps/{username}/{appname}/export_configurations".
```

Additional details are available in the [Analytics API](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create).

## How to provide a copy of this data to my users

**Prerequisite:** The following requires that you have a way to map the App Center install IDs and your users.

To provide a specific user with their data, you must search the exported data and copy the logs with a specific install ID in a different file. That file will contain all the data that has been exported corresponding to that specific user.

> [!NOTE]
> We're working on code samples that will help you filter the exported data for a specific install ID.
