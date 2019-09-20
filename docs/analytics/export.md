---
title: App Center Export
description: Explain Export feature
keywords: app center, analytics, export
author: blparr
ms.author: blparr
ms.date: 05/30/2019
ms.topic: article
ms.assetid: E050E454-8352-4ED3-AEEC-1526653422DD
ms.service: vs-appcenter
ms.custom: analytics
---

# Export


App Center allows you to continuously export all your Analytics raw data into Azure. You can export Analytics data to both [Blob Storage](https://azure.microsoft.com/services/storage/blobs/) and [Application Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview).
By exporting the data, you benefit from:

- Unlimited data retention
- Detailed Usage Analysis
- Unified dashboard
- Additional rich features from Application Insights such as funnels, retention

App Center continuously exports Analytics data to Application Insights from the moment you configure export along with 2 days of backfilled data.
With the new updated dashboard in Application Insights, App Center users can get a unified view of both Application and Backend Analytics on one dashboard.

App Center continuously exports Analytics data to Blob Storage from the moment you configure export along with 28 days of backfilled data.
[Learn more about Blob Storage](https://azure.microsoft.com/services/storage/blobs/)

You can also export data to Azure General Purpose v2 Storage Blob. General-purpose v2 storage accounts support the latest Azure Storage features and incorporate all of the functionality of general-purpose v1 and Blob storage accounts. 

[Learn more about General Purpose v2 Storage](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview)
[Learn more about Application Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview)


## Azure Blob Storage

Azure Blob storage is a service for storing large amounts of unstructured object data, such as text or binary data, that can be accessed from anywhere in the world via HTTP or HTTPS. You can use Blob storage to expose data publicly to the world, or to store application data privately.

The data is exported every minute and a new subfolder is created each time. The data is stored the *year/month/day/hour/minute* format (for example, *https://<blob-storage-account>.blob.core.windows.net/archive/2017/12/09/04/03/logs.v1.data*) by default when the `blob_path_format_kind` is set to `WithoutAppId`.  When the `config` property is set to `WithAppId`, the data is stored the *appId/year/month/day/hour/minute* format, which prefixes the default path with the appID. The data will take up to 5 minutes to be shown in Azure Blob Storage.

The data is divided in "Analytics" data (sessions, events), "Crashes", "Errors" and "Attachments". [Learn more about exporting diagnositcs data](https://docs.microsoft.com/en-us/appcenter/gdpr/diagnostics-export)

![Data visualization in Azure Blob Storage](~/analytics/images/subfolders.png)

The contents of the blob file is a JSON array of client device logs, that looks like this for Analytics data:

```JSON
[
    {
        "AppId": "046d56b8-ea26-4653-97ba-12b8f99c3ef5",
        "Timestamp": "2017-12-09T04:02:53.618Z",
        "InstallId": "e589a371-ea0c-4479-9a7b-9f834adec040",
        "MessageType": "EventLog",
        "IngressTimestamp": "2017-12-09T04:02:57.987Z",
        "MessageId": "980e21a0-0cbb-48ac-8820-28acf4beb00d",
        "EventId": "ad980536-e743-48a9-ab7e-cb043602d2c9",
        "EventName": "log_out",
        "CorrelationId": "83a2daa9-e5b4-4082-ba4a-ce34b95ab859",
        "IsTestMessage": "False",
        "SdkVersion": "1.0",
        "Model": "PC",
        "OemName": "Samsung",
        "OsName": "Android",
        "OsVersion": "8.1.0",
        "OsApiLevel": "2",
        "Locale": "EN",
        "TimeZoneOffset": "PT2M",
        "ScreenSize": "320x240",
        "AppVersion": "1.1.0",
        "AppBuild": "1",
        "AppNamespace": "com.microsoft.test",
        "CarrierName": "AT&T",
        "CarrierCountry": "US",
        "CountryCode": "US",
        "WrapperSdkVersion": "1.0",
        "WrapperSdkName": "mobilecenter.xamarin","Properties": "{\"extra_00\":\"5bcacf3598ca44ebbbc99e4488cfc854\",\"extra_01\":\"2673e48867c74d51af8dc24c762a8b28\",\"extra_02\":\"5b76c801e5074cd3a13ea37253b94484\",\"extra_03\":\"c1e76aa252c947d4b4bcd4d1d96a7be6\",\"extra_04\":\"caea50034c4f441a963700fa3cf70d03\"}",
        "SessionId": "10df497a-4261-4995-b466-3fd77ac47395",
        "SdkName": "mobilecenter.android",
        "OsBuild": "2",
        "WrapperRuntimeVersion": "None",
        "LiveUpdateDeploymentKey": "stage",
        "LiveUpdatePackageHash": "dsadsdasd3211321233",
        "LiveUpdateReleaseLabel": "2.0"
    }
]
```
## Azure Application Insights

Application Insights is an application performance management (APM) service that offers querying, segmentation, filtering, and usage analytics capabilities over your App Center event data. By adding the App Center SDK to your app and exporting the data into an App Center app-type Application Insights resource, you will get access to the following features:

- [Application Insights Analytics](https://docs.microsoft.com/azure/application-insights/app-insights-analytics). Use a powerful query language to analyze your raw event data and create visualizations. You can export the results of your queries into PowerBI or Excel.
- [Users, Sessions and Events](https://docs.microsoft.com/azure/application-insights/app-insights-usage-segmentation). Learn how many people are using each page and feature of your app, then segment by country, browser, or other properties to understand why.
- [Funnels](https://docs.microsoft.com/azure/application-insights/usage-funnels) and [User flows](https://docs.microsoft.com/azure/application-insights/app-insights-usage-flows). Understand how users navigate through your app. Identify bottlenecks. Discover ways to increase conversion rates and eliminate pain points.
- [Retention](https://docs.microsoft.com/azure/application-insights/app-insights-usage-retention). Discover how many users return to use your app. Find out where and why they drop out.
- [Workbooks](https://docs.microsoft.com/azure/application-insights/app-insights-usage-workbooks). Create interactive workbooks that combine usage analysis visualizations, Application Insights Analytics queries, and text to share insights on your team.

The App Center fields are mapped into Application Insights format. Here is the equivalence between the mapped fields:


| Application Insights            | App Center                                             |
| ------------------------------- | ------------------------------------------------------ |
| timestamp                       | Time of the event                                      |
| name                            | Name of the custom event or type of data               |
| customDimensions                | This includes several fields shown in the table below  |
| session_Id                      | Uniquely session identifier                            |
| user_Id                         | Uniquely user identifier                               |
| application_Version             | Version of the application                             |
| client_Type, client_Model       | Device Model                                           |
| client_OS                       | OS type and version                                    |
| sdkVersion                      | App Center SDK version                                 |

The table below shows the field mapping for the "customDimensions" field.


| Application Insights            | App Center                                     |
| ------------------------------- | ---------------------------------------------- |
|  AppBuild                       | Application build number                       |
|  AppId                          | App Center App ID                              |
|  AppNamespace                   | Application namespace                          |
|  CarrierCountry                 | Carrier country                                |
|  CarrierName                    | Carrier type                                   |
|  EventId                        | App Center Event ID                            |
|  IngressTimestamp               | Log ingestion timestamp                        |
|  Locale                         | Device language                                |
|  MessageType                    | Type of event (session, event, ...)            |
|  OsApiLevel                     | OS API level                                   |
|  OsBuild                        | OS build number                                |
|  OsName                         | OS name                                        |
|  OsVersion                      | OS version                                     |
|  Properties                     | Properties attached to a custom event          |
|  ScreenSize                     | Device's screen size                           |
|  SdkName                        | App Center SDK name                            |
|  SdkVersion                     | App Center SDK version                         |
|  TimeZoneOffset                 | Time zone offset                               |
|  WrapperRuntimeVersion          | App Center SDK wrapper runtime version         |
|  WrapperSdkName                 | App Center SDK wrapper name                    |
|  WrapperSdkVersion              | App Center SDK wrapper version                 |

A sample AI query to retrieve custom events:

```text
customEvents
    | where name == "YourEventName"
    | extend Properties = todynamic(tostring(customDimensions.Properties))
    | extend YourPropertyName = Properties.YourPropertyName
```

More information about Application Insights and App Center:

* Learn about [Application Insights](https://docs.microsoft.com/azure/application-insights/app-insights-overview) in general
* Learn about [Integration with App Center](https://docs.microsoft.com/azure/application-insights/app-insights-mobile-center-quickstart) on AI blog
* Learn about [Better Decisions Through Better Analytics](https://blogs.msdn.microsoft.com/vsappcenter/better-decisions-through-better-analytics-visual-studio-app-center-with-azure-application-insights/) on App Center blog




## Prerequisities

You must have an Azure Subscription to use Export; If you do not have an Azure subscription, create a free  [Azure](https://azure.microsoft.com/en-us/free/) account before you begin.


## Azure Subscription Linking

> [!NOTE]
> This step is only needed for Standard Export; Custom Export doesn't require an Azure subscription.

App Center's standard export of app data to Azure requires an Azure subscription linked to the App Center app. Adding the subscription and linking it to an app needs to be done by the app owner (if the app doesn't belong to an organization) or by the organization's admin.

### Adding an Azure Subscription

- **App belonging to an organization:** If you are the organization admin, go to the **Manage** section under the organization where the app belongs to.
- **App belonging to a user:** If you are the app owner, follow these steps.
1. Login to Appcenter portal
2. Go to user settings.
3. Under Azure, click **Add subscription**
4. Select an existing Azure subscription or create a new one.

### Linking an app to an Azure Subscription

Once you've added your Azure subscription to the user or org account, you need to provide apps with access so that the subscription can be used within that app. By doing this, you are allowing any manager/developer in that app to use the subscription for exporting purposes. Note that this will have an associated cost that will be charged iagainst your Azure Subscription.

## Set up Export

1. On the Appcenter Portal, choose the App.
2. Go to the **App Settings**.
3. Click on **Export** and select the **New Export** option.
4. Select blog storage or Application Insights based on your app needs.
5. Select the type of configuration you want (standard vs custom).

App Center offers two ways to export your data: *standard export* and *custom export*. Standard export allows you to export the data with a one-click experience, using the Azure subscription linked to the app. Custom export will provide you with more flexibility and the configurations will be customized in Azure.

### Standard Export

Standard Export provides a one-click experience for exporting your data. With this option, all required resources are automatically created in Azure.

### Custom Export

Custom Export enables users to customize their export configuration in [Azure](https://portal.azure.com).

**For Blob Storage:**

- Once in the [Azure Portal ](https://portal.azure.com),

1. Click on **Create a new resource**
2. Search for **Storage account** in Search the Marketplace.
3. Click on **Create**, This will open the Create storage account page.
4. Select an Azure Subscription.
5. Choose an existing resource group or create a new one. (A resource group is a container that holds related resources for an Azure solution)
6. For Account kinds, you will see the following drop-down. There are three options supported. Choose what is right for you.
![Supported Blob Storage accounts](~/analytics/images/Export-Storage.png)
7. Click on **Review + create**
8. Once Validation has passed
9. Click **create**
10. Once deployment has succeeded go to the resource
11. Locate **Access Keys** in the Settings tab
12. Copy the **connection string** and add it into your App Center custom configurations. 

![Add the connection string in App Center](~/analytics/images/connectionstring.png)

**For Application Insights:**

1. Sign in to the [Azure Portal ](https://portal.azure.com).
2. Select **Create a resource** > Management Tools > Application Insights.
3. A configuration box will appear
4. Select the **Application Type**to be *App Center application* type.
5. Copy the **instrumentation key** from the Azure portal and add it into your App Center custom configurations. You will find the instrumentation key in the Overview page in the Application Insights resource.

![Add the instrumentation key in App Center](~/analytics/images/instrumentationkey.png)

For Additional details on export to [Application Insights refer to the Quick Start ](https://docs.microsoft.com/en-us/azure/azure-monitor/learn/mobile-center-quickstart).

### Exporting multiple apps to the same storage account

When configuring export for multiple apps, you should create or update a configuration with the `blob_path_format_kind` set to `WithAppId`, which prefixes the export path with the respective appID's. The export configuration creation API was outlined above.  For existing configurations, there is the [following API](https://openapi.appcenter.ms/#/export/ExportConfigurations_PartialUpdate):

```HTTP
PATCH /v0.1/apps/{owner_name}/{app_name}/export_configurations/{export_configuration_id}
```

The changes will take time to propagate, and entities from that point will then be written to the new path.

## Pricing

In order to set up Export, you will need to create an Azure subscription. Exporting the data has an associated cost that will depend on the Azure service you are exporting to. Find the details on pricing for each service at:

[Application Insights pricing](https://azure.microsoft.com/pricing/details/application-insights/)

[Blob Storage pricing](https://azure.microsoft.com/pricing/)


