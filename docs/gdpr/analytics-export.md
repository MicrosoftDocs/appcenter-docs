---
title: GDPR 
description: How to export Analytics data for a user
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 05/21/2018 
ms.topic: article 
ms.assetid: D08809D5-4CF5-461C-9F43-3F75986CC376
ms.service: vs-appcenter
---

# How To Export End-User Data

## Overview

App Center provides the ability to export all your raw data into Azure Blob Storage using our [continuous export](~/analytics/export.md) feature from the moment you set up export and backfill data for the last 28 days.

## How to set up export for Analytics data

In order to export Analytics data, you can set up export from your app settings in the portal. In order to do so, follow our [Export documentation](~/analytics/export.md).
You can also use our Export POST API method to do so: 
```
https://openapi.appcenter.ms/v0.1/apps/{username}/{appname}/export_configurations
```


## How to provide a copy of this data to my users

**Prerequisite:** In order to accomplish this scenario, you need to have a way to map the App Center install IDs and your users.

In order to provide a specific user with his/her data, you will need to go through the exported data and copy the logs with the relevant install ID(s) to a separate file. This new file should contain all exportable data for your end-user; if you have any questions about what data you are required to return be sure to check with appropriate legal counsel.

> [!NOTE]
> We are working on some code samples that will help you filter the exported data for a specific install ID.
