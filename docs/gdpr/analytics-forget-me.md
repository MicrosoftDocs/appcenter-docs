---
title: GDPR 
description: How to handle a "forget me" request from one of your users
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: C2086120-083B-466E-AE78-7C64B9DE356E
ms.service: vs-appcenter
---
<!--
# How to handle a "forget me" request from one of my users

##Overview

Forgetting users mean:
- Removing all the personal identifiable information (PII) you have about them.
- Ensure that their data is no longer processed.

### Removing Analytics data for a user
-->
# End-User Analytics data

Since Data Subject requests to be forgotten must be serviced within thirty days, App Center Analytics retains raw data for just twenty-eight days. In the event that you wish to stop collecting all Analytics data from a specific end-user, there are two ways to do so:

**Block incoming Analytics data by install ID**

**Step 1.** If you are already keeping a mapping between the App Center install IDs as a way to identify your users, you can skip to Step 3.

**Step 2.** Continuously [Export to Blob Storage](~/analytics/export.md) and search for a specific install ID following the steps explained in the [install ID](~/gdpr/install-id.md) section.

**Step 3.** Block incoming Analytics data to prevent it from being processed. For each install ID found in Step 1, call the following PUT API method:

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
``` 

under the [Analytics API section](https://openapi.appcenter.ms/#/analytics/Devices_BlockLogs).

**Block incoming Analytics data by app ID**

If you would processing all data for a given app ID, call the following PUT API method:

```
PUT https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs
``` 

under the [Analytics API](https://openapi.appcenter.ms/#/analytics/App_BlockLogs) section.
