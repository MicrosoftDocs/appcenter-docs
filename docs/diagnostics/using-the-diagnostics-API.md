---
title: Using the Diagnostics API
description: help using the Diagnostics API in App Center
keywords: crashes, errors, API
author: winnie
ms.author: yuli1
ms.date: 02/18/2020
ms.topic: article
ms.assetid: 69e6bb42-2693-44fa-85c9-294c1d2a9000
ms.service: vs-appcenter
ms.custom: analytics 
---

# Using the Diagnostics API

App Center Diagnostics supports multiple API functionalities listed under the crashes and errors section of the [App Center swagger page](https://openapi.appcenter.ms/). Read the [App Center API Documentation](~/api-docs/index.md) to learn how to acquire an API token and make calls to the App Center API.  

## Transitioning to the new APIs

With our App Center Diagnostics General Availability announcement last year and our UWP diagnostics improvements, we made some changes in our APIs to enable an improved backend pipeline to process your crashes and errors. Depending on which APIs you use, there might be some action required on your end to ensure a smooth transition.

There are three types of crashes APIs:

1. Crashes APIs that map to new APIs 
2. Crashes APIs that no longer exist
3. Crashes APIs that remain unaltered

### Crashes APIs that map to new APIs

Old APIs listed in the crashes section are deprecated and have been removed. You must use the new diagnostics APIs as listed in the table below. 


| Old Crashes APIs                                               | New Crashes API        |
| -------------------------------------------------------------- |:----------------------|
| GET/v0.1/apps/{owner_name}/{app_name}/retention_settings      | GET/v0.1/apps/{owner_name}/{app_name}/errors/retention_settings               |
| GET/v0.1/apps/{owner_name}/{app_name}/versions                | GET/v0.1/apps/{owner_name}/{app_name}/analytics/versions     |
| GET/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/attachments/{attachment_id}/text |GET/v0.1/apps/{owner_name}/{app_name}/errors/{errorId}/attachments/{attachmentId}/text              |
| GET/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/attachments/{attachment_id}/location | GET/v0.1/apps/{owner_name}/{app_name}/errors/{errorId}/attachments/{attachmentId}/location |
| GET/v0.1/apps/{owner_name}/{app_name}/crashes/{crash_id}/attachments | GET/v0.1/apps/{owner_name}/{app_name}/errors/{errorId}/attachments |
| GET/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/stacktrace | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/stacktrace |
| GET/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}/stacktrace | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/errors/{errorId}/stacktrace |
| GET/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}/native/download | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/errors/{errorId}/download |
| GET/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}| GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/errors/{errorId} |
| GET/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes| GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/errors |
| GET/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}| GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId} |
| GET/v0.1/apps/{owner_name}/{app_name}/crash_groups| GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups |
| DELETE/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id} | DELETE 0.1/apps/{app_id}/errors/errorGroups/{errorGroupId}/errors/{errorId} |
| PATCH/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id | PATCH/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId} |
| GET/v0.1/apps/{owner_name}/{app_name}/crashes_info | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups |
| GET/v0.1/apps/{owner_name}/{app_name}/analytics/crash_groups | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups |
| GET/v0.1/apps/{owner_name}/{app_name}/analytics/crash_groups/{crash_group_id}/crash_counts | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/errorCountsPerDay |
| GET/v0.1/apps/{owner_name}/{app_name}/analytics/crash_counts | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorCountsPerDay|
| GET/v0.1/apps/{owner_name}/{app_name}/analytics/crash_groups/{crash_group_id}/models | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/models |
| GET/v0.1/apps/{owner_name}/{app_name}/analytics/crash_groups/{crash_group_id}/operating_systems | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/operatingSystems |
| GET/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}/raw/location | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups/{errorGroupId}/errors/{errorId}/location |
| GET/v0.1/apps/{owner_name}/{app_name}/crash_groups/{crash_group_id}/crashes/{crash_id}/native | GET /v0.1/apps/{ownerName}/{appName}/errors/errorGroups/{errorGroupId}/errors/{errorId}/download?format=text"|
| GET/v0.1/apps/{owner_name}/{app_name}/analytics/crashfree_device_percentages | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorfreeDevicePercentages |
| GET/v0.1/apps/{owner_name}/{app_name}/symbol_groups_info | GET/v0.1/apps/{owner_name}/{app_name}/diagnostics/symbol_groups_info |
| GET/v0.1/apps/{owner_name}/{app_name}/symbol_groups/{symbol_group_id} | GET/v0.1/apps/{owner_name}/{app_name}/diagnostics/symbol_groups/{symbol_group_id} |
| GET/v0.1/apps/{owner_name}/{app_name}/symbol_groups | GET/v0.1/apps/{owner_name}/{app_name}/diagnostics/symbol_groups |

### Unaltered Crashes APIs

There are some crashes APIs that remain the same in the new pipeline. The following APIs will continue to work as expected and there is no action needed at this time.

| Unaltered Crashes APIs        |
| ----------------------------- |
| GET/v0.1/apps/{owner_name}/{app_name}/symbols/{symbol_id}/status|
| GET/v0.1/apps/{owner_name}/{app_name}/symbols/{symbol_id}/location |
| POST/v0.1/apps/{owner_name}/{app_name}/symbols/{symbol_id}/ignore |
| GET/v0.1/apps/{owner_name}/{app_name}/symbols/{symbol_id}  |
| GET/v0.1/apps/{owner_name}/{app_name}/symbols  |
| GET/v0.1/apps/{owner_name}/{app_name}/symbol_uploads/{symbol_upload_id}/location  |
| GET/v0.1/apps/{owner_name}/{app_name}/symbol_uploads/{symbol_upload_id} |
| PATCH/v0.1/apps/{owner_name}/{app_name}/symbol_uploads/{symbol_upload_id}|
| DELETE/v0.1/apps/{owner_name}/{app_name}/symbol_uploads/{symbol_upload_id} |
| GET/v0.1/apps/{owner_name}/{app_name}/symbol_uploads |
| POST/v0.1/apps/{owner_name}/{app_name}/symbol_uploads |
