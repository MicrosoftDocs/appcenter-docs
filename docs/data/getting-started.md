---
title: Getting started with the App Center Data Service
description: How to get started with the App Center Data Service
keywords: MBaaS
author: Zakeelm
ms.author: Zakeelm
ms.date: 05/03/2019
ms.topic: article
ms.assetid: 2addcd15-b9af-4c34-8e47-d9ea1312f8c0
ms.service: vs-appcenter
ms.custom: MBaaS
---

# Getting Started with App Center's Data Service

This guide shows you how to set up the App Center Data service and provision a new Cosmos DB instance or connect to an existing one already present in your Azure subscription. This guide starts with general directions independent of platform, but will break off into to additional steps relevant to your target platform.

## Configuring the Data Service

To get started with the configuration process for the Data service, do the following steps:

1. Log in or sign-up for App Center at [https://appcenter.ms](https://appcenter.ms).
2. Create a new application project (what we call an **App** in App Center) or open an existing App project.
3. Navigate to the **Data** option in the left project navigation pane.
4. Select the **New Database** or the **Existing Database** button. This will start the flow to connect the Data service to a Cosmos DB instance. Selecting **New Database** will provision a new instance while **Existing Database** will connect a database you have already created. If you are creating a new database, you will be asked to name your instance, provide a database location, and configure your throughput, which is what affects your pricing. If you're connecting an existing database, you will be asked to specify your Cosmos DB instance, database, and collection.

> [!NOTE]
> Please note that you will need an [Azure Subscription](https://azure.microsoft.com/free/). For additional information on CosmosDB and Pricing, see the [official documentation](https://docs.microsoft.com/azure/cosmos-db/).

## Configuring your app for the Data Service

Now that you've connected your database, you can integrate the SDK into your app so you can start using the features App Center Data provides.

Actions such as creating, reading, updating, and deleting documents are all provided directly in the client SDK.

The instructions for doing this varies depending on your target platform. For additional information, see the App Center Data SDK platform documentation:

* [Android Data SDK documentation](../sdk/data/android.md)
* [iOS Data SDK documentation](../sdk/data/ios.md)
* [Xamarin Data SDK documentation](../sdk/data/xamarin.md)

## Configuring Auth for the Data Service

App Center Auth plays an important role in how Data works. Documents can be public (available to all users) or private. Private documents are only available to the signed-in user who created the document.

App Center Data requires identity to utilize private documents. Private documents can only be modified by the user who created them. This allows authenticated users to have their data persisted to their identity, enabling them to access their data regardless of the platform or device they are using. For more information, check out the [Auth documentation](../auth/index.md).
