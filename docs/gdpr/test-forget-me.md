---
title: Deleting Test Data
description: How to delete personal information from Test
keywords: GDPR, DSR, privacy, EU
author: glennwester
ms.author: glwest
ms.date: 06/12/2018
ms.topic: article 
ms.assetid: 9ced3f3e-b047-4fb7-851f-4e3c6b62b77f
ms.service: vs-appcenter
---

## Overview

This document covers the scenario where an App Center Test customer has a client of their own whose test report data resides on the same account. When this client of the customer requests deletion of their data, App Center Test has APIs to satisfy this request. All the APIs detailed are public, exposed in our swagger and discoverable through [https://openapi.appcenter.ms/#/test](https://openapi.appcenter.ms/#/test). For more information, refer to the [App Center GDPR documentation](https://docs.microsoft.com/en-us/appcenter/gdpr/your-data).

## Deleting Test Data

When a client requests deletion of their test reports, service this request using the follow process:

**1. [Generate an API token](https://docs.microsoft.com/en-us/appcenter/api-docs/).**

**2. Make the following [API call](https://openapi.appcenter.ms/#/test) to acquire a list of all the test runs ids owned by the client requesting deletion. You will need the owner name (this could be a user name or organization name) and the app name.**

```HTTP
GET /v0.1/apps/{owner_name}/{app_name}/test_runs
```

For example:

```HTTP
GET https://appcenter.ms/api/v0.1/apps/CompanyOrg1/AndroidApp1/test_runs
```
 
**3. For each of the app ids gathered in the previous step, make the following API call to delete the test run**

```HTTP
DELETE /v0.1/apps/{owner_name}/{app_name}/test_runs/{test_run_id}
```

For example:

```HTTP
DELETE https://appcenter.ms/api/v0.1/apps/CompanyOrg1/AndroidApp1/test_runs/0ce0x71b-82ce-4d7a-8ce5-404a6a50d91a
```

**4. Completion of this task is achieved only if all the deletion calls return success.**
