---
title: Export Push Data 
description: How to export personal information from Push to your users
keywords: GDPR, DSR, privacy, EU
author: iageoghe
ms.author: iageoghe
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 9ECEFC64-8C9E-4035-9261-CEDA5D6D4191
ms.service: vs-appcenter
---

# Export Push Data

In App Center Push, your customer's information can be in the following fields:

* Custom Properties used to define your audience

    If you are using Custom Properties in App Center Analytics, every device registered for push notifications is associated with a number of custom properties. Other device related information is associated as well such as language, country, etc. More about custom properties and how to use it in Push can be found here.

* Audience definition and description

    This is only if you are using a App Center Push's Audience feature to send push notifications; if you are pushing directly to install IDs, you don’t have to worry about this.

* Push Notification: message details, or the campaign description

    This data is stored for every Push Notification you make, regardless of whether you are using an Audience or device IDs. This data includes the Push Notification title, body, and any custom data you have added to customize your Push Notification.

To get a copy of any personal information associated with your end-user for Push, there are three different APIs you must call, each corresponding to one of the categories listed above.

## Custom Properties used to define your audience

**1. Get information for all devices that registered for push notifications**

The [Export Devices API](https://openapi.appcenter.ms/#/push/Push_ExportDevices) returns a copy of all device information registered for push notifications for your app, and stores it in an Azure Blob Storage container:

```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/push/devices/export
```

Body: {SAS Token for the container}

> [!NOTE]
> You must have an Azure Blob storage account to retrieve the information. Here's [Getting started information](https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=portal) on Azure Blob storage accounts.
> Once you have created an Azure Blob storage container, you can use information in the [Authorize with SAS](https://docs.microsoft.com/en-us/azure/storage/common/storage-dotnet-shared-access-signature-part-1#example-create-a-stored-access-policy) article to get the SAS token for a specific container.

The POST method call returns a status code and an export ID which can later be used to [check the status of the export request](https://openapi.appcenter.ms/#/push/Push_ExportDevicesStatus).

To retrieve status for this Export request, can use the following App Center API:

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/push/devices/export/{export_id}
```

A status indicating completion indicates that the data will has been copied the Azure Blob storage container provided in the export request.

Additional information can be found in the [Push Export API documentation](https://openapi.appcenter.ms/#/push/Push_ExportDevicesStatus).

>[!NOTE]
>Each row of the exported document will be a valid JSON Object, but the whole document will not be a valid JSON file.

**2. Search in the data you exported in step 1 for user identifier data**

Search for user data associated with the custom property; for example: user_id = "1234'. This will provide you with the install ID, or if you already have the install ID you can search by it.

**3. Retrieve personal information for the user**

Go through the data retrieved in Step 2, package it, and transmit this data your user.

### Push Segment definition

In order to send your push campaign to your users you can use either installation IDs, or an audience for customers you would like to target who meet certain criteria for your campaign. If you go with a list of installation IDs, you can skip this section. Otherwise, you must follow these steps to send your customers any personal information residing in the audience name, definition, or description.

Here’s a summary of what you need to do:

* Retrieve all Audiences under your App
* Get the Audience name(s) which have customer information
* Send a copy of the Audience information retrieved in Step 2 to your customer

**1. Retrieve all Audiences under your App**

Use the [App Center List Audiences API](https://openapi.appcenter.ms/#/analytics/Analytics_ListAudiences) to retrieve all Audience information under your app:

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/analytics/audiences
```

**2. Get the Audience name(s) which has customer information**

Go through the list retrieved in step 1, and search for any audience information that contains your customer’s information and keep a list of audience name(s).

**3. Send a copy of the data retrieved in Step 2 to your customer**

Using the [App Center Get Audiences](https://openapi.appcenter.ms/#/analytics/Analytics_GetAudience) API, make a call for each of the audience names retrieved in step 2:

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/analytics/audiences/{audience_name}
```

Every time you send a push notification (campaign), the push notification details and stats are stored under a unique Notification ID. This information could potentially contain personal information that belongs to your users targeted with these push notifications. To delete Push Notification information for a give push campaign, follow these steps:

* Retrieve all Push Notifications under your App
* Get the Push Notification IDs for the Push Notification that contains the customer’s information
* Send a copy of the Push Notification retrieve in the previous step to your customer

**1. Retrieve all Push Notifications under your App**

Use the [App Center Push List API](https://openapi.appcenter.ms/#/push/Push_List) to retrieve the list of push notifications associated with your App by App name:

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/push/notifications
```

**2. Get the Push Notification IDs for the Push Notification that contains the customer’s information**

Search through all Push Notifications, find push notification containing your customer’s personal information, and generate a list of associated Push Notification IDs.

**3. Send a copy of the Push Notification retrieve in Step 1 to your customer**

For each Push Notification ID returned in Step 2, use the [App Center Push Get API](https://openapi.appcenter.ms/#/push/Push_Get) for each:

```
GET https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/push/notifications/{notification_id}
```
