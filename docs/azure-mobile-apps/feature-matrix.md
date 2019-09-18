---
title: App Center and Azure Mobile Apps - Feature Matrix
author: elamalani
ms.author: emalani
ms.date: 09/15/2019
ms.topic: article
ms.assetid: C5AB2B92-0690-4F41-A0E7-43FD3C778059
ms.service: vs-appcenter
---

# App Center and Azure Mobile Apps - Feature Matrix

This section compares services and features that exist in Azure Mobile Apps with App Center. This will give you a better understanding of the features App Center supports as compared to Azure Mobile Apps. **App Center [Auth](https://aka.ms/appcenterauth), [Data](https://aka.ms/appcenterauth), and [Push](https://docs.microsoft.com/en-us/appcenter/push/)** are the new mobile backend services in App Center and they map to Identity, Table Storage, and Push service in Azure Mobile Apps.

## **Generic Features**

|                     Azure Mobile Apps                                              |                                             App Center                     |
|------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Supports native platforms – iOS, Android, Windows for Identity, Table storage and Push | Supports iOS, Android platform for [Auth](https://aka.ms/appcenterauth),[Data](https://aka.ms/appcenterdata), and [Push](https://docs.microsoft.com/en-us/appcenter/push/). Windows platform only supports Push service|
| Cross platform support - Cordova, Xamarin  | Supports Xamarin and React Native for cross platform app development. No Cordova support |                             
| Requires Server SDK for setting up .NET and Node backend | Provides "Out of the Box" experience and no server set up required |

##  **Cloud based Identity Management**

|                  Azure Mobile Apps - Identity Service                                  |                                    App Center - Auth Service            |
|------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Supported Providers - Facebook, Twitter, Microsoft, Google, AAD | Supports Facebook, Google, Microsoft. Only missing provider is AAD and it is a [committed feature](https://github.com/Microsoft/appcenter/wiki/Roadmap#auth) on our roadmap|
| Custom authentication | Not supported but a [committed feature](https://github.com/Microsoft/appcenter/wiki/Roadmap#auth) on our roadmap|                             
| Authentication with the client side SDK | [Supported](https://docs.microsoft.com/en-us/appcenter/auth/getting-started) |
| Authentication with the server side SDK | Provides "Out of the Box" experience by deploying fully configured apps. Developers just need a client SDK to begin |
| Cache auth tokens on the client - Securely store token | [Supported](https://docs.microsoft.com/en-us/appcenter/sdk/auth/android#get-access-token-and-id-token) |
| Refresh tokens for Google, AAD, and Microsoft providers |[Supported](https://docs.microsoft.com/en-us/appcenter/sdk/auth/android#get-access-token-and-id-token) |
| Log out | [Supported](https://docs.microsoft.com/en-us/appcenter/sdk/auth/android#sign-out) |
| Azure portal setup | [App Center](https://appcenter.ms) portal setup for Auth |
| Not Supported | [Enable and disable Auth at runtime](https://docs.microsoft.com/en-us/appcenter/sdk/auth/android#enable-or-disable-app-center-auth-at-runtime) |
| Not Supported | [Check if Auth is enabled](https://docs.microsoft.com/en-us/appcenter/sdk/auth/android#check-if-app-center-auth-is-enabled) |


##  **Storing app data in cloud**

|                  Azure Mobile Apps - Table Storage Service                                  |                              App Center - Data Service            |
|------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Supports Azure SQL Database or on-prem SQL server for data storage | App Center uses **[NoSQL CosmosDB](https://appcenter.ms)** for storing the data in the cloud. **Azure SQL database and on-prem SQL server is not supported** |
| Offline Sync| [Supported](https://docs.microsoft.com/en-us/appcenter/data/#offline) |
| CRUD operations | [Supported](https://docs.microsoft.com/en-us/appcenter/sdk/data/android) |
| Paging Results | [Supported](https://docs.microsoft.com/en-us/appcenter/sdk/data/android#pagination) |
| Query Support ($filter, $top, $skip)| Not currently supported |
| Conflict Resolution | Conflicts that occur during writes will be resolved using "last write wins" |
| Azure portal setup | [App Center](https://docs.microsoft.com/en-us/appcenter/data/getting-started) portal setup for Data |
| Purging records from the offline cache | Not currently supported |


##  **Sending Push notifications to app users**

|                  Azure Mobile Apps - Push Service                                  |                              App Center - Push Service            |
|------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| Uses Azure Notification Hubs to send pushes | [App Center](https://docs.microsoft.com/en-us/appcenter/push/) uses Notification Hubs for sending push messages |
| Allows developers to send notifications to any platform - iOS, Android, Windows, Windows Phone | [Supported](https://docs.microsoft.com/en-us/appcenter/push/app-config) |
| Push notifications to all registered devices | [Supported](https://docs.microsoft.com/en-us/appcenter/push/send-notification#target) |
| Push to specific users | [Supported](https://docs.microsoft.com/en-us/appcenter/push/push-to-user) but limited to up to 100 users |
| Push to specific devices | [Supported](https://docs.microsoft.com/en-us/appcenter/push/send-notification#target) but limited to up to 20 devices |
| Push to a tag | [Supported](https://docs.microsoft.com/en-us/appcenter/push/send-notification#audiences) using Audiences but up to 200 audiences per app with a maximum of 1,000 devices per audience |
| Push personalized and localized notifications | Not currently supported |
| Scheduled Push notifications | Not currently supported |
| Push rich content to devices - images, coupons | [Supported](https://docs.microsoft.com/en-us/appcenter/sdk/push/android#custom-data-in-your-notifications) using custom data in notifications |
| Silent push to a user or device | Supported in App Center but only for iOS platform |
| Tag registration | [Supported](https://docs.microsoft.com/en-us/appcenter/push/send-notification#audiences) by leveraging Push to Audience |
| Template registration | Not currently supported |
| Azure portal setup | [App Center](https://docs.microsoft.com/en-us/appcenter/push/service-config) portal setup for Push |
