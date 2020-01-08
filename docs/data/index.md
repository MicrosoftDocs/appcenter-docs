---
title: Managing Data with the App Center Data Service
description: Introduction to the App Center Data Service
keywords: MBaaS
author: Zakeelm
ms.author: Zakeelm
ms.date: 01/08/2020
ms.topic: article
ms.assetid: 82a2eef5-497f-45c3-849d-6b005bfcbb48
ms.service: vs-appcenter
ms.custom: MBaaS
---

# App Center Data

App Center Data (currently in preview) enables developers to solve some of the significant problems associated with data. Many apps require data persistence in the cloud, which is the core of what App Center Data offers. App Center Data is a data management service that enables apps to manage, persist, and sync application data in the cloud across different devices and platforms in both online and offline scenarios.

The Data client SDK enables developers to manage both shared data and private data for each authenticated user. Apps should work seamlessly regardless of connectivity.  App Center Data supports offline data scenarios. Developers can easily configure their app to perform both offline reads and writes with our SDK.

[Cosmos DB](https://azure.microsoft.com/free/cosmos-db) is Microsoft's globally distributed multi-model database service. App Center Data is built on top of Cosmos DB, which scales as your user base and number of apps grow. This structure ensures low latency, high availability, and high scalability for all of your data. If you would like to learn more about how Cosmos DB works within Data, refer to the [Understanding Cosmos DB docs](~/data/understanding-cosmos-db.md).

![How Data Works](~/data/images/data-architecture.png)

## How It Works

App Center Data is powered by Cosmos DB and enables you to manage and persist your app's data in the cloud.

App Center Data has a one-collection model. Cosmos DB databases can have multiple collections within them. App Center Data enables one of these collections to be connected to App Center.

These collections are made of documents with no schema. Documents are grouped together by a partition key.

The service supports two kinds of documents:

* **Private:** Documents that give read/write access to an authenticated user via AAD B2C.
* **Public:** Documents with read access available to all users (for example, global settings).

![How Partitions Work](~/data/images/data-partitions.png)

Private documents consist of user data. These documents are tied to a user's identity via Azure AD B2C and the user has read and write permissions for those documents.

For example, an app that saves your favorite restaurants and displays a list of all the top restaurants in your area.  

Your list of saved restaurants is unique to your account. If you log in as another user, that information is no longer available. If you log into your original account on another device, you'll be able to see your list of favorite restaurants again. The data associated with your account is persisted in the cloud and readily available after authentication. This type of data exists in private documents and belong to their own partition.

The list of all the top restaurants in your area would be visible to all app users. Say you define a top restaurant using ratings and popularity metrics. This information isn't tied to a specific user and is global, so it's stored in a public document in the public read-only logical partition.

Managing documents and data within them can be done in the App Center Data client SDKs, directly in the Azure portal, or both. Our SDKs allow you to create, read, update, and delete documents as well as define the behavior around how data flows through your app; all with a few lines of code.

### Offline

App Center Data supports offline reads and writes. For both reads and writes, all documents are cached locally with an infinite time-to-live (TTL) by default. Developers may also choose a custom time-to-live (TTL). If connectivity is lost, users will still have the ability to read these cached documents. If a user attempts a write with no connectivity, it's cached locally in accordance with their TTL, and uploaded once connectivity is regained. Conflicts that occur during writes will be resolved using "last write wins".

## Key Capabilities  

| Key Features                           | Description |
| -------------------------------------- | ----------- |
| Provision a new Cosmos DB database     | App Center enables you to easily provision a new Cosmos DB database with required prerequisites directly in the Portal |
| Connect an existing Cosmos DB database | Connect existing CosmosDB databases and associated collections  |
| Client SDKs                            | Native Android, iOS, Xamarin (Android and iOS), and React Native SDKs that allow you to easily manage both private and public app data |
| Offline Reads & Writes                 | Perform Offline Read and Writes in your app, making your app usable in any scenario | 
| Data Explorer                          | Create, read, update, delete, and filter documents directly from the App Center portal |
| Metrics View                           | View metrics associated with your data such as throughput, requests per second, latency, etc.   |

## Limitations

Using App Center Data has a few limitations that you must consider when getting started:

* Existing Cosmos DB databases being connected with App Center Data must use the Cosmos DB Core SQL API.
* Existing Cosmos DB collections **must** use `PartitionKey` as the value of your collections Partition Key. This configuration enables us to handle the partitioning for you. If `PartitionKey` isn't used, linking your database will fail.
* Documents **must** include `document` and `PartitionKey` fields for use with App Center Data.

## Pricing

You pay for your throughput and storage used in Cosmos DB. Pricing in Cosmos DB is measured through Request Units (RUs). The cost of all database operations are normalized and expressed in RUs per second. The cost to read a 1-KB item is one Request Unit. All other database operations are assigned a cost using RUs. If you would like to learn more, refer to the [Request Units in Azure Cosmos DB documentation](https://docs.microsoft.com/azure/cosmos-db/request-units).

## Getting Started

Getting started is easy:

1. Connect your Azure subscription.
2. Provision a new CosmosDB account or connect an existing one.
3. Configure the SDK.
4. Add your first document.

These steps are discussed in further detail in the [Getting Started](~/data/getting-started.md) documentation.
