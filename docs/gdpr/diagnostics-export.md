---
title: Exporting Diagnostics Data
description: How to export personal information from crashes and errors to your users
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 07/30/2019
ms.topic: article
ms.assetid: 2B51F9FA-75B1-4B73-8587-992F22CB0631
ms.service: vs-appcenter
---

# Exporting Diagnostics Data

This article walks you through how to export data per your user request. In order to export data, you have two options:

1. Use Azure Blob Storage
2. Call our APIs for specific crash/error information

## Use Azure Blob Storage

Export all your errors and symbolicated crashes, including stack traces and attachments, to Azure Blog Storage. Note that you need an Azure subscription to export your data to Azure Blob Storage. You can learn more about how App Center works with Azure Blob Storage in the [App Center Export documentation](https://docs.microsoft.com/en-us/appcenter/analytics/export).

To export Diagnostics data to Blob Storage, call the following App Center API:

```text
POST https://openapi.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

Use one of the following payloads to export your crashes to Azure Blob Storage:

Payload for Standard Export :

```JSON
{
  "type" : "blob_storage_linked_subscription",
  "subscription_id": "<Your-Azure-Subscription-ID",
  "export_entities": [ "crashes" ]
}
```

Payload for Custom Export :

```JSON
{
  "type" : "blob_storage_connection_string",
  "connection_string": "<Your-blob-storage-connection-string",
  "export_entities": [ "crashes" ]
}
```

To find the location in blob storage, call the following App Center API:

```text
GET https://openapi.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/export_configurations
```

## Call our APIs for specific crash/error information

These are the different APIs you must call to export the associated Diagnostics information.

<span>1. GET the crash/error log metadata for every crash/error in a crash/error group by calling:</span>

```text
https://openapi.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/errors
```

<span>2. GET the stacktrace by calling:</span>

```text
https://openapi.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/stacktrace
```

<span>3. GET any recorded events by calling:</span>

```
https://openapi.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/errors/{errorId}/session_logs
```

<span>4. GET any attachments IDs by calling:</span>

```
https://openapi.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/errors/{errorId}/attachments
```

1. If this is a text attachment, you can GET the text by calling:

```
https://openapi.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/errors/{errorId}/attachments/{attachmentId}/text
```

2. If this is a binary attachment, you can GET URI location by calling:

```
https://openapi.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/errors/{errorId}/attachments/{attachmentIdd}/location
```

## How to provide a copy of this data to my users

**Prerequisite:** The following requires that you must have a way to map the App Center install IDs and your users.

In order to provide a specific user with their data, you must search the exported data and copy the logs with a specific install ID in a different file. That file will contain all the data that has been exported corresponding to that specific user.
