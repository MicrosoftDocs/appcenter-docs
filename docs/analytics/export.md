---
title: App Center Export
description: Explain Export feature
keywords: app center, analytics, export
author: blparr
ms.author: blparr
ms.date: 02/21/2019
ms.topic: article
ms.assetid: E050E454-8352-4ED3-AEEC-1526653422DD
ms.service: vs-appcenter
ms.custom: analytics
---

# Export

> [!IMPORTANT]
> To set up an export, you must use an Azure subscription. Exporting the data has an associated cost that will depend on the Azure service you are exporting to.

App Center allows you to continuously export all your Analytics and Diagnostics (full symbolicated crashes and errors and its corresponding stack traces) raw data into Azure. Export Analytics data to both Blob Storage and Application Insights, and export Diagnostics data (crashes and errors) to Blob Storage. By exporting the data, you benefit from:

- Unlimited retention by keeping your data as long as you need to and access to it when needed
- Get answers by querying your raw data
- Customize your own analytics dashboards
- New feature set within Application Insights such as filtering and funnels

For Application Insights, data is continuously exported from the moment export is configured along with 2 days of backfilled data.
With the new updated dashboard in Application Insights, App Center users can get a unified view of both Application and Backend Analytics on one dashboard.

For Blob Storage, data is continuously exported from the moment export is configured along with 28 days of backfilled data.

App Center offers two ways to export your data: *standard export* and *custom export*. Standard export allows you to export the data with a one-click experience, using the Azure subscription linked to the app. Custom export will provide you with more flexibility and the configurations will be customized in Azure.

## Azure Subscription Linking

> [!NOTE]
> This step is only needed for *Standard Export*. For *Custom Export*, you don't need to attach the Azure subscription to App Center.

Exporting an app's data to Azure, using our standard export, requires an Azure subscription linked to the app. Adding an Azure subscription and linking it to an app needs to be done by the app owner (if the app doesn't belong to an organization) or by the organization's admin.

### Adding an Azure Subscription

- **App belonging to an organization:** If you are the organization admin, go to the "Manage" section under the organization where the app belongs to.
- **App belonging to a user:** If you are the app owner, go to user settings.
- Under Azure, click **Add subscription**. Then, you will need to add your Azure credentials and it will let you choose your preferred option from all the Azure subscriptions you have access to.

### Linking an app to an Azure Subscription

Once you have added an Azure Subscription into your user/organization settings, you need to provide apps with access so that the subscription can be used within that app. By doing this, you are allowing any manager/developer in that app to use the subscription for exporting purposes. Note that this will have an associated cost that will be charge into your Azure Subscription.

## Set up Export

1. Go to the **App Settings**.
2. Click on Export and select the **New Export** option.
3. Choose your preferred destination (Blob Storage or Application Insights).
4. Select the type of configuration you want (standard vs custom).

### Standard Export

This provides a one-click experience. When selecting this option, all the resources will be created for you in Azure and the Azure Subscription attached to that app will be used. As mentioned above, this requires having an Azure Subscription linked to your app.

### Custom Export

This option allows you to customize your export configurations in [Azure](https://portal.azure.com).

**For Blob Storage:**

- Create a new resource of type *Storage account* of type *blob*.
- Copy the *connection string* and add it into your App Center custom configurations. You will find the connection string in the Azure portal under Access Keys in the Settings tab.

![Add the connection string in App Center](~/analytics/images/connectionstring.png)

**For Application Insights:**

- Create a new resource of type *Application Insights*.
- Select the Application Type to be *app center app* type.
- Copy the *instrumentation key* from the Azure portal and add it into your App Center custom configurations. You will find the instrumentation key in the Overview page in the Application Insights resource.

![Add the instrumentation key in App Center](~/analytics/images/instrumentationkey.png)

### Export crashes, attachments and errors

To export crashes, attachments and errors, you must execute the [Export Configurations API](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create):

```HTTP
POST /v0.1/apps/{owner_name}/{app_name}/export_configurations
```

In `export_entities`, indicate what type of data you wish to export: crashes, errors, attachments.

In `blob_path_format_kind`, indicate the prefix type for the path to the exported blobs: `WithoutAppId` (default) is *year/month/day/hour/minute*, `WithAppId` is *appId/year/month/day/hour/minute*.

### Exporting multiple apps to the same storage account

When configuring export for multiple apps, you should create or update a configuration with the `blob_path_format_kind` set to `WithAppId`, which prefixes the export path with the respective appID's. The export configuration creation API was outlined above.  For existing configurations, there is the [following API](https://openapi.appcenter.ms/#/export/ExportConfigurations_PartialUpdate):

```HTTP
PATCH /v0.1/apps/{owner_name}/{app_name}/export_configurations/{export_configuration_id}
```

The changes will take time to propagate, and entities from that point will then be written to the new path.

## Azure Blob Storage

Azure Blob storage is a service for storing large amounts of unstructured object data, such as text or binary data, that can be accessed from anywhere in the world via HTTP or HTTPS. You can use Blob storage to expose data publicly to the world, or to store application data privately.

The data is exported every minute and a new subfolder is created each time. The data is stored the *year/month/day/hour/minute* format (for example, *https://<blob-storage-account>.blob.core.windows.net/archive/2017/12/09/04/03/logs.v1.data*) by default when the `blob_path_format_kind` is set to `WithoutAppId`.  When the `config` property is set to `WithAppId`, the data is stored the *appId/year/month/day/hour/minute* format, which prefixes the default path with the appID. The data will take up to 5 minutes to be shown in Azure Blob Storage.

The data is divided in "Analytics" data (sessions, events), "Crashes", "Errors" and "Attachments".

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
        "WrapperSdkName": "mobilecenter.xamarin",
        "Properties": "{\"extra_00\":\"5bcacf3598ca44ebbbc99e4488cfc854\",\"extra_01\":\"2673e48867c74d51af8dc24c762a8b28\",\"extra_02\":\"5b76c801e5074cd3a13ea37253b94484\",\"extra_03\":\"c1e76aa252c947d4b4bcd4d1d96a7be6\",\"extra_04\":\"caea50034c4f441a963700fa3cf70d03\"}",
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

[Learn more about Blob Storage](https://azure.microsoft.com/services/storage/blobs/)

You can also export data to Azure General Purpose v2 Storage Blob. General-purpose v2 storage accounts support the latest Azure Storage features and incorporate all of the functionality of general-purpose v1 and Blob storage accounts. 

[Learn more about General Purpose v2 Storage](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview)

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

## Pricing

In order to set up Export, you will need to create an Azure subscription. Exporting the data has an associated cost that will depend on the Azure service you are exporting to. Find the details on pricing for each service at:

[Application Insights pricing](https://azure.microsoft.com/pricing/details/application-insights/)

[Blob Storage pricing](https://azure.microsoft.com/pricing/)

## Known Limitations

App Center does not preserve case on Properties keys (in event and custom properties logs). This apply to both Azure Blob Storage and Application Insights export configurations.

Examples:

```
Test -> test
TEST -> tEST
```

The issue is tracked on [GitHub](https://github.com/Microsoft/appcenter/issues/94).
