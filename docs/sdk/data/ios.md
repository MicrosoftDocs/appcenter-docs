---
title: Configuring App Center Data for iOS 
description: How to configure App Center data for iOS 
keywords: MBaaS
author: Zakeelm
ms.author: Zakeelm
ms.date: 05/03/2019
ms.topic: article
ms.assetid: fc653188-e2c5-4e4b-afbc-a9315fb9259e
ms.service: vs-appcenter
ms.custom: MBaaS
dev_langs:
 - objc
 - swift
---

# Configuring App Center Data for iOS

App Center Data is a data management service that lets you manage, persist, and sync your application data in the cloud across different devices and platforms in both online and offline scenarios.

## Prerequisites

- Configure a new Cosmos DB Database
    1. Create a new application project (what we call an **App** in App Center) or open an existing App project
    2. Select the **Data** option in the left project navigation pane
    3. Select the **New Database** button and provision a new Cosmos DB database

- (Optional, but recommended) [Set up App Center Auth](TODO - link-to-docs)
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

The App Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

- Add the data service to your Podfile and run `pod install`

```ruby
pod 'AppCenter/MSData'
```

### 2. Start App Center Data

In order to use App Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

Open the **AppDelegate.m** file and add the following lines below your own import statements.

```objc
@import AppCenter;
@import AppCenterData;
```
```swift
import AppCenter
import AppCenterData
```

In the same file, add the following in your `didFinishLaunchingWithOptions:` delegate method

```objc
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSData class]]];
```
```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSData.self])
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret.

To get your app secrets, you can follow the documentation in the [FAQ](https://docs.microsoft.com/appcenter/dashboard/faq).

## Defining a Model

One advantage of NoSQL databases is the ability to use both unstructured and structured data. App Center Data utilizes documents, in which you can store JSON objects. The easiest way to get started is by defining a class that aligns with the type of data you would like to manage. For example, if you wanted to store documents that held relevant information associated with users on my app when they signed up, you may use something like this:

```objc
@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *identifier = [[NSUUID UUID] UUIDString];

@end
```
```swift
protocol User {
    var name: String
    var email: String
    var phoneNumber: String
    var identifier: String {
        return NSUUID().uuidString
    }
}
```

By defining this class, you can now easily use instances of it and store them within your documents. Methods like `create` and `replace` enable you to input any type of JSON serializable object, you just have to specify the class within the method. Next, we'll cover exactly how to do this in your code.

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

Going forward with the `User` class we defined earlier, let's go over how to create a document. The `create` method takes four parameters:

- **ID:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **document:** This is the object itself. This will be the object replaced in your database. For `User`, it would be an instance of the `User` class.

- **partition:** The partition that the document will live in. You will most likely be using `kMSDataUserDocumentsPartition` to store the document within a specific user's partition.

- **completionHandler:** The completion handler with code to be executed asynchronously after the document has been created.

> [!NOTE]
> Public documents are read-only.

Now, let's create our first document:

```objectivec
User *user = [[User alloc] initWithName:@"Jim"
                                  email:@"Jim@appcenter.ms"
                            phoneNumber:@"+1-(855)-555-5555"];

[MSData createDocumentWithID:user.identifier
                    document:user
                   partition:kMSDataUserDocumentsPartition
           completionHandler:^(MSDocumentWrapper *_Nonnull document) {
             // Do something with the document
           }];
```
```swift
let user = User(name: "Jim", email: "Jim@appcenter.ms", phoneNumber: "+1-(855)-555-5555")
MSData.create(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition, completionHandler: { (document) in
  // Do something with the document
})
```

This code snippet creates a document and inserts the details of the `user` object within it. It also includes a completion handler that returns the wrapped document with all of the metadata.

Now, let's take a step further. Say there's the chance of no connectivity when this document is created. App Center Data enables you to persist this document creation when service is regained, so users can still seamlessly use your app offline.

```objc
User *user = [[User alloc] initWithName:@"Jim"
                                  email:@"Jim@appcenter.ms"
                            phoneNumber:@"+1-(855)-555-5555"];

[MSData createDocumentWithID:user.identifier
                    document:user
                   partition:kMSDataUserDocumentsPartition
                writeOptions:[[MSWriteOptions alloc] initWithDeviceTimeToLive:createInfiniteCacheOptions]
           completionHandler:^(MSDocumentWrapper *_Nonnull document) {
             // Do something with the document
           }];
