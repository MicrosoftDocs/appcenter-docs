---
title: Sending Push Notifications
description: Instructions on how to send push notifications using the App Center portal.
keywords: app center, push
author: jwargo
ms.author: jowargo
ms.date: 12/21/2018
ms.topic: article
ms.assetid: 4db077ee-b9bf-4dc7-ac21-e8ecc8ee840e
ms.service: vs-appcenter
ms.custom: push
---

# Sending Push Notifications

The Visual Studio App Center Push service (ACPs) offers two ways to send notifications to registered devices:

+ Using the App Center Portal (described in this document)
+ Using the [App Center Push API](~/push/rest-api.md)

When sending notifications through ACPs, you can target destination devices (notification recipients) in the following ways:

+ **All registered devices**: Sends notifications to all registered devices.
+ **Custom devices list**: Sends notifications to up to 20 devices (using the install IDs for the target devices).
+ **Audiences**: Sends notifications to a segment of your app's registered device audience based on a set of device and custom properties. For additional information about creating and managing Audiences, refer to [App Center Push Audiences](~/push/audiences.md).

## Creating a notification

To create a notification using the ACPs, complete the following steps:

1. Log into [App Center](https://appcenter.ms).
2. Using the project navigator on the left side of the page, select the your user account or the organization where the app project is defined, then select the app project from the list that appears.
3. In the project navigator that opens, select **Push**.
4. If you've already configured the ACPs, then App Center opens the app project's Push **Notifications** section and lists the existing **Campaigns** for the selected app. If App Center opens the Push getting started page, then you've not configured the service; complete the App Center Push configuration as described in [Configuring the Push Service](~/push/service-config.md) before returning here.
5. In the upper-right corner of the page, click the **Send notification** button.

At this point, App Center opens the **Send notification** wizard and walks you through the process of creating a campaign and sending the notification. The process consists of the following steps:

1. **Compose**: Define your internal name for the campaign, the title and content for the message, and any custom data (key/value pairs) you want included with the message.
2. **Target**: Specify the target audience for the campaign.
3. **Review**: Review the campaign settings one last time.
4. **Send**: Send the notification to the target audience.

### Compose


![App Center Push Campaign Compose Page](~/push/images/campaign-compose.png)

### Target


### Review


### Send

