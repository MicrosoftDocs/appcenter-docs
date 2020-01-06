---
title: App Center Data Migration Guide
description: How to migrate from App Center Data to Azure Cosmos DB
keywords: app center, data
author: zakeelm
ms.author: zakeelm
ms.date: 01/06/2020
ms.topic: article
ms.assetid: 1716caa4-2f34-4385-94ff-8a15eae0d792
ms.service: vs-appcenter
ms.custom: data
---

# App Center Data Migration Guide

We announced that we are shutting down the Visual Studio App Center MBaaS services.

What this means for App Center Data customers is:

* Data Portal UI removed at the end xxx
* Data SDK deprecated at the end of xxx
* Service shutdown at the end of xxx

As an alternative to App Center Data, we recommend that you use [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/) directly for your applications going forward. App Center Data is powered by Cosmos DB and we’ve worked closely with the Cosmos DB team as we’ve built this solution. Due to the close nature of the two services, all your existing data is already in Cosmos DB. By simply logging into Azure and viewing the Azure Data Explorer, you can visibly see and interact with all your existing data.  

There are some differences between the two services, so the purpose of this document is to highlight those differences and guide your migration from App Center Data to Azure Cosmos DB.  

## Service Comparison

Cosmos DB is Microsoft’s globally distributed, multi-model database. Cosmos DB enables developers to elastically and independently scale throughput and storage across supported Azure regions.  

App Center Data is a middle tier service that was built on top of Cosmos DB to provide offline syncing functionality for mobile applications. App Center Data works to assist mobile developers with their data, whereas Cosmos DB itself has a much broader scope and can be used for a much higher variety of scenarios.

The key difference in the two different offerings is what they are and how they work. While App Center Data brings over many of the key benefits of Cosmos DB, they are used differently. As a developer, this means that the way you interact with your data will be different as a result of the deprecation of App Center Data.  You will have to navigate to the Azure portal to access your data, but much of the experience available in the Azure portal will look very familiar. You have all the features that were available in the App Center Portal with several additional features. If you’re curious about the feature offering of Cosmos DB, they are outlined on the [Azure Cosmos DB Informational Page](https://azure.microsoft.com/services/cosmos-db/]). Cosmos DB does not currently have native mobile SDKs, but they do have the following resources that could potentially be used to craft your own solution:

* [Azure Cosmos DB .NET SDK](https://docs.microsoft.com/azure/cosmos-db/sql-api-sdk-dotnet)
* [Azure Cosmos DB .NET Core SDK](https://docs.microsoft.com/azure/cosmos-db/sql-api-sdk-dotnet-core)
* [Azure Cosmos DB Java SDK](https://docs.microsoft.com/azure/cosmos-db/sql-api-sdk-java)
* [Azure Cosmos DB Rest API Reference](https://docs.microsoft.com/rest/api/cosmos-db/)
* [Build Mobile Applications with Xamarin and Cosmos DB tutorial](https://docs.microsoft.com/en-us/azure/cosmos-db/mobile-apps-with-xamarin)

Although the portal experience for App Center Data and Cosmos DB is very similar and you won't notice much of a change, there are some differences that you will notice as you use Cosmos DB.  App Center Data provides additional functionality on top of Cosmos DB targeted for mobile development. Cosmos DB does not include functionality for offline sync functionality or include native mobile SDKs, which is a key benefit of App Center Data for mobile developers. In order to continue using offline syncing, you will have to create an offline solution yourself or use another third-party service that supports offline syncing.

In the App Center Data architecture, a Token Exchange service is utilized, which exchanges an identity for a Cosmos DB resource token. This service both creates Cosmos DB users and gets resource tokens. Upon successful authentication, the client communicates with Cosmos DB directly by way of the Cosmos DB REST APIs. This Token exchange service is responsible for authorization on documents using Cosmos DBs permissions. There are only two types of documents in App Center Data:

* Public: Read permission by any user on a given app
* Private: Read/write to a single authenticated user via AAD B2C/App Center Auth

App Center Data handles these permissions automatically, whereas in Cosmos DB, there is work required to configure document access.  While more work is required, there is more power and versatility with permissions around documents in Cosmos DB. 

In Cosmos DB, you must create users and permissions. Cosmos DB users are associated with a Cosmos database. A Database can contain zero or more Cosmos DB users. A Cosmos DB permissions is associated with a Cosmos DB user. Each user can contain zero or more Cosmos DB permissions. A permission resource provides access to a security token that a user needs when trying to access a specific application resource. There are two available access levels that may be provided by a permission resource:

* All: The user has full permission on the resource. 
* Read: The user can only read the contents of the resource but cannot perform write, update, or delete operations on the resource.

 If you would like more information on this, complete with code snippets, check out the [Secure access to data in Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/secure-access-to-data) docs.

## Migration Guide

App Center Data is built on top of Cosmos DB, meaning there is a direct migration path from App Center Data to Cosmos DB. Your data already exists both in App Center and in your Cosmos DB resource. You can view your data directly in [Azure](https://portal.azure.com/) by navigating to your Cosmos DB resource and viewing the Data Explorer. Everything that’s possible in the App Center web portal is also possible in the Azure portal. Tasks such as viewing your utilization metrics or manipulating your data are readily available in the Azure portal, with some added functionality.  

## Important Links

* [Azure Cosmos DB Documentation](https://docs.microsoft.com/azure/cosmos-db/)
* [Azure Cosmos DB Informational Page](https://azure.microsoft.com/services/cosmos-db/)
