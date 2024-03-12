---
title: App Center Connections to allow list
description: URLs to allow list
keywords: allowlist, appcenter, networking
author: lucen-ms
ms.author: lucen
ms.date: 12/07/2020
ms.topic: article
ms.assetid: fb001bf2-3c2b-49a9-b839-2855c997950d
ms.service: vs-appcenter
---

# URLs to allow list for App Center

[!INCLUDE [Retirement announcement for App Center](../includes/retirement.md)]

If you're behind a firewall and want to connect to App Center, here are the URLs to allow list for App Center:

- api.appcenter.ms
- api.mobile.azure.com
- *.appcenter.ms

## Service-specific considerations
Some App Center services might need additional items on your allow list:

- [Build allow list info](~/build/connect.md#connecting-to-a-source-repository)
- [Test allow list info](~/test-cloud/troubleshooting/server-connection.md)

## IP Allowlist
We do not currently provide a list of IP addresses or ranges that you need to allowlist to connect to App Center, since these IP addresses are subject to change. If you do require IP addresses, you can use a DNS service to translate the domain names into the corresponding IP addresses.