```
```swift
let user = User(name: "Jim", email: "Jim@appcenter.ms", phoneNumber: "+1-(855)-555-5555")
MSData.create(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition, writeOptions: MSWriteOptions.init(deviceTimeToLive: createInfiniteCacheOptions), completionHandler: { (document) in
    // Do something with the document
})
```

This does the same thing as the first create snippet in this section, but has one distinct difference. This document will be cached locally if the user is offline, then will be persisted to the cloud as soon as they regain connectivity. `createInfiniteCacheOptions` will cause this object to be cached indefinitely rather than the default one day.

You can also specify the time-to-live (TTL) on a document by using `[[MSWriteOptions alloc] initWithDeviceTimeToLive:timeToLiveInSeconds]` (obj-c) or `MSWriteOptions.init(deviceTimeToLive: timeToLiveInSeconds)` (swift) as the last parameter.

## Reading a Document

Next, we're going to read a document using the `read` method. This method takes three parameters with an optional fourth for offline persistence options. The parameters are the following:

- **ID:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **documentType:** This is a reference to the class type of the of object you're storing in the document. For `User`, it would be `[User class]` (obj-c) or `User.self` (swift).

- **partition:** The partition that the document lives in. You will most likely be using `kMSDataUserDocumentsPartition` to store the document within a specific user's partition.

- **completionHandler:** The completion handler with code to be executed asynchronously after the document has been read.

Jim, the user who created the `user` object, wants to view all of his personal data. Say we've created some code in our app that enables Jim to fetch his personal data that's stored in the database. Fetching the data would look like this:

```objc
User fetchedUser = [[User alloc] init];

[MSData readDocumentWithID:user.identifier
              documentType:[User class]
                 partition:kMSDataUserDocumentsPartition
         completionHandler:^(MSDocumentWrapper *_Nonnull document) {
               fetchedUser = document.deserializedValue;
         }];
```

```swift
// TODO should deserialize and assign to variable like android
var fetchedUser = User()
MSData.read(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition, completionHandler: { (document) in
  fetchedUser = document.deserializedValue;
})
```

The code above fetches the user document from the database and stores it into a new user object. It includes a completion handler that returns the wrapped document with all of the metadata.

By utilizing the `readOptions` parameter you can also configure this document for offline reads, enabling the data to be visible to users even when they're offline once it's cached. Here's an example of this:

```objc
User fetchedUser = [[User alloc] init];

[MSData readDocumentWithID:user.identifier
              documentType:[User class]
                 partition:kMSDataUserDocumentsPartition
               readOptions:[[MSReadOptions alloc] initWithDeviceTimeToLive:createInfiniteCacheOptions]
          completionHandler:^(MSDocumentWrapper *_Nonnull document) {
                fetchedUser = document.deserializedValue;
          }];
```

```swift
var fetchedUser = User()

MSData.read(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition, readOptions: MSReadOptions.init(deviceTimeToLive: createInfiniteCacheOptions), completionHandler: { (document) in
  fetchedUser = document.deserializedValue;
})
```

You can also specify the time-to-live (TTL) on a document by using `[[MSReadOptions alloc] initWithDeviceTimeToLive:timeToLiveInSeconds]` (obj-c) or `MSReadOptions.init(deviceTimeToLive: timeToLiveInSeconds)` (swift) as the last parameter.

## Replace a Document

Let's say Jim wanted to change his email. This action could be possible through a simple `Data.replace` call. The parameters for replacing a document are the following:

- **ID:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **document:** This is the object itself. This will be the object replaced in your database. For `User`, it would be an instance of the `User` class.

- **partition:** The partition that the document lives in. You will most likely be using `kMSDataUserDocumentsPartition` to store the document within a specific user's partition.

- **completionHandler:** The completion handler with code to be executed asynchronously after the document has been replaced.

```objc
User *user = [[User alloc] initWithName:@"Jim"
                                   email:@"Jim@microsoft.com"
                             phoneNumber:@"+1-(855)-555-5555"];

[MSData replaceDocumentWithID:user.identifier
                     document:user
                    partition:kMSDataUserDocumentsPartition
            completionHandler:^(MSDocumentWrapper *_Nonnull document) {
              // Do something with the document
            }];
```

```swift
let user = User(name: "Jim", email: "Jim@microsoft.com", phoneNumber: "+1-(855)-555-5555")
MSData.replace(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition, completionHandler: { (document) in
  // Do something with the document
})
```

The code above will replace or update an existing document in your database. It also includes a completion handler that returns the wrapped document with all of the metadata.

You can also configure the replacement document for offline persistence:

```objc
User *user = [[User alloc] initWithName:@"Jim"
                                   email:@"Jim@microsoft.com"
                             phoneNumber:@"+1-(855)-555-5555"];

