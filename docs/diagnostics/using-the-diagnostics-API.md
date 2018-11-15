---
title: Using the Diagnostics API
description: help using the Diagnostics API in App Center
keywords: crashes, errors, API
author: winnieli1208
ms.author: yuli1
ms.date: 11/12/2018
ms.topic: article
ms.assetid: 69e6bb42-2693-44fa-85c9-294c1d2a9000
ms.service: vs-appcenter
ms.custom: analytics 
---

# Using the Diagnostics API

App Center Diagnostics supports multiple API functionalities listed under the crashes and errors section of the [App Center swagger page](https://openapi.appcenter.ms/). Read the [App Center API Documentation](~/api-docs/index.md) to learn how to acquire an API token and make calls to the App Center API.  

## Transitioning to the new APIs

With our App Center Diagnostics General Availability announcement, we made some changes in our APIs to enable an improved backend pipeline to process your crashes and errors. Depending on which APIs you use, there might be some action required on your end to ensure a smooth transition.

There are three types of crashes APIs:

1. Crashes APIs that map to new APIs after GA 
2. Crashes APIs that no longer exist after GA
3. Crashes APIs that remain unaltered 


> [Note:]
> If you are using any old crashes APIs that map to a new API as listed below, you will need to transition to the new APIs by January 2019.

### Crashes APIs that map to new APIs
Old APIs that now map to new APIs will be deprecated no later than Janurary 2019. The old APIs will continue to work until then but you will need to use the new diagnostics APIs as listed in the table below before January 2019.

| Old Crashes APIs                                               | New Crashes API        |
| -------------------------------------------------------------- |:----------------------:|
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
| GET/v0.1/apps/{owner_name}/{app_name}/crashes_info | GET/v0.1/apps/{owner_name}/{app_name}/errors/errorGroups

### Crashes APIs that no longer exist

There are few crashes APIs that are deprecated since App Center is now forwarding crashes from HockeyApp to App Center and these APIs are no longer needed. Read the [HockeyApp migration documentation](~/migration/hockeyapp/crashes.md) to learn more about the transition.

| Deprecated Old Crashes APIs                                         |
| ------------------------------------------------------------------- |
| GET/v0.1/apps/{owner_name}/{app_name}/hockeyapp_crash_forwarding    |
| PATCH/v0.1/apps/{owner_name}/{app_name}/hockeyapp_crash_forwarding  |

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
| GET/v0.1/apps/{owner_name}/{app_name}/symbol_groups_info |
| GET/v0.1/apps/{owner_name}/{app_name}/symbol_groups/{symbol_group_id} |
| GET/v0.1/apps/{owner_name}/{app_name}/symbol_groups |

