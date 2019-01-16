---
title: Exporting Crash Data
description: How to export personal information from crashes to your users
keywords: GDPR, DSR, privacy, EU
author: iageoghe
ms.author: iageoghe
ms.date: 01/16/2019
ms.topic: article
ms.assetid: 2B51F9FA-75B1-4B73-8587-992F22CB0631
ms.service: vs-appcenter
---

# Exporting Crash Data

This article walks you through how to export data per your user request. There are two options depending on your app data retention settings:

- Your app retains data for 28 days.
- Your app retains data for 90 days.

To check the retention settings for your app, you can call the following App Center API:

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/errors/retention_settings
```

Additional details are available in the [Retention Settings API Documentation](https://openapi.appcenter.ms/#/errors/errors_getRetentionSettings).

## Option 1 - 28 Day Retention Setting

If you have set the retention limit to 28 days, you must perform the following steps:

### Use Azure Blob Storage

You can learn more about how App Center works with Azure Blob Storage in the [App Center Export documentation](https://docs.microsoft.com/en-us/appcenter/analytics/export). You need an Azure subscription to export your data to Azure Blob Storage.

### Export your crashes data

To export crashes data, call the following App Center API:

```
POST https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

Additional details are available in the [Export crashes API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create).

Use one of the following payloads to export your crashes to Azure Blob Storage:

Payload for Standard Export :

```JSON
{
  "type" : "blob_storage_linked_subscription",
  "subscription_id": "<Your-Azure-Subscription-ID",
  "exportEntities": [ "crashes" ]
}
```

Payload for Custom Export :

```JSON
{
  "type" : "blob_storage_connection_string",
  "connection_string": "<Your-blob-storage-connection-string",
  "exportEntities": [ "crashes" ]
}
```

Example of a POST operation

```
POST /api/v0.1/apps/{owner_name}/{app_name}/export_configurations HTTP/1.1
Content-Type: application/json
X-API-TOKEN: <Api-Token from the portal>

{
    "type": "blob_storage_connection_string",
    "connection_string": "CONNECTION STRING",
    "blob_path_format_kind": "WithAppId"
}
```

To update the export configuration, call the following App Center API:

```
PATCH https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

The payload is similar to what is used in the POST operation. The property `type` is mandatory in the export configuration payload.

To find the location in blob storage, call the following App Center API:

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

Additional details are available in the [Export Configurations List API documentation](https://openapi.appcenter.ms/#/export/ExportConfigurations_List).

### Search within Azure Blob Storage

Search within Azure Blob Storage for crashes associated with your user, e.g. searching by a user ID or by personal information.

### Download crash logs for a specific user

Once you have identified the crash logs from the previous step that contain occurrences of your search terms, call the following App Center API to request the location of the crash log.

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}/raw/location
```

Additional details are available in the [Crash log location API documentation](https://openapi.appcenter.ms/#/crash/crashes_getRawCrashLocation).

Save the crash log located at the blob storage URL.

Perform this step for all crash logs that contain occurrences of your search terms.

## Option 2 - 90 day Retention Setting

If you have set the retention limit to 90 days, you need to perform the steps described in the following sections.

> [!NOTE]
> We are working on some code samples that will help you accomplish these steps.

### Collect list of crashes GUIDS for an app

First get and store a list of all crash GUIDs for your app.

<span>1. Retrieve the past 90 days of crash GUIDs for your app by calling this App Center API:</span>

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups
```

<span>2. Store the results to an Azure SQL database consisting of one table with two columns:</span>

1. Crash-Guid
2. HasBeenRetrieved (bool default to false)

### Export your full crashes data

Next you want to export the full contents of the crash log.

<span>1. GET the crash log metadata for every crash in a crash group by calling:</span>

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes
```

<span>2. GET the stacktrace by calling:</span>

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/stacktrace
```

<span>3. GET any recorded events by calling:</span>

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/session_logs
```

<span>4. GET any attachments IDs by calling:</span>

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/attachments
```

1. If this is a text attachment, you can GET the text by calling:

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/attachments/{attachment_id}/text
```

2. If this is a binary attachment, you can GET URI location by calling:

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/attachments/{attachment_id}/location
```

### Search for individual crash logs within your exported crashes data

Search within Azure Blob Storage for any occurrences of the crashes for your user, e.g. searching by a user ID or by personal information.
