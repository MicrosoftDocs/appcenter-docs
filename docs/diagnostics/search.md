---
title: Search in Diagnostics
description: A description of the search functionality in Diagnostics
keywords: crashes, errors, search
author: blparr
ms.author: blparr
ms.date: 10/09/2019
ms.topic: article
ms.assetid: 92ABCD39-D03A-4560-BE32-31C44DE1EAC6
ms.service: vs-appcenter
ms.custom: analytics
---

# Search in Diagnostics

In this section, you will learn about the ability to search Diagnostics data in App Center.

## How to use Search

App Center Diagnostics allows you to search for specific crashes and handled errors. In the Diagnostics overview, click on the magnifying glass to start using Search.

![App Center Diagnostics search](~/diagnostics/images/search-overview.png)

### Search types

App Center searches in the indexed fields, and can be done in two ways:

1. Use the search box to include free text. Note that this text will be searched in just the indexed fields.

  ![Free text search](~/diagnostics/images/crashes-results-freetext.png)

2. Use the query builder to specify what fields you want to search on by clicking on the filtering icon.

  ![Query builder](~/diagnostics/images/crashes-query-types.png)

3. If your Android, Unity, UWP, WPF, WinForms, or Xamarin app is tracking handled errors, you can specify the type of issue you want to search next to the search box.

  ![Search type selection](~/diagnostics/images/search-type-selection.png)

### Indexed fields

For crash and error reports:

- User ID
- Method
- Class
- Exception Type
- Reason
- Model
- OS Version
- Crash and error ID

For crash and error groups:

- Method
- Class
- Exception Type
- Reason
- Crash and error group ID

## Considerations

- Only symbolicated crashes are searchable; you must upload the symbols to search for them.
- The maximum number of matching reports we display is 100.
- Search results show the last 30 days of data, regardless of the retention settings.
- The report or group ID is only searchable via the search box, not the query builder. The group ID is the 10 digit string after `crashes/errors` in the URL of the crash or error group.  The crash and error report ID is the last 32 character string in the URL of the specific crash or error report. For example, your URL might look something like: `appcenter.ms/orgs/appcenter/apps/test-app/crashes/errors/3132303808u/reports/2518291138564839999-00000000-0000-0000-0000-000000000000/threads`. The group ID is `3132303808` and crash ID is `00000000-0000-0000-0000-000000000000`.