[MSData replaceDocumentWithID:user.identifier
                     document:user
                    partition:kMSDataUserDocumentsPartition
                 writeOptions:[[MSWriteOptions alloc] initWithDeviceTimeToLive:createInfiniteCacheOptions]
            completionHandler:^(MSDocumentWrapper *_Nonnull document) {
              // Do something with the document
            }];
```

```swift
let user = User(name: "Jim", email: "Jim@microsoft.com", phoneNumber: "+1-(855)-555-5555")
MSData.replace(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition,  writeOptions: MSReadOptions.init(deviceTimeToLive: createInfiniteCacheOptions), completionHandler: { (document) in
  // Do something with the document
})
```

## Delete a document

In order to delete a document you need to specify the partition type and the document ID.

- **ID:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **partition:** The partition that the document lives in. You will most likely be using `kMSDataUserDocumentsPartition` to store the document within a specific user's partition.

- **completionHandler:** The completion handler with code to be executed asynchronously after the document has been deleted.

The following code will delete a document:

```objc
[MSData deleteDocumentWithID:user.identifier
                   partition:kMSDataUserDocumentsPartition
           completionHandler:^(MSDocumentWrapper *_Nonnull document) {
                //document coming from Cosmos DB
           }];
```

```swift
MSData.delete(withDocumentId: user.identifier, partition: kMSDataUserDocumentsPartition,completionHandler: { (document) in
  // Do something after the document
})
```

The following code will delete a document with offline persistence:

```objc
[MSData deleteDocumentWithID:user.identifier
                   partition:kMSDataUserDocumentsPartition
                writeOptions:[[MSWriteOptions alloc] initWithDeviceTimeToLive: createInfiniteCacheOptions]
           completionHandler:^(MSDocumentWrapper *_Nonnull document) {
             // Do something
           }];
```

```swift
MSData.delete(withDocumentId: user.identifier, partition: kMSDataUserDocumentsPartition, writeOptions: MSReadOptions.init(deviceTimeToLive: createInfiniteCacheOptions), completionHandler: { (document) in
  // Do something
})
```

## Fetching a list of Documents

Lastly, there is the list functionality. This is used to fetch a list of documents from your database. In order to call list on your database, you need the partition and the document type:

- **documentType:** This is a reference to the class type of the object you're storing in the document. For `User`, it would be `[User class]` (obj-c) or `User.self` (swift).

- **partition:** The partition that the document(s) live in. You will most likely be using `kMSDataUserDocumentsPartition` to store the document within a specific user's partition.

- **completionHandler:** The completion handler with code to be executed asynchronously after the documents have been read.

Here's how to fetch a list of documents:

```objc
[MSData listDocumentWithType:[User class]
                   partition:kMSDataUserDocumentsPartition
           completionHandler:^(MSPaginatedDocuments *_Nonnull documents) {
             // Do something here
           }];
```

```swift
MSData.list(withType: User.self, partition: kMSDataUserDocumentsPartition, readOptions: MSReadOptions.init(deviceTimeToLive: createInfiniteCacheOptions), completionHandler: { (document) in
  // Do something here
})
```

This will return a page of the documents that exist within a given user partition that align with the `User` class model.

> [!NOTE]
> We don't currently support offline persistance when listing documents.

### Pagination

With the list method, we also support pagination through the `MSPaginatedDocuments` and `MSPage` classes.

The `MSPaginatedDocuments` class has 3 methods which can be used to manage paging:

* boolean `hasNextPage` : Boolean indicating if an extra page is available
* (MSPage *) `currentPage` : Returns the current page
* (void) `nextPageWithCompletionHandle` : Asynchronously fetches the next page. Parameter: Takes a completionHandler callback to accept the next page of documents

The `Page` class has one field of type `NSArray<MSDocumentWrapper *>` called `items`, which represents the documents in the page.

Using the `listWithPartition` call you can fetch paginated data from Cosmos DB. This is handled in the completion handler of the method.

```objc
[MSData listDocumentWithType:[User class]
                   partition:kMSDataUserDocumentsPartition
           completionHandler:^(MSPaginatedDocuments *_Nonnull documents) {
             // Do something here
           }];
```

```swift
MSData.list(withType: User.self, partition: kMSDataUserDocumentsPartition, readOptions: MSReadOptions.init(deviceTimeToLive: createInfiniteCacheOptions), completionHandler: { (document) in
  // Do something here
})
```
