---
title: Understanding Cosmos DB 
description: Cosmos DB and how it relates to the App Center Data service
keywords: MBaaS
author: Zakeelm
ms.author: Zakeelm
ms.date: 05/03/2019
ms.topic: article
ms.assetid: f676a21a-3824-4183-aef7-f58b857eeadd
ms.service: vs-appcenter
ms.custom: MBaaS
---

# Understanding Cosmos DB

App Center Data is built on top of Cosmos DB, Microsoft's globally distributed, multi-model database service. Cosmos DB scales with your user base and technical requirements, and the platform provides low latency and high availability. Cosmos DB offers service level agreements (SLAs) for throughput, latency, availability, and consistency guarantees. It empowers developers to build highly responsive and highly available apps.

## How Cosmos DB works with the Data Service

Documents are the core of App Center Data. Documents exist in a container called a Collection. Data currently supports two types of documents: public and private. Public documents are available and read only for all users, where private documents are readable/writable to an authenticated user via [Azure AD B2C](https://azure.microsoft.com/en-us/services/active-directory-b2c/). These documents are stored within your Cosmos DB database. As documents are created, changed, or deleted, it will be reflected in the Azure Cosmos DB Portal. App Center Data has a one-collection model, meaning that you can only connect one collection within your database to your app in App Center.

App Center Data acts a middle tier service between client devices and resources. Devices talk to the App Center Data service, and an app secret is exchanged for a Cosmos DB resource token. Once this exchange occurs and the client device identity is confirmed, the available resources (i.e. documents) are made available to that device. App users are able to access their data with a simple login. Our client SDKs also give developers create, read, update, and delete (CRUD) capabilities for these documents both online and offline.

> [!NOTE]
> App Center Data only supports the [Cosmos DB SQL API](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-query-reference) today. This means that the Cosmos DB SQL API must be chosen when creating a database in the Azure Cosmos DB portal. If you create one through App Center, this is taken care of automatically.

## Common Cosmos DB terms and concepts found in the Data Service

We've kept most of the core terms and concepts of Cosmos DB in the App Center Data service. As you use the Data Service in both the portal and the SDK, you may see some unfamiliar terms if you've never used Cosmos DB before. This section explains some of the common terms used in App Center that we've bought over from Cosmos DB:

### Cosmos DB Account

To initially use Cosmos DB, you create an Azure Cosmos DB account in your Azure subscription. When using App Center Data to create a new database in the App Center portal, this process is mostly done for you. In this flow in App Center, accounts are referred to as **Instances**.  Accounts are the home of your databases and collections. Your Cosmos DB account is associated with a unique DNS name and can be managed using the Azure portal or CLI.

You can add or remove regions to your Cosmos Account at anytime. Geo-redundancy configuration is not currently supported in the App Center portal, but you can configure it directly in the Azure portal.

### Database

You can create one or more Azure Cosmos databases under your account. Azure Cosmos DB Databases are the unit of management for a set of Azure Cosmos containers.

### Collections

Collections are the unit of scalability for both provisioned throughput and storage. The documents that you add to collections and the throughput you provision on it are automatically distributed across a set of partitions based on the partition key.

### Partitions

A partition consists of a set of **documents** sharing the same partition key (value of the `PartitionKey` field). Partitions are formed based on the value of a partition key that is associated with each item in a collection.


For example, let's say we have a to-do list app where users can login and create, read, update, and delete tasks.

Let's say we also just created an additional screen in our to-do list app that has a list of productivity tips that every user can see.

Documents can live in the public read-only logical partition or the private logical partition, which stores documents belonging to an authenticated user.

The additional screen is an example of data that lives in the public read-only logical partition. These documents are read-only and are publicly visible to consume by all app users.

Next, let's say our user Jim logs in and creates five tasks in our app. These five tasks will all be grouped in the database by his unique partition key. If another user logs into our app, they won't see Jim's five tasks because they are tied to his identity and partition key.  Jim has his own logical partition within the collection that's only available to him.

## Data Modeling

Cosmos DB is a non-relational database, meaning you can easily store unstructured and semi-structured data. When modeling your data in Azure Cosmos DB, it's recommended to treat your entities as self-contained items represented as JSON documents.

When working with relational databases, the strategy is to normalize your data. The rule of thumb in Azure Cosmos DB, in most cases, is to denormalize everything and embed all data into a single item. By doing this, your application may require fewer queries and updates to complete common operations.

Take this JSON snippet:

```JSON
{
    "id": "my-doc-1",
    "PartitionKey": "user-555",
    "document": {
        "listName": "House Chores",
        "taskName": "Walk the dog",
        "description": "It's sunny this week. Take 5 mile hiking trail at the park",
        "relevantDates": {
            "dateCreated": "2019-05-07T09:13:34.234Z",
            "dateDue": "2019-05-09T18:14:32.456Z"
        }
    }
}
```

Generally, we recommend following all of the recommendations and tips Cosmos DB has defined  in [Modeling Data in Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/modeling-data). However, modeling data in the App Center Data service has some additional nuances that are important to note. As always, each document has an id, but documents created for use with the App Center Data service also have "PartitionKey" and "document" fields. These are created by design and are are required for all documents. Values for both these fields are generated when a document is created using the SDK. The partition key dictates where the document lives in the database and the "document" field contains the data belonging to that document in the form of your defined model.
