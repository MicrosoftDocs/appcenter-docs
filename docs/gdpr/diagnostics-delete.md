---
title: Deleting diagnostics data
description: How to delete personal information from user diagnostics
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 12/09/2019
ms.topic: article
ms.assetid: 65D9D23C-440E-467D-B183-15A29FA08830
ms.service: vs-appcenter
---

# Deleting diagnostics data

Data Subject Requests (DSRs) to be forgotten must be serviced within 30 days. App Center Diagnostics retains raw data for 90 days by default. You can adjust your retention settings in the App Center portal and [application programming interface](../api-docs/index.md) (API).
This documentation is a guide on the steps you must follow if a Data Subject Request for delete comes in and your retention setting is higher than 28 days.

There are two possible starting points:

- You [don't have a mapping](#you-have-a-mapping-of-your-user-ids-to-install-ids) of your user IDs to install IDs.
- You [have a mapping](#you-have-a-mapping-of-your-user-ids-to-install-ids) of your user IDs to install IDs.

In both cases, once you have the install IDs of the user, you should delete the associated diagnostics data. Details for both cases are in the sections below.

## You have a mapping of your user IDs to install IDs

If you did not keep a mapping between your user IDs and install IDs, you must follow some extra steps, described in the following subsections.

1. Export diagnostics data to Blob Storage.
2. Search for personal data within the exported information in Azure Blob Storage.
3. Locate the install IDs.

### Export diagnostics data to Blob Storage

To [export your diagnostics data to Azure Blob Storage](../analytics/export.md), call the following App Center API:

```text
POST https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

Additional details are available in the [export API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create).

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

Additional details are available in the [export configurations list API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_List).

### Search for personal data within the exported information in Azure Blob Storage

Search within your exported diagnostics data in Azure Blob Storage for any occurrences of the personal information stored in the crash or error log.

### Locate the install IDs

Locate the install ID for the diagnostics logs that contain personal information. Learn more in the [application install ID documentation](install-id.md). Now that you have the install IDs, you can delete the diagnostic data.

## You don't have a mapping of your user IDs to install IDs

If you keep a mapping between your user IDs and their App Center install IDs, you can directly use them to block and delete the data of interest.

## Delete diagnostics data

Once you have the install IDs for the user associated with the DSR, you should go ahead and delete the existing data as well as block new data from coming in.

### Block incoming diagnostics data by install ID

Stop processing incoming diagnostics data for a given install ID, call the following App Center API for each install ID:

```text
PUT https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
```

Additional details are available in the [analytics API documentation](https://openapi.appcenter.ms/#/analytics/Devices_BlockLogs). Call this API for every device (install ID) on which your user has installed your app.

### Delete diagnostics data by install ID

To delete the diagnostics data associated with an install ID, call the following App Center API:

```text
DELETE https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/errors/{errorId}
```

For this API call, you must specify the crash/error ID, the crash/error group ID, the owner name, and the name of the app.
