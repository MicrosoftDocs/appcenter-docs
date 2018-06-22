---
title: Deleting User Errors Data 
description: How to manage and remove End-User errors data  
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: A4139B4A-A015-4EE5-85E2-DDA7CC0EF510
ms.service: vs-appcenter
---

# Deleting User Errors Data

Since Data Subject requests to be forgotten must be serviced within thirty days, App Center Errors retains raw data for just twenty-eight days. In the event that you wish to stop collecting all Errors data from a specific end-user, there are two ways to do so:

## Block incoming Errors data by install ID

**Step 1.** If you are already keeping a mapping between the App Center install IDs to a way to identify your users, you can skip to Step 3.

**Step 2.** Continuously [Export to Blob Storage](~/analytics/export.md) and search for a specific install ID following the steps explained in the [Install ID](~/gdpr/install-id.md) section.

**Step 3.** Block incoming Errors data. For each install ID found in Step 1, call the following App Center API:

```
PUT https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
```

Additional details are available in the [Analytics API section](https://openapi.appcenter.ms/#/analytics/Devices_BlockLogs).

## Block incoming Errors data by app ID

To stop processing all data for a given app ID, call the following App Center API:

```
PUT https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs
```

Additional details are available in the  [Analytics API](https://openapi.appcenter.ms/#/analytics/App_BlockLogs) section.
