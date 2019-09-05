---
title: Configuring App Center Data for Android 
description: How to configure App Center data for Android 
keywords: MBaaS
author: Zakeelm
ms.author: Zakeelm
ms.date: 08/16/2019
ms.topic: article
ms.assetid: af1456dc-8eb3-48a3-8989-fb694610f39f
ms.service: vs-appcenter
ms.custom: MBaaS
dev_langs:
 - java
 - kotlin
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

The App Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

   1. Modify the project app level build.gradle file:

        ```groovy
        dependencies {
          def appCenterSdkVersion = '2.3.0'
          implementation "com.microsoft.appcenter:appcenter-data:${appCenterSdkVersion}"
        }
        ```

   2. Make sure to trigger a Gradle sync in Android Studio.

> [!NOTE]
> If the version of your Android Gradle plugin is lower than 3.0.0, then you must replace the keyword `implementation` with `compile`.

### 2. Start App Center Data

In order to use App Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

Add the `Data` class to your `AppCenter.start()` method to start App Center Data.

```java
AppCenter.start(getApplication(), "{Your App Secret}", Data.class);
```

```kotlin
AppCenter.start(application, "{Your App Secret}", Data::class.java)
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret.

To get your app secrets, follow the documentation in the [FAQ](https://docs.microsoft.com/appcenter/dashboard/faq).

Android Studio automatically suggests the required import statement once you add `Data` to the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.data.Data;
import com.microsoft.appcenter.utils.async.AppCenterConsumer;
```

```kotlin
import com.microsoft.appcenter.AppCenter
import com.microsoft.appcenter.data.Data
import com.microsoft.appcenter.utils.async.AppCenterConsumer
```

## Defining a Model

One advantage of NoSQL databases is the ability to use both unstructured and structured data. App Center Data uses documents, in which you can store JSON objects. The easiest way to get started is by defining a class that aligns with the type of data you would like to manage. For example, if you wanted to store documents that held relevant information associated with users on my app when they signed up, you may use something like this:

```java
public class User {
    private String name;
    private String email;
    private String phoneNumber;
    private String id = UUID.randomUUID().toString(); //generates random id
}
```

```kotlin
class User {
    var name: String
    var email: String
    var phoneNumber: String
    var id: String = UUID.randomUUID().toString()
}
```

By defining this class, you can now easily use instances of it and store them within your documents. Methods like `create` and `replace` enable you to input any type of JSON serializable object by specifying the object's class within the method call. Next, we'll cover exactly how to do this in your code.

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

Going forward with the `User` class we defined earlier, let's go over how to create a document. The `create` method takes four parameters. These parameters are:

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **T document:** This is the object itself. This will be the object inserted into your database. For `User`, it would be an instance of the `User` class.

- **Class\<T\> documentType:** This is a reference to the class type of the object you're storing in the document. For `User`, it would be `User.class` (java) or `User::class.java` (kotlin).

- **String partition:** The partition that the document will live in. Use the `DefaultPartitions.USER_DOCUMENTS` option to create a document within an authenticated user's partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

> [!NOTE]
> Public documents are read-only.

Now, let's create our first document:

```java
User user = new User("Alex", "alex@appcenter.ms", "+1-(855)-555-5555");
Data.create(user.id, user, User.class, DefaultPartitions.USER_DOCUMENTS);
```

```kotlin
val user = User("Alex", "alex@appcenter.ms", "+1-(855)-555-5555")
Data.create(user.id, user, User::class.java, DefaultPartitions.USER_DOCUMENTS)
```

This code snippet creates a document and inserts the details of the `user` object within it.

Now, let's take a step further. Say there's the chance of no connectivity when this document is created. By default, offline persistence is enabled with an infinite time-to-live (TTL), meaning offline write is supported and your documents are cached with no expiration time. But, App Center Data also enables you to give these locally cached documents a TTL of your choosing using `WriteOptions`, meaning they expire in a time span of your choice.

```java
User user = new User("Alex", "alex@appcenter.ms", "+1-(855)-555-5555");
Data.create(user.id, user, User.class, DefaultPartitions.USER_DOCUMENTS, new WriteOptions(deviceTimeToLive));
```

```kotlin
val user = User("Alex", "alex@appcenter.ms", "+1-(855)-555-5555")
Data.create(user.id, user, User::class.java, DefaultPartitions.USER_DOCUMENTS, WriteOptions(deviceTimeToLive));
```

You specify the time-to-live (TTL) on a document by using `new WriteOptions(timeToLiveInSeconds)` as the last parameter (omit `new` for kotlin).

## Reading a Document

Next, we're going to read a document using the `read` method. This method takes three parameters with an optional fourth for offline persistence options. The parameters are the following:

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **Class\<T\> documentType:** This is a reference to the class type of the of object you're storing in the document. For `User`, it would be `User.class` (java) or `User::class.java` (kotlin).

- **String partition:** The partition that the document lives in. You can either use `DefaultPartitions.USER_DOCUMENTS` option to read a document that lives in an authenticated user's partition or `DefaultPartitions.APP_DOCUMENTS` to read a document from the read-only public partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

