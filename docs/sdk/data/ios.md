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

The App Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

- Add the data service to your Podfile and run `pod install`

```ruby
pod 'AppCenter/Data'
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
class User {
    var name: String
    var email: String
    var phoneNumber: String
    var identifier: String
    
    init(name: String, email: String, phoneNumber: String) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.identifier = NSUUID().uuidString
    }
    init() {
        self.name = ""
        self.email = ""
        self.phoneNumber = ""
        self.identifier = ""
    }
}
```

By defining this class, you can now easily use instances of it and store them within your documents. Methods like `create` and `replace` enable you to input any type of JSON serializable object, you just have to specify the class within the method. Next, we'll cover exactly how to do this in your code.

For Swift, you will need to also implement the `required init(from dictionary: [AnyHashable : Any])` and `serializeToDictionary() -> [AnyHashable : Any]` methods in your model class. This is so your model can be serialized and deserialized as needed.

```swift
 required init(from dictionary: [AnyHashable : Any]) {
        //sdk turns dictionary to payload
        self.name = dictionary["name"] as! String
        self.email = dictionary["email"] as! String
        self.phoneNumber = dictionary["phoneNumber"] as! String
        self.identifier = dictionary["identifier"] as! String

    func serializeToDictionary() -> [AnyHashable : Any] {
        //creating dictionary out of object
        return ["name": self.name,
                "email": self.email,
            "phoneNumber": self.phoneNumber,
            "identifier": self.identifier]
```

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

- **partition:** The partition that the document will live in.  Use `kMSDataUserDocumentsPartition` to create documents in the authenticated user partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

- **completionHandler:** The completion handler with code to be executed asynchronously after the document has been created.

> [!NOTE]
> Public documents are read-only.

Now, let's create our first document:

```objc
User *user = [[User alloc] initWithName:@"Alex"
                                  email:@"alex@appcenter.ms"
                            phoneNumber:@"+1-(855)-555-5555"];

[MSData createDocumentWithID:user.identifier
                    document:user
                   partition:kMSDataUserDocumentsPartition
           completionHandler:^(MSDocumentWrapper *_Nonnull document) {
             // Do something with the document
           }];
```
```swift
let user = User(name: "Alex", email: "alex@appcenter.ms", phoneNumber: "+1-(855)-555-5555")
MSData.create(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition) { (document) in
  // Do something with the document
}
```

This code snippet creates a document and inserts the details of the `user` object within it. It also includes a completion handler that returns the wrapped document with all of the metadata.

Now, let's take a step further. Say there's the chance of no connectivity when this document is created. By default, offline persistence is enabled with an infinite time-to-live (TTL), meaning offline write is supported and your documents are cached with no expiration time. But, App Center Data also enables you to give these locally cached documents a TTL of your choosing using `writeOptions`, meaning they expire in a time span of your choice.

```objc
User *user = [[User alloc] initWithName:@"Alex"
                                  email:@"alex@appcenter.ms"
                            phoneNumber:@"+1-(855)-555-5555"];

[MSData createDocumentWithID:user.identifier
                    document:user
                   partition:kMSDataUserDocumentsPartition
                writeOptions:[[MSWriteOptions alloc] initWithDeviceTimeToLive:self.deviceTimeToLive]
           completionHandler:^(MSDocumentWrapper *_Nonnull document) {
             // Do something with the document
           }];
```
```swift
let user = User(name: "Alex", email: "alex@appcenter.ms", phoneNumber: "+1-(855)-555-5555")
MSData.create(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition, writeOptions: self.deviceTimeToLive) { (document) in
    // Do something with the document
}
```

You specify the time-to-live (TTL) on a document by using `[[MSWriteOptions alloc] initWithDeviceTimeToLive:timeToLiveInSeconds]` (obj-c) or `MSWriteOptions.init(deviceTimeToLive: timeToLiveInSeconds)` (swift) as the last parameter.

## Reading a Document

Next, we're going to read a document using the `read` method. This method takes three parameters with an optional fourth for offline persistence options. The parameters are the following:

- **ID:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **documentType:** This is a reference to the class type of the of object you're storing in the document. For `User`, it would be `[User class]` (obj-c) or `User.self` (swift).

- **partition:** The partition that the document lives in. This can be `kMSDataAppDocumentsPartition` or `kMSDataUserDocumentsPartition`. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

- **completionHandler:** The completion handler with code to be executed asynchronously after the document has been read.

If the user who created the `user` object wants to view all of their personal data, they could perform a read. Imagine we've created some code in our app that enables the user to fetch their personal data that's stored in the database. Fetching the data would look like this:

