---
title: Deleting Crash Data
description: How to delete personal information from crashes to your users
keywords: GDPR, DSR, privacy, EU
author: iageoghe
ms.author: iageoghe
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 65D9D23C-440E-467D-B183-15A29FA08830
ms.service: vs-appcenter
---

# Deleting Crash Data

Identifying and removing end-user data from App Center requires calling the App Center API. The methods you call, and the steps you take are defined by your starting point; there are two possible scenarios:

- You retained a mapping of your User IDs to Install IDs
- You did not retain a mapping of your User IDs to Install IDs

## Scenario 1 - You Retained a Mapping of User IDs to Install IDs

### Block Incoming Crashes

You need to request that App Center stop processing any incoming crashes for a given device by calling the following App Center API:

```
PUT https://appcenter.ms//v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
```

Additional details are available in the [Block logs API documentation](https://openapi.appcenter.ms/#/analytics/Devices_BlockLogs).

> [!NOTE]
> You must call this API for every device (Install ID) your user has installed your app.

### Delete Associated Crashes for that Install ID

Delete any crashes data associated with that Install ID by calling the following App Center API:

```
DELETE https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}
```

Additional details are available in the [Delete crashes API documentation](https://openapi.appcenter.ms/#/crash/crashes_delete).

For this API call, you must specify the crash ID, the crash group ID, the owner name, and the name of the app.

## Scenario 2 - You Did Not Retain a Mapping of User IDs to Install IDs

If you did not retain a mapping of User IDs to Install IDs, you must:

1. Export your crashes data (we recommend using [Azure Cosmos DB](https://azure.microsoft.com/en-us/services/cosmos-db/))
2. Search within your crash logs for any crashes that contain the user's personal information
3. Locate the Install ID for those crash logs
4. Call the App Center API to stop processing any incoming crashes for the Install IDs you found in step 3
5. Delete the crash logs

The following section describes how to implement each of these steps

### Use Azure Blob Storage

Learn more about how App Center works with Azure Blob Storage in the [App Center Export documentation](https://docs.microsoft.com/en-us/appcenter/analytics/export). You must have an Azure subscription to export to Azure Blob Storage.

### Export your crashes data

Call the following App Center API:

```
POST https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

Additional details are available in the [Export crashes API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create).

Use the following payload to export your crashes to Azure Blob Storage:

```
{
  "type" : "blob_storage_linked_subscription",
  "subscription_id": "<Your-Azure-Subscription-ID",
  "exportEntities": [ "crashes" ]
}
```

To find the location in blob storage, you can call the following App Center API:

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

Additional details are available in the [Export Configurations List API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_List).

### Search within Azure Blob Storage

Search within Azure Blob Storage for any occurrences of the personal information stored in the crash log.

### Locate the Install IDs

Once you have identified the crash logs from the previous step that contain personal information, can call the following App Center API to request the location of the crash log:

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}/raw/location
```

Additional details are available in the [Crash log location API documentation](https://openapi.appcenter.ms/#/crash/crashes_getRawCrashLocation).

Open the blob storage URL returned from the API and search for `installID` within the log to obtain the Install ID for the device where the crash originated.

Perform this step for all crash logs that contain user personal information.

### Block Incoming Crashes

For each install ID you collected in step 3, call the following App Center API:

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
```

Additional details are available in the [Block logs API documentation](https://openapi.appcenter.ms/#/analytics/Devices_BlockLogs).

### Delete All Crash Logs

For each crash log identified from Step 2, call the following App Center API to delete the crash log:

```
DELETE https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}
```

Additional details are available in the [Delete crashes API documentation](https://openapi.appcenter.ms/#/crash/crashes_delete).

For this API call, you need to specify the crash ID, the crash group ID, the owner name, and the name of the app to delete the crash.