If the user who created the `user` object wants to view all of their personal data, they could perform a read. Imagine we've created some code in our app that enables them to fetch their personal data that's stored in the database. Fetching the data would look like this:

```java
Data.read(user.id, User.class, DefaultPartitions.USER_DOCUMENTS).thenAccept(new AppCenterConsumer<DocumentWrapper<User>>() {

    @Override
    public void accept(DocumentWrapper<User> userDocumentWrapper) {
        if (userDocumentWrapper.getError() == null) {
            User fetchedUser = userDocumentWrapper.getDeserializedValue();
        } else {

            /* Display or handle the error. */
        }
    }
});
```

```kotlin
Data.read(user.id, User::class.java, DefaultPartitions.USER_DOCUMENTS).thenAccept(AppCenterConsumer<DocumentWrapper<User>> { userDocumentWrapper ->
    if (userDocumentWrapper.error == null) {
        val fetchedUser = userDocumentWrapper.deserializedValue
    } else {

        /* Display or handle the error. */
    }
})
```

The code above fetches the user document from the database and stores it in a new `User` object.

Offline persistence is enabled by default with an infinite time-to-live (TTL). But, by utilizing the `ReadOptions` parameter and specifying a TTL in seconds you can also configure offline read persistence with a specific TTL for the locally cached document, enabling the data to be visible to users even when they're offline once it's cached. You can also declare the lifetime of the data being cached locally with a time span of your choice. Here's an example of this:

```java
Data.read(user.id, User.class, DefaultPartitions.USER_DOCUMENTS, new ReadOptions(deviceTimeToLive)).thenAccept(new AppCenterConsumer<DocumentWrapper<User>>() {

    @Override
    public void accept(DocumentWrapper<User> userDocumentWrapper) {
        if (userDocumentWrapper.getError() == null) {
            User fetchedUser = userDocumentWrapper.getDeserializedValue();
        } else {

            /* Display or handle the error. */
        }
    }
});
```

```kotlin
Data.read(user.id, User::class.java, DefaultPartitions.USER_DOCUMENTS, ReadOptions(deviceTimeToLive)).thenAccept { userDocumentWrapper ->
    if (userDocumentWrapper.error == null) {
        val fetchedUser = userDocumentWrapper.deserializedValue
    } else {

        /* Display or handle the error. */
    }
}
```

You specify the time-to-live (TTL) on a document by using `new ReadOptions(timeToLiveInSeconds)` as the last parameter (omit `new` for kotlin).

[!include[](../android-see-async.md)]

> [!NOTE]
> Calling `get()` on any `AppCenterFuture` object returned by any `Data` API on the UI thread will cause a deadlock.
> Always use `thenAccept` to make sure the code runs in background. Calling `get()` is safe only if you are already in a worker thread.

## Replace (Upsert) a Document

If the user wanted to change their email. This action could be possible through a simple `replace` call. The Replace call also doubles as an Upsert, so if you attempt to replace a document with a documentId that doesn't exist, it will create a new document.

The parameters for replacing a document are the following:

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **T document:** This is the object itself. This will be the object replaced in your database. For `User`, it would be an instance of the `User` class.

- **Class\<T\> documentType:** This is a reference to the class type of the object you're storing in the document. For `User`, it would be `User.class` (java) or `User::class.java` (kotlin).

- **String partition:** The partition that the document lives in. Use the `DefaultPartitions.USER_DOCUMENTS` option to replace the document within an authenticated user's partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

```java
user.setEmail("alex@microsoft.com");
Data.replace(user.id, user, User.class, DefaultPartitions.USER_DOCUMENTS);
```

```kotlin
user.setEmail("alex@microsoft.com")
Data.replace(user.id, user, User::class.java, DefaultPartitions.USER_Document)
```

By default, offline persistence is enabled by default with a time-to-live (TTL) as infinite. But, by utilizing the `WriteOptions` parameter and specifying a TTL in seconds you can also configure how long the documents are cached locally for offline writes.

```java
user.setEmail("alex@microsoft.com");
Data.replace( user.id, user, User.class, DefaultPartitions.USER_DOCUMENTS, new WriteOptions(deviceTimeToLive));
```

```kotlin
user.setEmail("alex@microsoft.com")
Data.replace(user.id, user, User::class.java, DefaultPartitions.USER_DOCUMENTS, WriteOptions(deviceTimeToLive))
```

You can specify the time-to-live (TTL) on a document by using `new WriteOptions(timeToLiveInSeconds)` as the last parameter (omit `new` for kotlin).

## Delete a document

In order to delete a document, you need to specify the partition type and the document ID.

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **String partition:** The partition that the document lives in. Use the `DefaultPartitions.USER_DOCUMENTS` option to delete the document from an authenticated user's partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

```java
Data.delete(user.id, DefaultPartitions.USER_DOCUMENTS);
```