```objc
[MSData readDocumentWithID:user.identifier
              documentType:[User class]
                 partition:kMSDataUserDocumentsPartition
         completionHandler:^(MSDocumentWrapper *_Nonnull document) {
                User fetchedUser = [[User alloc] init];
                fetchedUser = document.deserializedValue;
         }];
```
```swift
var fetchedUser = User()
MSData.read(withDocumentId: user.identifier, documentType: User.self, partition: kMSDataAppDocumentsPartition) { (document) in
  // do something with fetched data
  fetchedUser = document.deserializedValue as! User
}
```

The code above fetches the user document from the database and stores it into a new user object. It includes a completion handler that returns the wrapped document with all of the metadata.

Offline persistence is enabled by default with an infinite time-to-live (TTL). But, by utilizing the `readOptions` parameter and specifying a TTL in seconds you can also configure offline read persistence with a specific TTL for the locally cached document, enabling the data to be visible to users even when they're offline once it's cached. You can also declare the lifetime of the data being cached locally with a time span of your choice. Here's an example of this:

```objc
User fetchedUser = [[User alloc] init];

[MSData readDocumentWithID:user.identifier
              documentType:[User class]
                 partition:kMSDataUserDocumentsPartition
               readOptions:[[MSReadOptions alloc] initWithDeviceTimeToLive:self.deviceTimeToLive]
          completionHandler:^(MSDocumentWrapper *_Nonnull document) {
                fetchedUser = document.deserializedValue;
          }];
```
```swift
var fetchedUser = User()

MSData.read(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition, readOptions: self.deviceTimeToLive) { (document) in
  // do something with fetched data
  fetchedUser = document.deserializedValue as! User
}
```

You specify the time-to-live (TTL) on a document by using `[[MSReadOptions alloc] initWithDeviceTimeToLive:timeToLiveInSeconds]` (obj-c) or `MSReadOptions.init(deviceTimeToLive: timeToLiveInSeconds)` (swift) as the last parameter.

## Replacing (Upsert) a Document

If the user wanted to change their email. This action could be possible through a simple `Data.replace` call. The Replace call also doubles as an Upsert, so if you attempt to replace a document with a documentId that doesn't exist, it will create a new document.

 The parameters for replacing a document are the following:

- **ID:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **document:** This is the object itself. This will be the object replaced in your database. For `User`, it would be an instance of the `User` class.

- **partition:** The partition that the document lives in. Use `kMSDataUserDocumentsPartition` to replace documents in the authenticated user partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

- **completionHandler:** The completion handler with code to be executed asynchronously after the document has been replaced.

```objc
User *user = [[User alloc] initWithName:@"Alex"
                                   email:@"alex@microsoft.com"
                             phoneNumber:@"+1-(855)-555-5555"];

[MSData replaceDocumentWithID:user.identifier
                     document:user
                    partition:kMSDataUserDocumentsPartition
            completionHandler:^(MSDocumentWrapper *_Nonnull document) {
              // Do something with the document
            }];
```
```swift
let user = User(name: "Alex", email: "alex@microsoft.com", phoneNumber: "+1-(855)-555-5555")
MSData.replace(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition) { (document) in
  // Do something with the document
}
```

The code above will replace or update an existing document in your database. It also includes a completion handler that returns the wrapped document with all of the metadata. 

By default, offline persistence is enabled by default with a time-to-live (TTL) as infinite. But, by utilizing the `writeOptions` parameter and specifying a TTL in seconds you can also configure how long the documents are cached locally for offline writes.

```objc
User *user = [[User alloc] initWithName:@"Alex"
                                   email:@"alex@microsoft.com"
                             phoneNumber:@"+1-(855)-555-5555"];

[MSData replaceDocumentWithID:user.identifier
                     document:user
                    partition:kMSDataUserDocumentsPartition
                 writeOptions:[[MSWriteOptions alloc] initWithDeviceTimeToLive:self.deviceTimeToLive]
            completionHandler:^(MSDocumentWrapper *_Nonnull document) {
              // Do something with the document
            }];
```
```swift
let user = User(name: "Alex", email: "alex@microsoft.com", phoneNumber: "+1-(855)-555-5555")
MSData.replace(withDocumentId: user.identifier, document: user, partition: kMSDataUserDocumentsPartition,  writeOptions: self.deviceTimeToLive) { (document) in
  // Do something with the document
})
```

You specify the time-to-live (TTL) on a document by using `[[MSWriteOptions alloc] initWithDeviceTimeToLive:timeToLiveInSeconds]` (obj-c) or `MSWriteOptions.init(deviceTimeToLive: timeToLiveInSeconds)` (swift) as the last parameter.

## Deleting a document

In order to delete a document you need to specify the partition type and the document ID.

