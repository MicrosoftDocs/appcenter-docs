---
title: Configuring App Center Data for Xamarin 
description: How to configure App Center data for Xamarin 
keywords: MBaaS
author: Zakeelm
ms.author: Zakeelm
ms.date: 05/07/2019
ms.topic: article
ms.assetid: 68ad36c9-acd1-458a-8816-3b60aeeb8b7a
ms.service: vs-appcenter
ms.custom: MBaaS
dev_langs:
 - csharp
---

# Configuring App Center Data for Xamarin

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
> You can also connect existing databases in the App Center portal. There are some [additional requirements]../../data/index.md#Limitations) associated with this.

> [!IMPORTANT]
> An Azure subscription is required to use App Center Auth and Data.

### 1. Add the App Center Data module

The App Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

#### Visual Studio for Mac

* Open Visual Studio for Mac.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click the **Packages** section, and choose **Add NuGet packages...**.
* Search for **App Center**, and install **App Center Data**.
* Click **Add Packages**.

#### Visual Studio for Windows

* Open Visual Studio for Windows.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click **References** and choose **Manage NuGet Packages**.
* Search for **App Center**, and install **Microsoft.AppCenter.Data**.

#### Package Manager Console

* Open the console in [Visual Studio](https://visualstudio.microsoft.com/vs/). To do this, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.
* If you're working in **Visual Studio for Mac**, make sure you have **NuGet Package Management Extensions** installed. For this, choose **Visual Studio** > **Extensions**, search for **NuGet** and install, if necessary.
* Type the following command in the console:

```shell
Install-Package Microsoft.AppCenter.Data
```

> [!NOTE]
> If you use the App Center SDK in a portable project (such as **Xamarin.Forms**), you must install the packages in each of the projects: the portable, Android, and iOS ones. To do that, you should open each sub-project and follow the corresponding steps described in [Visual Studio for Mac](#visual-studio-for-mac) or [Visual Studio for Windows](#visual-studio-for-windows) sections.

### 2. Start App Center Data

In order to use App Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

Add the App Center Data imports before you get started with using the App Center Data module:

* **Xamarin.iOS** - Open the project's **AppDelegate.cs** and add the following lines below the existing `using` statements
* **Xamarin.Android** - Open the project's **MainActivity.cs** and add the following lines below the existing `using` statements
* **Xamarin.Forms** - Open the project's **App.xaml.cs** and add the following lines below the existing `using` statements

```csharp
using Microsoft.AppCenter;
using Microsoft.AppCenter.Data;
```

Once you have successfully imported everything, add the `Data` class to your `AppCenter.start()` method to start App Center Data.

#### Xamarin.iOS

Open the project's **AppDelegate.cs** and add the `Start()` call inside the `FinishedLaunching()` method:

```csharp
AppCenter.Start("{Your Xamarin iOS App Secret}", typeof(Data));
```

#### Xamarin.Android

Open the project's **MainActivity.cs** and add the `Start()` call inside the `OnCreate()` method:

```csharp
AppCenter.Start("{Your Xamarin Android App Secret}", typeof(Data));
```

#### Xamarin.Forms

To create a Xamarin.Forms app targeting both Android and iOS platforms, you must create two apps in the App Center portal - one for each platform. Creating two apps will give you two App secrets - one for Android and another one for iOS. Open the project's **App.xaml.cs** (or your class that inherits from `Xamarin.Forms.Application`) in the shared or portable project and add the `Start()` call inside the `OnStart()` override method.

```csharp
AppCenter.Start("ios={Your Xamarin iOS App Secret};android={Your Xamarin Android App secret}", typeof(Data));
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret.

To get your app secrets, you can follow the documentation in the [FAQ](https://docs.microsoft.com/appcenter/dashboard/faq).

## Defining a Model

One advantage of NoSQL databases is the ability to use both unstructured and structured data. App Center Data utilizes documents, in which you can store JSON objects. The easiest way to get started is by defining a class that aligns with the type of data you would like to manage. For example, if you wanted to store documents that held relevant information associated with users on my app when they signed up, you may use something like this:

```csharp
public class User {
    public String Name { get; set; }
    public String Email { get; set; }
    public String PhoneNumber { get; set; }
    public Guid Id { get; set; } = Guid.NewGuid(); //generates random id
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

Going forward with the `User` class we defined earlier, let's go over how to create a document. The `CreateAsync` method takes four parameters:

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **T document:** This is the object itself. This will be the object inserted into your database. For `User`, it would be an instance of the `User` class.

- **String partition:** The partition that the document will live in. You will most likely be using the `DefaultPartitions.UserDocuments` option to store this within a specific user's partition.

> [!NOTE]
> Public documents are read-only.

Now, let's create our first document:

```csharp
User user = new User("Jim", "Jim@appcenter.ms", "+1-(855)-555-5555");
await Data.CreateAsync(user.Id.ToString(), user, DefaultPartitions.UserDocuments)
```

This code snippet creates a document and inserts the details of the `user` object within it.

Now, let's take a step further. Say there's the chance of no connectivity when this document is created. App Center Data enables you to persist this document creation when service is regained, so users can still seamlessly use your app offline.

```csharp
User user = new User("Jim", "Jim@appcenter.ms", "+1-(855)-555-5555");
await Data.CreateAsync(user.Id.ToString(), user, DefaultPartitions.UserDocuments, new WriteOptions(TimeToLive.Infinite));
```

This code snippet does the same thing as the first create snippet in this section, but has one distinct difference. This document will be cached locally if the user is offline, then will be persisted to the cloud as soon as they regain connectivity. `new WriteOptions(TimeToLive.Infinite)` will cause this object to be cached indefinitely rather than the default one day.

You can also specify the time-to-live (TTL) on a document by using `new WriteOptions(timeToLiveInSeconds)` as the last parameter.

## Reading a Document

Next, we're going to read a document using the `read` method. This method takes three parameters with an optional fourth for offline persistence options. The parameters are the following:

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **String partition:** The partition that the document lives in. You will most likely be using the `DefaultPartitions.UserDocuments` option to store this within a specific user's partition.

Jim, the user who created the `user` object, wants to view all of his personal data. Say we've created some code in our app that enables Jim to fetch his personal data that's stored in the database. Fetching the data would look like this:

```csharp
var fetchedUser = await Data.ReadAsync<User>(user.Id.ToString(), DefaultPartitions.UserDocuments);
```

The code above fetches the user document from the database and stores it in a new `User` object. By utilizing the `ReadOptions` parameter you can also configure this document for offline reads, enabling the data to be visible to users even when they're offline. Here's an example of this:

```csharp
var fetchedUser = await Data.ReadAsync<User>(user.Id.ToString(), DefaultPartitions.UserDocuments, new ReadOptions(TimeToLive.Infinite));
```

You can also specify the time-to-live (TTL) on a document by using `new ReadOptions(timeToLiveInSeconds)` as the last parameter.

## Replace a Document

Let's say Jim wanted to change his email. This action could be possible through a simple `Replace` call. The parameters for replacing a document are the following:

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **T document:** This is the object itself. This will be the object inserted into your database. For `User`, it would be an instance of the `User` class.

- **Class\<T\> documentType:** This is a reference to the class type of the object you're storing in the document. For `User`, it would be `User.Class`.

- **String partition:** The partition that the document lives in. You will most likely be using the `DefaultPartitions.UserDocuments` option to store this within a specific user's partition.

```csharp
user.Email = "Jim@microsoft.com";
await Data.ReplaceAsync(user.Id.ToString(), user, DefaultPartitions.UserDocuments);
```

You can also configure the replacement document for offline persistence:

```csharp
user.Email = "Jim@microsoft.com";
await Data.ReplaceAsync(user.Id.ToString(), user, DefaultPartitions.UserDocuments, new WriteOptions(TimeToLive.Infinite));
```

You can specify the time-to-live (TTL) on a document by using `new WriteOptions(timeToLiveInSeconds)` as the last parameter.

## Delete a document

In order to delete a document, you need to specify the partition type and the document ID.

- **String documentId:** This is the unique identifier of the document. The characters `#?/\` are not allowed, nor is whitespace.

- **String partition:** The partition that the document lives in. You will most likely be using the `DefaultPartitions.UserDocuments` option to store this within a specific user's partition.

```csharp
await Data.DeleteAsync<User>(user.Id.ToString(), DefaultPartitions.UserDocuments);
```

You can also configure the deleted document for offline persistence:

```csharp
...
await Data.DeleteAsync<User>(user.Id.ToString(), DefaultPartitions.UserDocuments, new WriteOptions(TimeToLive.Infinite));
```

You can specify the time-to-live (TTL) on a document by using `new WriteOptions(timeToLiveInSeconds)` as the last parameter.

## Fetching a list of Documents

Lastly, there is our list functionality. This is used to fetch a list of documents from your database. In order to call list on your database, you need the partition and the document type:

- **Class\<T\> documentType:** This is a reference to the class type of the of object you're storing in the document. For `User`, it would be `User.Class`.

- **String partition:** The partition that the document(s) live in. You will most likely be using the `DefaultPartitions.UserDocuments` option to store this within a specific user's partition.

```csharp
...
var result = await Data.ListAsync<User>(DefaultPartitions.UserDocuments);
```

This will return a page of the documents that exist within a given user partition that align with the `User` class model.

> [!NOTE]
> We don't currently support offline persistance when listing documents.

### Pagination

With the list method, we also support pagination through the `PaginatedDocuments` and `Page` classes. Using the `List` call you can fetch a paginated list of documents from Cosmos DB.

The `PaginatedDocuments` class has four methods, which can be used to manage paging:

* boolean `HasNextPage()` : Boolean indicating if an extra page is available
* Page<T> `CurrentPage()` : Returns the current page
* Page<T> `GetNextPageAsync()` : Asynchronously fetches the next page
* IEnumerator<DocumentWrapper<T>> `GetEnumerator` : This is an enumerator for the paginated docs, which can traverse them

The `Page` class has one field of type `IList<DocumentWrapper<T>>` called `Items`, which represents the documents in the page.

The following code snippet displays how to use pagination:

```csharp
var page = new List<User>();
var result = await Data.ListAsync<User>(DefaultPartitions.UserDocuments);
page.AddRange(result.CurrentPage.Items.Select(a => a.DeserializedValue));
```

The code snippet above will add deserialized value of documents existing in the current page to the `page` variable.
