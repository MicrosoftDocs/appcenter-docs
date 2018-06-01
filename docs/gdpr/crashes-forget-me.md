---
title: Crash Delete 
description: How to delete personal information from crashes to your users
keywords: GDPR, DSR, privacy, EU
author: iageoghe
ms.author: iageoghe
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 65D9D23C-440E-467D-B183-15A29FA08830
ms.service: vs-appcenter
---

# How To Delete End-User Data

Identifying and removing end-user data from App Center requires calling the App Center API. What methods you must call and the steps you must take are defined by your starting point; there are two possible scenarios:
- You retained a mapping of your User IDs to Install IDs
- You did not retain a mapping of your User IDs to Install IDs

## Scenario 1 - You Retained a Mapping of User IDs to Install IDs

### Block Incoming Crashes

You need to request that App Center stop processing any incoming crashes for a given device by calling the following PUT API method. 

```
https://appcenter.ms//v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
``` 

[Block logs API documentation](https://openapi.appcenter.ms/#/analytics/Devices_BlockLogs)

Note: You need to call this API for every device (Install ID) your user has installed your app.

### Delete Associated Crashes for that Install ID

You need to delete any crashes that are associated with that Install ID by calling the following DELETE API method:

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}
```

[Delete crashes API documentation](https://openapi.appcenter.ms/#/crash/crashes_delete)

For this API call, you need to specify the crash ID, the crash group ID, the owner name, and the name of the app.

## Scenario 2 - You Did Not Retain a Mapping of User IDs to Install IDs

If you did not retain a mapping of User IDs to Install IDs, you need to

1. Export your crashes data (we recommend [Azure Cosmos DB](https://azure.microsoft.com/en-us/services/cosmos-db/))
2. Search within your crash logs for any crashes that contain the user's personal information
3. Locate the Install ID for those crash logs
4. Call the App Center API to stop processing any incoming crashes for the Install IDs you found in step 3
5. Delete the crash logs

The next section describes how to implement each of these steps:

### Use Azure Blob Storage 

You can learn more about how App Center works with Azure Blob Storage in the [App Center Export documentation](https://docs.microsoft.com/en-us/appcenter/analytics/export). You need an Azure subscription to export to Azure Blob Storage. 

### Export your crashes data 

You need to call the following POST API method...

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

[Export crashes API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create)

...using the following payload to export your crashes to Azure Blob Storage.

```
{
  "type" : "blob_storage_linked_subscription", 
  "subscription_id": "<Your-Azure-Subscription-ID", 
  "exportEntities": [ "crashes" ] 
}
```

To find the location in blob storage, you can call the following GET API method:

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

[Export Configurations List API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_List)

### Search within Azure Blob Storage

You need to search within Azure Blob Storage for any occurrences of the personal information stored in the crash log.

### Locate the Install IDs

Once you have identified the crash logs from the previous step that contain personal information, you can call the following API method to GET the location of the crash log. 

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}/raw/location
```

[Crash log location API documentation](https://openapi.appcenter.ms/#/crash/crashes_getRawCrashLocation)

Open the blob storage URL returned from the API and search for `installID` within the log to obtain the Install ID for the device where the crash originated.

Perform this step for all crash logs that contain user personal information.

### Block Incoming Crashes

For each install ID you collected in step 3, call the following API

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
```

[Block logs API documentation](https://openapi.appcenter.ms/#/analytics/Devices_BlockLogs)

### Delete All Crash Logs

For each crash log identified from Step 2, call the following API method to DELETE the crash log. 

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}
```

[Delete crashes API documentation](https://openapi.appcenter.ms/#/crash/crashes_delete)

For this API call, you need to specify the crash ID, the crash group ID, the owner name, and the name of the app to delete the crash. 
