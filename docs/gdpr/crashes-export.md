---
title: Crash Export 
description: How to export personal information from crashes to your users
keywords: GDPR, DSR, privacy, EU
author: iageoghe
ms.author: iageoghe
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 2B51F9FA-75B1-4B73-8587-992F22CB0631
ms.service: vs-appcenter
---

# How To Export End-User Data

This article walks you through how to export data per your user request. There are two options depending on your app data retention settings.
- Your app retains data for 28 days.
- Your app retains data for 90 days.

To check the retention settings for your app, you can call the following GET API method

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/retention_settings
```

[Retention Settings API Documentation](https://openapi.appcenter.ms/#/crash/crashes_getRetentionSettings)

## Option 1 - 28 Day Retention Setting

If you have set the retention limit to 28 days, you will need to perform the following steps: 

### Use Azure Blob Storage 

You can learn more about how App Center works with Azure Blob Storage in the [App Center Export documentation](https://docs.microsoft.com/en-us/appcenter/analytics/export). You need an Azure subscription to export your data to Azure Blob Storage. 

### Export your crashes data 

You need to call the following POST API method

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

[Export crashes API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create)

using the following payload to export your crashes to Azure Blob Storage

```
{
  "type" : "blob_storage_linked_subscription", 
  "subscription_id": "<Your-Azure-Subscription-ID", 
  "exportEntities": [ "crashes" ] 
}
```

To find the location in blob storage, you can call the following GET API method

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

[Export Configurations List API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_List)

### Search within Azure Blob Storage

You need to search within Azure Blob Storage for crashes associated with your user, e.g. searching by a user ID or by personal information. 

### Download crash logs for a specific user

Once you have identified the crash logs from the previous step that contain occurrences of your search terms, you can call the following API method to GET the location of the crash log. 

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}/raw/location
```

[Crash log location API documentation](https://openapi.appcenter.ms/#/crash/crashes_getRawCrashLocation)

Save the crash log located at the blob storage URL.

Perform this step for all crash logs that contain occurrences of your search terms. 

## Option 2 - 90 day Retention Setting

If you have set the retention limit to 90 days, you need to perform the following steps. 

> [!NOTE]
> We are working on some code samples that will help you accomplish these steps.

### Collect list of crashes GUIDS for an app

First get and store a list of all crash GUIDs for your app.

1. Retrieve the past 90 days of crash GUIDs for your app by calling this GET method
```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups
``` 

2. Store the results to an Azure SQL database consisting of 1 table and 2 columns: 

  1. Crash-Guid 

  1. HasBeenRetrieved (bool default to false)

### Export your full crashes data

Next you want to export the full contents of the crash log.

1. GET the crash log metadata for every crash in a crash group by calling 
```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes
```

2. GET the stacktrace by calling 
```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/stacktrace
```

3. GET any recorded events by calling 
```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/session_logs
```

4. GET any attachments IDs by calling 
```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/attachments
```

  1. If this is a text attachment, you can GET the text by calling 
```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/attachments/{attachment_id}/text
```

  2. If this is a binary attachment, you can GET URI location by calling 
```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/attachments/{attachment_id}/location
```

### Search for individual crash logs within your exported crashes data

You need to search within Azure Blob Storage for any occurrences of the crashes for your user, e.g. searching by a user ID or by personal information.
