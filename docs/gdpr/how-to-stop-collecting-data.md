---
title: How to stop collecting data
description: How to stop collecting data
keywords: GDPR, DSR, privacy, EU
author: kpiteira
ms.author: kapiteir
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 0DA5C4FB-B64F-40F4-9077-4B7D31B746CD
ms.service: vs-appcenter
---

# How to stop collecting data

This section describes how to stop collection of *all* data coming from apps configured with the App Center SDK either by application or by device.

## Stop collecting all SDK data for a specific app from the server

If you would like to stop using the Analytics, Diagnostics (Crashes and Errors) and Push services in App Center and stop processing all the SDK logs being sent, but you would still like to use other App Center
services such as Build, Distribution, or Test, you can use the PUT [block logs method](https://openapi.appcenter.ms/#/analytics/App_BlockLogs) in Analytics section.

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/
```

This will stop ingestion of all data coming from the App Center SDK. _Please note that this will not delete existing data associated with the app._

## Stop collecting all SDK data for a specific device from the server

To stop collection for a specific device, include the installation identifier in your call.

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
```

## Stop collecting SDK data for a specific service from the client

The App Center SDK can be configured to stop collecting data per service. Instructions for doing so can be found under the ["Other APIs" section for the SDK.](~/sdk/index.md)

_Please note that this will not delete existing data associated with the device._