- **ID:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **partition:** The partition that the document lives in. Use `kMSDataUserDocumentsPartition` to delete documents in the authenticated user partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

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
MSData.delete(withDocumentId: user.identifier, partition: kMSDataUserDocumentsPartition) { (document) in
  // Do something
})
```

By default, offline persistence is enabled by default with a time-to-live (TTL) as infinite. But, by utilizing the `WriteOptions` parameter and specifying a TTL in seconds you can also configure how long the documents are cached locally for offline writes.

```objc
[MSData deleteDocumentWithID:user.identifier
                   partition:kMSDataUserDocumentsPartition
                writeOptions:[[MSWriteOptions alloc] initWithDeviceTimeToLive: self.deviceTimeToLive]
           completionHandler:^(MSDocumentWrapper *_Nonnull document) {
             // Do something
           }];
```
```swift
MSData.delete(withDocumentId: user.identifier, partition: kMSDataUserDocumentsPartition, writeOptions: self.deviceTimeToLive) { (document) in
  // Do something
})
```

## Fetching a list of Documents

Lastly, there is the list functionality. This is used to fetch a list of documents from your database. In order to call list on your database, you need the partition and the document type:

- **documentType:** This is a reference to the class type of the object you're storing in the document. For `User`, it would be `[User class]` (obj-c) or `User.self` (swift).

- **partition:** The partition that the document(s) live in. This can be `kMSDataAppDocumentsPartition` or `kMSDataUserDocumentsPartition`. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

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
MSData.listDocuments(withType: User.self, partition: kMSDataUserDocumentsPartition) { (documents) in
  //Loop over items in the current page
  let currentPageItems = documents.currentPage().items
  for docs in currentPageItems! {
                var tempUser = docs.deserializedValue as! User
                print(tempUser.name)
  }
}
```

This will return a page of the documents that exist within a given user partition.

Offline persistence is enabled by default with an infinite time-to-live (TTL). But, by utilizing the `readOptions` parameter and specifying a TTL in seconds you can also configure a list for offline reads with a specific TTL, enabling the data to be visible to users even when they're offline once it's cached and expiring the locally cached data in a time span of your choice. Here's an example of this:

```objc
[MSData listDocumentWithType:[User class]
                   partition:kMSDataUserDocumentsPartition
                   readOptions:[[MSReadOptions alloc]
                   initWithDeviceTimeToLive:self.deviceTimeToLive]
           completionHandler:^(MSPaginatedDocuments *_Nonnull documents) {
             // Do something here
           }];
```
```swift
MSData.listDocuments(withType: User.self, partition: kMSDataUserDocumentsPartition, readOptions: self.deviceTimeToLive) { (documents) in
  //Loop over items in the current page
  let currentPageItems = documents.currentPage().items
  for docs in currentPageItems! {
                var tempUser = docs.deserializedValue as! User
                print(tempUser.name)
  }
}
```

### Pagination

With the list method, we also support pagination through the `MSPaginatedDocuments` and `MSPage` classes.

The `MSPaginatedDocuments` class has 3 methods which can be used to manage paging:

- boolean `hasNextPage` : Boolean indicating if an extra page is available
- (MSPage *) `currentPage` : Returns the current page
- (void) `nextPageWithCompletionHandler` : Asynchronously fetches the next page. Parameter: Takes a completionHandler callback to accept the next page of documents

The `Page` class has one field of type `NSArray<MSDocumentWrapper *>` called `items`, which represents the documents in the page.

Using the `listWithPartition` or `listDocuments` (swift) call you can fetch paginated data from Cosmos DB. This is handled in the completion handler of the method.

### Advanced offline scenarios

`setRemoteOperationDelegate` method allows to be notified of a pending operation being executed when a client device goes from offline to online. An example of the usage would be the following code snippets.

In the header file:

```objc
@interface MyClass : NSObject <MSRemoteOperationDelegate>

@end
```

Implementation:

```objc
@implementation MyClass

(void)data:(MSData *)data didCompleteRemoteOperation:(NSString *)operation forDocumentMetadata:(MSDocumentMetadata *_Nullable)documentMetadata withError:(MSDataError *_Nullable)error{
  NSLog(@"Operation processed: %@ ", operation);
  if (documentMetadata) {
    NSLog(@"Document: Partition : %@, document id : %@, eTag : %@ ", documentMetadata.partition, documentMetadata.documentId, documentMetadata.eTag);
  }
  if (error) {
    NSLog(@"Error: %@ ", error);
  }
}

@end
```

To setup the callback (delegation):

```objc
MyClass *myClass = [[MyClass alloc] init];
[MSData setRemoteOperationDelegate:myClass];
```
