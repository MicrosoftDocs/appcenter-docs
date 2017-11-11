---
title: App Center Export
description: Explain Export feature
keywords: app center, analytics, export
author: blparr
ms.author: blparr
ms.date: 08/27/2017
ms.topic: article
ms.assetid: E050E454-8352-4ED3-AEEC-1526653422DD
ms.service: vs-appcenter
ms.custom: analytics
---

# Export

> [!IMPORTANT]
> In order to set up Export, you will need to use an Azure subscription. Exporting the data has an associated cost that will depend on the Azure service you are exporting to.

App Center Analytics allows you to continuously export all your Analytics raw data into Azure, specifically into Blob Storage and Application Insights. By exporting the data, you benefit from:
- Unlimited retention by keeping your data as long as you need to and access to it when needed
- Get answers by querying your raw data
- Customize your own analytics dashboards
- New feature set within Application Insights such as filtering and funnels

The data will be continously exported since the moment export is configured. The data for the two days previous to the export being configured will also be exported.

App Center offers two ways to export your data: *standard export* and *custom export*. Standard export will allow you to export the data with a one-click experience, using the azure subscription linked to the app. Custom export will provide you with more flexibility and the configurations will be customized in Azure.

## Azure Subscription Linking

> [!NOTE]
> This step is only needed for *Standard Export*. For *Custom Export*, you don't need to attached the azure subscription to App Center.

Exporting an app's data to Azure, using our standard export, requires an Azure subscription linked to the app. Adding an azure subscription and linking it to an app needs to be done by the app owner (if the app doesn't belong to an organization) or by the organization admin.

### Adding an Azure Subscription
- **App belonging to an organization:** If you are the organization admin, go to the "Manage" section under the organization where the app belongs to.
- **App belonging to an user:** If you are the app owner, go to user settings.
- Under Azure, click "Add subscription". Then, you will need to add your Azure credentials and it will let you choose your preferred option from all the Azure subscriptions you have access to.

### Linking an app to an Azure Subscription
Once you have added an Azure Subscription into your user/organization settings, you need to provide apps with access so that the subscription can be used within that app. By doing this, you are allowing any manager/developer in that app to use the subscription for exporting purposes. Note that this will have an associated cost that will be charge into your Azure Subscription.

## Set up Export

1. Go to the **App Settings**.
2. Click on Export and select the **New Export** option.
3. Choose your preferred destination (Blob Storage or Application Insights).
4. Select the type of configuration you want (standard vs custom).

### Standard Export
This provides a one-click experience. When selecting this option, all the resources will be created for you in Azure and the Azure Subscription attached to that app will be used. As mentioned above, this requires to have an Azure Subscription linked to your app.

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

## Azure Blob Storage

Azure Blob storage is a service for storing large amounts of unstructured object data, such as text or binary data, that can be accessed from anywhere in the world via HTTP or HTTPS. You can use Blob storage to expose data publicly to the world, or to store application data privately. Exporting the data to Blob Storage is a good choice for the case where you want to have an extended retention but not necessarily plan to access to the data very often. The data will be exported every minute and a new subfolder will be created. The data will be stored as in the format of *year/month/day/hour/minute*.

The data will take up to 5 minutes to be shown in Azure Blob Storage.

[Learn more about Blob Storage](https://azure.microsoft.com/services/storage/blobs/)

## Azure Application Insights

Application Insights is an application performance management (APM) service that offers querying, segmentation, filtering, and usage analytics capabilities over your App Center event data. By adding the App Center SDK to your app and exporting the data into a App Center app-type Application Insights resource, you will get access to the following features:

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
|  MessageType                    | Type of event (session, event, ...)            |
|  AppId                          | App Center App ID                              |
|  CarrierCountry                 | Carrier Country                                |
|  TimeZoneOffset                 | Time Zone Offset                               |
|  CarrierName                    | Carrier Type                                   |
|  Properties                     | Properties attached to a custom event          |
|  ScreenSize                     | Device's screen size                           |
|  OsApiLevel                     | API Level                                      |
|  Locale                         | Device language                                |


Learn more about [Application Insights](https://docs.microsoft.com/azure/application-insights/app-insights-overview) and the [Integration with App Center](https://docs.microsoft.com/azure/application-insights/app-insights-mobile-center-quickstart).


## Pricing

In order to set up Export, you will need to create an Azure subscription. Exporting the data has an associated cost that will depend on the Azure service you are exporting to. Find the details on pricing for each service at:

[Application Insights pricing](https://azure.microsoft.com/pricing/details/application-insights/)

[Blob Storage pricing](https://azure.microsoft.com/pricing/)
