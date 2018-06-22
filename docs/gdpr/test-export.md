---
title: Export Test Data 
description: How to export personal information from Test to your users
keywords: GDPR, DSR, privacy, EU
author: glennwester
ms.author: glwest
ms.date: 06/20/2018 
ms.topic: article 
ms.assetid: 46e6e17c-6b43-484f-98ff-1f92f8871c2b
ms.service: vs-appcenter
---

# Export Test Data

## Overview

This document will cover the scenario where an App Center Test customer has a client of their own whose test report data resides on the same account. When this client of the customer requests that their data be exported, App Center Test has APIs to satisfy this request. All the APIs detailed are public, exposed in our swagger and discoverable through [App Center Swagger](https://openapi.appcenter.ms/#/test). For more information about App Center GDPR please visit [GDPR: Managing Your Data](https://docs.microsoft.com/en-us/appcenter/gdpr/your-data).

## Export Test Data for a client

When a client requests their test reports be deleted, you may service this request using the follow process:

**1. [Generate an API token](https://docs.microsoft.com/en-us/appcenter/api-docs/).**

**2. Call the [App Center Test API](https://openapi.appcenter.ms/#/test) to acquire a list of all the test runs ids owned by the client requesting deletion. You will need the owner name (this could be a user name or organization name) and the app name.**

```HTTP
GET /v0.1/apps/{owner_name}/{app_name}/test_runs
```

For example:

```HTTP
GET https://appcenter.ms/api/v0.1/apps/CompanyOrg1/AndroidApp1/test_runs
```

**3. For each of the app ids gathered in the previous step, make the following API call to export the data. This returns all the files that have been uploaded for this app. Note that the categories below for app test data.**

```HTTP
GET /v0.1/apps/{owner_name}/{app_name}/test/export
```

For example:

```HTTP
GET https://appcenter.ms/api/v0.1/apps/CompanyOrg1/AndroidApp1/test/export
```

Test Export API calls

```HTTP
GET /v0.1/apps/{owner_name}/{app_name}/test/export
```

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

**5. Aggregate the of all the exported data to a file, send to customer.**
