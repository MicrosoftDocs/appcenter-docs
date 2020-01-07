---
title: Push Migration Guide
description: App Center Push migration guide
author: jwargo
ms.author: jowargo
ms.date: 01/15/2020
ms.topic: article
ms.assetid: FDA09DCF-92A4-423C-B18D-FB0A776DF39C
ms.service: vs-appcenter
---

# Push Migration Guide

We recently announced that we were retiring the Visual Studio App Center MBaaS services. As an alternative to App Center Push, we recommend that you use Azure Notification Hubs for your applications going forward.
You may not have known this, but the App Center Push and Azure Notification Hubs products are maintained by the same team and they offer similar capabilities. There are some differences between the services, so the purpose of this document is to highlight those differences and guide your migration from App Center Push to Azure Notification Hubs.

## Service Comparison

There are some key differences between App Center Push and Azure Notification Hubs; the following sections highlight the differences and how to handle them during your migration.

### Device Registration

The App Center Push SDK automatically handles the device registration for push notifications. When you add the App Center SDK to your app, and enable the Push service, the SDK automatically registers the device for notifications and passes a device token (provided by the native device manufacturer’s push service) to App Center for processing. Once App Center has the device token, it can use it to send push notifications to the device until it expires. Whenever a user launches the application, the App Center SDK automatically refreshes the device token so App Center always has the current one.

If your app sets the user identity using the App Center SDK, the user’s identity is also passed to the Push service so you can send notifications to all the devices for a particular user instead of maintaining that connection elsewhere (like your app backend).

With Azure Notification Hubs, applications must request the device token manually and decide what to do with it:

+ Many applications store the device token in their app backend then use the [Azure Notification Hubs Direct Send](https://docs.microsoft.com/rest/api/notificationhubs/direct-send) API to send notifications to specific devices. This approach allows you to directly target notifications based on application or account data maintained in your app backend.
+ Other applications submit the device token to Azure Notification Hubs using the [Registrations or Installations APIs](https://docs.microsoft.com/azure/notification-hubs/notification-hubs-push-notification-registration-management). This action can happen in mobile app running on the device, or the app backend service. Each approach has its pros and cons plus varies in the ways you target devices for notifications. We recommend you use the [Installations API](https://docs.microsoft.com/dotnet/api/microsoft.azure.notificationhubs.installation?view=azure-dotnet) for maximum manageability and notification flexibility.

### Push Targets

App Center Push supports multiple notification target types and the following table highlights how to implement the same functionality in Azure Notification Hubs.

| App Center Push Target | Azure Notification Hubs Approach |
| ---------------------- | -------------------------------- |
| Audience               | Delivers the same functionality through tags and tag expressions explained in Audiences below |
| Broadcast              | Supported only in the Azure Notification Hubs paid tiers (Basic and Standard) |
| Device or device list  | Supported |
| User or user list      | Supported using tags, see Users below for additional details |

### Audiences

The App Center SDK automatically collects device information at startup and submits it to App Center for use by the difference services. The device properties collected include:

+ Application Version (`appVersion`)
+ Country (`carrierCountry`)
+ Device OS version (`deviceOsVersion`) - populates with API level for Android using `osApiLevel`, and `osVersion` on iOS
+ DeviceModel (`model`)
+ Language (`locale`)
+ OEM (`oemName`)
+ Screen Size (`screenSize`)

Developers can also set custom properties using the SDK, passing app, user, or device-specific data to App Center to use for Analytics, Diagnostics, or Push.

For sending notifications, developers have the option to define [Audiences](~/push/send-notification#audiences) built using these properties (both device and custom) and send notifications to all devices in the audience (within the 1,000 device limit imposed by the service). Audience are refreshed automatically by App Center on a scheduled basis, so they won’t represent changes immediately.

Azure Notification Hubs doesn’t have the concept of audiences. However, both Installations and Registrations support tagging device registrations with up to 60 unique [tags](https://docs.microsoft.com/azure/notification-hubs/notification-hubs-tags-segment-push-message) you can use to target devices for notifications.

Tags are string values and are limited to 120 characters. Azure Notification Hubs supports [tag expressions](https://docs.microsoft.com/azure/notification-hubs/notification-hubs-tags-segment-push-message#tag-expressions) which enable an application to target a subset of your app’s devices based on a Boolean expression built using multiple tag values.

**Limitation:** Tags are string values and only Boolean operations are supported in tag expressions (specifying the existence or non-existence of a particular tag), so any non-string device or custom property available in App Center Push will not work in Azure Notification Hubs.
Campaigns and Sending Notifications from the Portal

Azure Notification Hubs has no concept of campaigns and, except for a simple test panel in the Azure portal, apps must send all notifications using the Azure Notification Hubs REST API.
If you want to mimic the audience builder and send notification capability from App Center Push, you must build the portal UI to support it yourself.

### Users

App Center Push understands the concept of a user identity (set by the app using App Center Auth or using the App Center SDK), and allows you to send notifications to all of the devices associated with one or more users. Azure Notification Hubs does not have any concept of user identity. However, you can mimic App Center Push’s User notifications using [tags](https://docs.microsoft.com/azure/notification-hubs/notification-hubs-tags-segment-push-message#using-tags-to-target-users).

## Benefits of Azure Notification Hubs

Azure Notification Hubs offers mobile app developers many benefits:

+ App Center Push was designed for smaller applications, or at least applications sending notifications to smaller target audiences of 1,000 devices or less. Azure Notification Hubs doesn’t have that limitation, it’s built to support huge application audiences and sending notifications to millions of devices every day.
+ Azure Notification Hubs supports sending notifications to devices running different operating systems with a single API call, App Center Push required a separate API call for each target platform.
+ With the Standard pricing plan, Azure Notification Hubs provides more detailed information about the status of a notification (including delivery success or failure with additional information available for failure).
+ Azure Notification Hubs is available in multiple regions, enabling customers to more easily comply with data confidentiality regulations.

## Migration

We don’t expect customers to manually migrate from App Center Push to Azure Notification Hubs; so before the service shutdown, we’ll provide detailed instructions for how to streamline your app’s migration from App Center Push to Azure Notification Hubs.
