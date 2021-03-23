---
title: Deleting Test Data
description: How to delete personal information from Test
keywords: GDPR, DSR, privacy, EU
author: lucen-ms
ms.author: kegr
ms.date: 06/26/2018
ms.topic: article 
ms.assetid: 9ced3f3e-b047-4fb7-851f-4e3c6b62b77f
ms.service: vs-appcenter
---

# Deleting Test Data
This document covers the scenario where an App Center Test customer has a client whose data is on the same account. If this client requests their data be exported, App Center Test has APIs to satisfy this request. All the APIs detailed are public and documented in [App Center Swagger](https://openapi.appcenter.ms/#/test). For more information about App Center GDPR, visit [GDPR: Managing Your Data](https://docs.microsoft.com/appcenter/gdpr/your-data).

## Deleting Test Data
When a client requests deleting their test reports, you may service this request using the following process:

1. [Generate an API token](https://docs.microsoft.com/appcenter/api-docs/).
2. Call the [App Center Test API](https://openapi.appcenter.ms/#/test) to acquire a list of all the test run IDs owned by the client requesting deletion. You'll need the app name, and the owner (user or organization) name.
   ```HTTP
   GET /v0.1/apps/{owner_name}/{app_name}/test_runs
   ```
   ```HTTP
   GET https://appcenter.ms/api/v0.1/apps/CompanyOrg1/AndroidApp1/test_runs
   ```
 
3. For each of the app IDs gathered in the previous step, make the following API call to delete the test run.
   ```HTTP
   DELETE /v0.1/apps/{owner_name}/{app_name}/test_runs/{test_run_id}
   ```
   ```HTTP
   DELETE https://appcenter.ms/api/v0.1/apps/CompanyOrg1/AndroidApp1/test_runs/0ce0x71b-82ce-4d7a-8ce5-404a6a50d91a
   ```

4. Completion of this task is achieved only if all the deletion calls return success.
