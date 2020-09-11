---
title: Export Test Data 
description: How to export personal information from Test to your users
keywords: GDPR, DSR, privacy, EU
author: king-of-spades
ms.author: kegr
ms.date: 06/20/2018 
ms.topic: article 
ms.assetid: 46e6e17c-6b43-484f-98ff-1f92f8871c2b
ms.service: vs-appcenter
---

# Export Test Data
## Overview
This document covers the scenario where an App Center Test customer has a client whose data is on the same account. If this client requests their data be exported, App Center Test has APIs to satisfy this request. All the APIs detailed are public and documented in [App Center Swagger](https://openapi.appcenter.ms/#/test). For more information about App Center GDPR, visit [GDPR: Managing Your Data](https://docs.microsoft.com/appcenter/gdpr/your-data).

## Export Test Data for a client
When a client requires exporting their test reports, you may service this request using the following process:

1. [Generate an API token](https://docs.microsoft.com/appcenter/api-docs/).
2. Call the [App Center Test API](https://openapi.appcenter.ms/#/test) to acquire a list of all the test runs IDs owned by the client requesting deletion. You'll need the app name, and the owner (user or organization) name.
   ```HTTP
   GET /v0.1/apps/{owner_name}/{app_name}/test_runs
   ```
   ```HTTP
   GET https://appcenter.ms/api/v0.1/apps/CompanyOrg1/AndroidApp1/test_runs
   ```

3. For each of the app IDs gathered in the previous step, make the following API call to export the data. This call returns all the files that have been uploaded for this app. The categories below for app test data.
   ```HTTP
   GET /v0.1/apps/{owner_name}/{app_name}/test/export
   ```
   ```HTTP
   GET https://appcenter.ms/api/v0.1/apps/CompanyOrg1/AndroidApp1/test/export
   ```

   Test Export API subcalls
   ```HTTP
   GET /v0.1/apps/{owner_name}/{app_name}/test/export/testRuns
   ```
   ```HTTP
   GET /v0.1/apps/{owner_name}/{app_name}/test/export/pipelineTests
   ```
   ```HTTP
   GET /v0.1/apps/{owner_name}/{app_name}/test/export/hashFiles
   ```
   ```HTTP
   GET /v0.1/apps/{owner_name}/{app_name}/test/export/fileSetFiles
   ```

5. Aggregate all of the exported data to a file, send to customer.
