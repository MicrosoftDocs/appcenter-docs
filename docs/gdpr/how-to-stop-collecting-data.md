---
title: How to stop collecting data
description: How to stop collecting data
keywords: GDPR, DSR, privacy, EU
author: lucen-ms
ms.author: lucen
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: facd442a-14ae-41a6-958e-d32617d1ab22
ms.service: vs-appcenter
---

# How to stop collecting data

This section describes how to stop collection of *all* data coming from apps configured with the App Center SDK either by application or by device.

## Stop collecting all SDK data for a specific app from the server

If you want to stop using the Analytics and Diagnostics (Crashes and Errors) services in App Center and stop processing all the SDK logs being sent, but you still want to use other App Center services such as Build, Distribution, or Test, you can use the [Analytics block logs API](https://openapi.appcenter.ms/#/analytics/App_BlockLogs).

```json
PUT https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/
```

> [!NOTE]
> This stops ingestion of all data coming from the App Center SDK, but won't delete existing data for the app.

## Stop collecting all SDK data for a specific device from the server

To stop collection for a specific device, include the installation identifier in your call.

```json
PUT https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/devices/block_logs/{install_id}
```

## Stop collecting SDK data for a specific service from the client

The App Center SDK can be configured to stop collecting data per service. Instructions for doing so can be found under the ["Other APIs" section for the SDK.](~/sdk/index.md)

> [!NOTE]
> This won't delete existing data for the app.
