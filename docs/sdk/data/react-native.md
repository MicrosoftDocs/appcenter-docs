---
title: Configuring App Center Data for React Native 
description: How to configure App Center data for React Native 
keywords: MBaaS
author: Zakeelm
ms.author: Zakeelm
ms.date: 07/29/2019
ms.topic: article
ms.assetid: 4076c411-5a5d-4331-a024-4893031ebc7f
ms.service: vs-appcenter
ms.custom: MBaaS
ms.tgt_pltfrm: react-native
---

# Configuring App Center Data for Android

App Center Data is a data management service that lets you manage, persist, and sync your application data in the cloud across different devices and platforms in both online and offline scenarios.

## Prerequisites

- Configure a new Cosmos DB Database
    1. Create a new application project (what we call an **App** in App Center) or open an existing App project
    2. Select the **Data** option in the left project navigation pane
    3. Select the **New Database** button and provision a new Cosmos DB database

- (Optional, but recommended) [Set up App Center Auth](../../auth/index.md)
    1. Create your Azure AD B2C tenant
    2. Create an application within the Azure AD B2C service
    3. Configure your scope and policy
    4. Configure App Center Auth SDK

> [!NOTE]
> You can also connect existing databases in the App Center portal. There are some [additional requirements](../../data/index.md#limitations) associated with this.

> [!IMPORTANT]
> An Azure subscription is required to use App Center Auth and Data.

## Add App Center Data to your app

Please follow the [Get Started](../../data/getting-started.md) section if you haven't set up and started the SDK in your application, yet.

### 1. Add the App Center Data module

Open your terminal and navigate to the root directory of your React Native project. Run the following code to add the Data SDK to your app:

```bash
npm install appcenter-data --save-exact
```

### 2. Link the SDK

Starting with React Native 0.60, plugins are autolinked to the project. Run one final step in CocoaPods for iOS:

```bash
cd ios && pod install && cd ..
```

## Defining a Model

One advantage of NoSQL databases is the ability to use both unstructured and structured data. App Center Data uses documents, in which you can store JSON objects. The easiest way to get started is by defining a class that aligns with the type of data you would like to manage. For example, if you wanted to store documents that held relevant information associated with users on my app when they signed up, you may use something like this:

```javascript
const user = {
    name: 'Alex',
    email: 'alex@appcenter.ms',
    phoneNumber: '+1-(855)-555-5555',
    id: 'some-user-id'
}
```

By defining this object, you can now easily use instances of it and store them within your documents. Methods like `create` and `replace` enable you to input any JavaScript object. Next, we'll cover exactly how to do this in your code.

One important thing to note regarding models is how they're structured within CosmosDB documents for use with App Center Data. Your data and model itself can have virtually any structure, but the document must include a few things in order to properly work with the data service. These required fields are `document`, `id`, and `PartitionKey`. Your document should look like this:

```json
{
    "document": {
        //document data here
    },
    "id": "some-document-id-here",
    "PartitionKey": "readonly"
}
```

When creating documents with the Data SDK, they will be automatically created with the right structure, but if you create a document directly through CosmosDB, you have to make sure to have these fields present.

## Creating a Document

Going forward with the `user` object we defined earlier, let's go over how to create a document. The `create` method takes three parameters. These parameters are:

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **document:** This is the object itself. This will be the object inserted into your database. This would be the user object defined previously. 

- **String partition:** The partition that the document will live in. Use the `Data.DefaultPartitions.USER_DOCUMENTS` option to create a document within an authenticated user's partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

> [!NOTE]
> Public documents are read-only.

Now, let's create our first document:

```javascript
import Data from 'appcenter-data';

const user = {
    name: 'Alex',
    email: 'alex@appcenter.ms',
    phoneNumber: '+1-(855)-555-5555',
    id: 'some-user-id'
};

Data.create('some-document-id', user, Data.DefaultPartitions.USER_DOCUMENTS);
```

This code snippet creates a document and inserts the details of the `user` object within it.

Now, let's take a step further. Say there's the chance of no connectivity when this document is created. By default, offline persistence is enabled with an infinite time-to-live (TTL), meaning offline write is supported and your documents are cached with no expiration time. But, App Center Data also enables you to give these locally cached documents a TTL of your choosing using `WriteOptions`, meaning they expire in a time span of your choice.

```javascript
import Data from 'appcenter-data';

const user = {
    name: 'Alex',
    email: 'alex@appcenter.ms',
    phoneNumber: '+1-(855)-555-5555',
    id: 'some-user-id'
};

const deviceTimeToLive = 60 * 60;

Data.create('some-document-id', 
            user, 
            Data.DefaultPartitions.USER_DOCUMENTS, 
            new Data.WriteOptions(deviceTimeToLive)
);
```

You specify the time-to-live (TTL) on a document by using `new Data.WriteOptions(timeToLiveInSeconds)` as the last parameter;

## Reading a Document

Next, we're going to read a document using the `read` method. This method takes three parameters with an optional third for offline persistence options. The parameters are the following:

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **String partition:** The partition that the document lives in. You can either use `Data.DefaultPartitions.USER_DOCUMENTS` option to read a document that lives in an authenticated user's partition or `Data.DefaultPartitions.APP_DOCUMENTS` to read a document from the read-only public partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

If the user who created the `user` object wants to view all of their personal data, they could perform a read. Imagine we've created some code in our app that enables them to fetch their personal data that's stored in the database. Fetching the data would look like this:

```javascript
Data.read('some-document-id', Data.DefaultPartitions.USER_DOCUMENTS)
    .then(function(document) {
        const fetchedUser = document.deserializedValue;
    }).catch(function(e) {
        /* Display or handle the error. */
    });
```

The above code uses `Promises` which can be alternatively expressed using `async`/`await`.

```javascript
try {
    const document = await Data.read('some-document-id', Data.DefaultPartitions.USER_DOCUMENTS);
    const fetchedUser = document.deserializedValue;
} catch(e) {
    /* Display or handle the error. */
}
```

The code above fetches the user document from the database.

Offline persistence is enabled by default with an infinite time-to-live (TTL). But, by utilizing the `ReadOptions` parameter and specifying a TTL in seconds you can also configure offline read persistence with a specific TTL for the locally cached document, enabling the data to be visible to users even when they're offline once it's cached. You can also declare the lifetime of the data being cached locally with a time span of your choice. Here's an example of this:

```javascript
const deviceTimeToLive = 60 * 60;

Data.read('some-document-id', Data.DefaultPartitions.USER_DOCUMENTS, new Data.ReadOptions(deviceTimeToLive))
    .then(function(document) {
        const fetchedUser = document.deserializedValue;
    }).catch(function(e) {
        /* Display or handle the error. */
    });
```

You specify the time-to-live (TTL) on a document by using `new Data.ReadOptions(timeToLiveInSeconds)` as the last parameter.

## Replace (Upsert) a Document

If the user wanted to change their email. This action could be possible through a simple `replace` call. The Replace call also doubles as an Upsert, so if you attempt to replace a document with a documentId that doesn't exist, it will create a new document.

The parameters for replacing a document are the following:

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **document:** This is the object itself. This will be the object inserted into your database. This would be the user object defined previously. 

- **String partition:** The partition that the document lives in. Use the `Data.DefaultPartitions.USER_DOCUMENTS` option to replace the document within an authenticated user's partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

```javascript
user.email = 'alex@microsoft.com';
Data.replace(user.id, user, Data.DefaultPartitions.USER_DOCUMENTS);
```

By default, offline persistence is enabled by default with a time-to-live (TTL) as infinite. But, by utilizing the `WriteOptions` parameter and specifying a TTL in seconds you can also configure how long the documents are cached locally for offline writes.

```javascript
const deviceTimeToLive = 60 * 60;

user.email = 'alex@microsoft.com';
Data.replace(user.id, user, Data.DefaultPartitions.USER_DOCUMENTS, new Data.WriteOptions(deviceTimeToLive));
```

You can specify the time-to-live (TTL) on a document by using `new Data.WriteOptions(timeToLiveInSeconds)` as the last parameter.

## Delete a document

In order to delete a document, you need to specify the partition type and the document ID. Not that `delete` is a keyword in JavaScript, therefore, `remove` is used instead. 

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **String partition:** The partition that the document lives in. Use the `Data.DefaultPartitions.USER_DOCUMENTS` option to delete the document from an authenticated user's partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

```javascript
Data.remove(user.id, Data.DefaultPartitions.USER_DOCUMENTS);
```

By default, offline persistence is enabled by default with a time-to-live (TTL) as infinite. But, by utilizing the `WriteOptions` parameter and specifying a TTL in seconds you can also configure how long the documents are cached locally for offline writes.

```javascript
const deviceTimeToLive = 60 * 60;

Data.remove(user.id, Data.DefaultPartitions.USER_DOCUMENTS, new Data.WriteOptions(deviceTimeToLive));
```

You can specify the time-to-live (TTL) on a document by using `new Data.WriteOptions(timeToLiveInSeconds)` as the last parameter.

## Fetching a list of Documents

Lastly, there is the list functionality. List is used to fetch a list of documents from your database. In order to call list on your database, you need the partition.

- **String partition:** The partition that the document(s) live in. The partition that the document lives in. You can either use `Data.DefaultPartitions.USER_DOCUMENTS` option to read a document that lives in an authenticated user's partition or `Data.DefaultPartitions.APP_DOCUMENTS` to read a document from the read-only public partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

```javascript
const paginatedDocuments = await Data.list(Data.DefaultPartitions.USER_DOCUMENTS);
```

This will asynchronously fetch a page of the documents that exist within a given user partition. 

Offline persistence is enabled by default with an infinite time-to-live (TTL). But, by utilizing the `ReadOptions` parameter and specifying a TTL in seconds you can also configure a list for offline reads with a specific TTL, enabling the data to be visible to users even when they're offline once it's cached and expiring the locally cached data in a time span of your choice. Here's an example of this:

```javascript
const deviceTimeToLive = 60 * 60;

const paginatedDocuments = await Data.list(Data.DefaultPartitions.USER_DOCUMENTS, new Data.ReadOptions(deviceTimeToLive));
```

### Pagination 

The `paginatedDocuments` object resolved from the `list` call has a few major properties and methods, which can be used to manage paging:

* Promise\<boolean> `hasNextPage()` : Asynchronously fetches a boolean indicating if an extra page is available
* Page `currentPage` : Returns the current page object
* Promise\<Page> `getNextPage()` : Asynchronously fetches the next page
* void `close()` : Closes and cleans up the instance of the list operation

The `paginatedDocuments.currentPage` object has a field called `items`, which represents the documents in the page.

The `hasNextPage()` and `getNextPage()` methods will call `close()` automatically if there is not a next page. If it is possible that all pages of a `paginatedDocuments` object will not be retrieved, then `close()` should be called manually to prevent a memory leak.

> [!IMPORTANT]
> Each `Data.list` call creates a instance of the PaginatedDocuments which is persisted until either `hasNextPage()` resolves false, `getNextPage()` resolves null, or `close()` is invoked. 

To fetch additional pages, call the `getNextPage()` method from the `paginatedDocuments` object. The following code snippet demonstrates this, as well as showing different ways to clean up the `paginatedDocuments` object once you are done using it.

```javascript
const paginatedDocuments = await Data.list(Data.DefaultPartitions.USER_DOCUMENTS);
// Do something with paginatedDocuments.currentPage.items
while(await paginatedDocuments.hasNextPage()) {
    const nextPage = await paginatedDocuments.getNextPage();
    if (nextPage.items[0].deserializedValue == "some value") {
        // Do something with nextPage.items[0]
        paginatedDocuments.close(); //paginatedDocuments is cleaned up by manually calling `close()`
        break;
    }
} //paginatedDocuments is cleaned up when `hasNextPage` resolves false
```