```kotlin
Data.delete(user.id, DefaultPartitions.USER_DOCUMENTS)
```

By default, offline persistence is enabled by default with a time-to-live (TTL) as infinite. But, by utilizing the `WriteOptions` parameter and specifying a TTL in seconds you can also configure how long the documents are cached locally for offline writes.

```java
Data.delete(user.id, DefaultPartitions.USER_DOCUMENTS,  new WriteOptions(deviceTimeToLive));
```

```kotlin
Data.delete(user.id, DefaultPartitions.USER_DOCUMENTS,  new WriteOptions(deviceTimeToLive));
```

You can specify the time-to-live (TTL) on a document by using `new WriteOptions(timeToLiveInSeconds)` as the last parameter (omit `new` for kotlin).

## Fetching a list of Documents

Lastly, there is the list functionality. List is used to fetch a list of documents from your database. In order to call list on your database, you need the partition and the document type:

- **Class\<T\> documentType:** This is a reference to the class type of the of object you're storing in the document. For `User`, it would be `User.class` (java) or `User::class.java` (kotlin).

- **String partition:** The partition that the document(s) live in. The partition that the document lives in. You can either use `DefaultPartitions.USER_DOCUMENTS` option to read a document that lives in an authenticated user's partition or `DefaultPartitions.APP_DOCUMENTS` to read a document from the read-only public partition. To use the private document partitions, you **must** be authenticated via [App Center Auth](../../auth/index.md).

```java
Data.list(User.class, DefaultPartitions.USER_DOCUMENTS);
```

```kotlin
Data.list(User::class.java, DefaultPartitions.USER_DOCUMENTS)
```

This will return a page of the documents that exist within a given user partition that align with the `User` class model.

Offline persistence is enabled by default with an infinite time-to-live (TTL). But, by utilizing the `ReadOptions` parameter and specifying a TTL in seconds you can also configure a list for offline reads with a specific TTL, enabling the data to be visible to users even when they're offline once it's cached and expiring the locally cached data in a time span of your choice. Here's an example of this:

```java
Data.list(User.class, DefaultPartitions.USER_DOCUMENTS, new ReadOptions(deviceTimeToLive)).thenAccept( new AppCenterConsumer<PaginatedDocuments<DocumentObject>>() {
     @Override
     public void accept(PaginatedDocuments<DocumentObject> documentWrappers) {
        // Do something here
     }
});
```

```kotlin
Data.list(User::class.java, DefaultPartitions.USER_DOCUMENTS, ReadOptions(deviceTimeToLive)).thenAccept( new AppCenterConsumer<PaginatedDocuments<DocumentObject>>() {
     @Override
     public void accept(PaginatedDocuments<DocumentObject> documentWrappers) {
        // Do something here
     }
});
```

### Pagination

With the list method, we also support pagination through the `PaginatedDocuments` and `Page` classes.

The `PaginatedDocuments` class has a few major methods, which can be used to manage paging:

* boolean `hasNextPage()` : Boolean indicating if an extra page is available
* Page<T> `getCurrentPage()` : Returns the current page
* PaginatedDocuments<T> `setCurrentPage(Page<T> currentPage)` : Sets current page
* Page<T> `getNextPage()` : Asynchronously fetches the next page

The `PaginatedDocuments` class also comes with an iterator of type `Iterator<DocumentWrapper<T>>` to traverse documents

The `Page` class has one field of type `<DocumentWrapper<T>>` called `Items`, which represents the documents in the page.

Using the `List` call you can fetch a paginated list of documents from Cosmos DB. In order to do this, you will use `thenAccept(AppCenterConsumer<T> function)` following your `List` call. This enables you to execute a function once this original computation is executed with the result. An example of the usage would be the following code snippet:

```java
Data.list(User.class, DefaultPartitions.USER_DOCUMENTS).thenAccept( new AppCenterConsumer<PaginatedDocuments<DocumentObject>>() {
     @Override
     public void accept(PaginatedDocuments<DocumentObject> documentWrappers) {
        // Do something here
     }
});
```

```kotlin
Data.list(User::class.java, DefaultPartitions.USER_DOCUMENTS).thenAccept( new AppCenterConsumer<PaginatedDocuments<DocumentObject>>() {
     @Override
     public void accept(PaginatedDocuments<DocumentObject> documentWrappers) {
        // Do something here
     }
});
```

### Advanced offline scenarios

The `setRemoteOperationListener` method allows the client to be notified of a pending operation being executed when the client device goes from offline to online. An example of the usage would be the following code snippet:

```java
Data.setRemoteOperationListener(
    new RemoteOperationListener() {
            @Override
            public void onRemoteOperationCompleted(String operation, DocumentMetadata documentMetadata, DataException error) {
                Log.i(
                    LOG_TAG, 
                    String.format(
                        "Remote operation completed operation=%s partition=%s documentId=%s eTag=%s", 
                        operation, 
                        documentMetadata.getPartition(), 
                        documentMetadata.getId(), 
                        documentMetadata.getETag()), 
                        error);
            }
        };
```
