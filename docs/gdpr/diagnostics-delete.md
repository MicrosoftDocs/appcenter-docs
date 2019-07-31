---
title: Deleting Diagnostics Data
description: How to delete personal information from Diagnostics to your users
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 07/30/2019
ms.topic: article 
ms.assetid: 65D9D23C-440E-467D-B183-15A29FA08830
ms.service: vs-appcenter
---

# Deleting Diagnostics Data

Data Subject requests to be forgotten must be serviced within thirty days; App Center Diagnostics retains raw data for ninety days by default. You can adjust your retention settings in the App Center portal and API.
This documentation is a guide on the steps you must follow if a Data Subject request comes in and your retention settings is higher than twenty-eight days.

There are two possible starting points:
- You did not retain a mapping of your User IDs to Install IDs
- You retained a mapping of your User IDs to Install IDs

## You did not retain a mapping of your User IDs to Install IDs

If you did not keep a mapping between your user IDs and install IDS, you must follow some extra steps outlined below.

1. Export Diagnostics data to Blob Storage
2. Search for personal data within the exported information in Azure Blob Storage
3. Locate the Install IDs

### Export Diagnostics data to Blob Storage

To export your Diagnostics data to [Azure Blob Storage](~/analytics/export.md), call the following App Center API:

```text
POST https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

Additional details are available in the [Export API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create).

Use the following payload to export your crashes to Azure Blob Storage:

```json
{
  "type" : "blob_storage_linked_subscription",
  "subscription_id": "<Your-Azure-Subscription-ID",
  "export_entities": [ "crashes" ]
}
```

To find the location in blob storage, you can call the following App Center API:

```text
GET https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

Additional details are available in the [Export Configurations List API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_List).

### Search for personal data within the exported information in Azure Blob Storage

Search within your exported Diagnostics data in Azure Blob Storage for any occurrences of the personal information stored in the crash or error log.

### Locate the Install IDs

Locate the Install ID for the Diagnostics logs that contain personal information. Learn more in the [Install ID](~/gdpr/install-id.md) section.

## You retained a mapping of your User IDs to Install IDs

If you are keeping a mapping between your user IDs and their App Center Install IDs, you can directly use them to block and delete the data of interest.

## Delete Diagnostics data

### Block incoming Diagnostics data by install ID

Stop processing incoming Diagnostics data for a given install ID, call the following App Center API for each install ID:

```text
PUT https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
```

Additional details are available in the [Analytics API section](https://openapi.appcenter.ms/#/analytics/Devices_BlockLogs). You must call this API for every device (Install ID) your user has installed your app.

### Delete Diagnostics data by install ID

To delete the Diagnostics data associated with an Install ID, call the following App Center API:

```text
DELETE https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/errors/{errorId}
```

For this API call, you must specify the crash/error ID, the crash/error group ID, the owner name, and the name of the app.
