---
title: Xamarin Insights Migration Guide
description: "Moving from Xamarin Insights to Visual Studio App Center"
keywords: xamarin insights
author: blparr
ms.author: blparr
ms.date: 04/11/2018
ms.topic: article
ms.assetid: 4A553E23-D8FF-44A7-B2EA-23AA9B80FAA7
ms.service: vs-appcenter
ms.custom: insights
---
# Visual Studio App Center: the next generation of Xamarin Insights

Visual Studio App Center is the next generation of Xamarin Insights, offering similar feature set and performance, along with a set of other services which will improve your app development pipeline, such as cloud-based builds, app distribution and testing and push notifications.


## Timeline

April 30th, 2018: Xamarin Insights portal will be retired and you will no longer have access to the Xamarin Insights portal.


## Next steps

If you are ready to make the full move to App Center, these are the steps you will need to follow for a successful and smooth migration.

- Remove the Xamarin Insights SDK from all your apps:

    After the Xamarin Insights retirement date, we will set up a service that consumes any logs still being sent by the Xamarin Insights SDK. This consists of a fake ingestion backend endpoint that will be behind the ingestion DNS once the production Insights system goes away. However, this service will just run for a few months after retirement. At that point, without the endpoint being available to the SDKs out there, there is a possibility of the client attempting to cache logs on the device which in turn will cause memory problems and lead to problems in your users apps. Therefore, you must remove the Xamarin Insights SDK to ensure continuity in your apps.
- If you haven’t done so, [sign up in App Center](https://appcenter.ms/apps).
- Integrate the App Center SDK for your [preferred platform](~/sdk/getting-started/xamarin.md). To get the equivalent features as you did in Xamarin Insights, integrate the [Crashes SDK](~/sdk/crashes/xamarin.md) and the [Analytics SDK](~/sdk/analytics/xamarin.md).
- Everything you see in the App Center portal has API support. If you are using the Xamarin Insights APIs, you will have to make the changes to use the [App Center APIs](~/api-docs/index.md). Change the existing Xamarin Insights APIs to the App Center ones. In specific, you will need to look at the [Crashes APIs](https://openapi.appcenter.ms/#/crash) and the [Analytics APIs](https://openapi.appcenter.ms/#/analytics).
- If you have any questions during this process, please contact us via our support system (blue button at the bottom right-hand side).


## Similarities and differences

The following section explains the feature equivalences and differences between Xamarin Insights and App Center.
The two App Center services that cover Xamarin Insights functionality are Analytics and Diagnostics.

### Audience:

The equivalent of the Xamarin Insights Audience is the Analytics Overview Page.
The App Center Overview offers general analytics information about Active Users, Daily Sessions and Session Duration, Top Devices and OS Versions, Top Countries and Languages, Users per app versions, etc.

![App Center Analytics Overview](~/migration/xamarin-insights/images/analytics-overview.png)

Learn more about [Analytics in App Center](~/analytics/index.md).

### Events:

Xamarin Insights and App Center Events both allow you to track your users’ actions. You can also attach custom properties to them, seeing the distribution for the top 10 property values.
While Xamarin Insights accounts with two types of events: timed and standard, App Center just supports the equivalent of the standard type at the moment.

![App Center Events](~/migration/xamarin-insights/images/events.png)

![App Center Event Custom Properties](~/migration/xamarin-insights/images/event-properties.png)

Learn more about [Events in App Center](~/analytics/event-metrics.md).

### Issues:

Issues in Xamarin Insights include Crashes and Warnings. The equivalent of Issues in App Center is called Diagnostics, which is composed by Crashes and Errors.

Both products offer very similar feature set, providing crash/error groups, crash/error instances, detailed stack traces, and breadcrumbs for crashes.

![App Center Breadcrumbs for Crashes](~/migration/xamarin-insights/images/breadcrumbs.png)

![App Center Error Group Overview](~/migration/xamarin-insights/images/errors-overview.png)

Learn more about [Crashes](~/crashes/index.md) and [Errors](~/errors/index.md) in App Center.


### Additions in App Center feature set

App Center is the next generation of Xamarin Insights and as such, it provides a set of new and improved features. Learn more about all the [services](~/index.yml) that App Center offers.

The main addition to App Center Analytics with respect to Xamarin Insights is the ability to continuously export all your raw data to Azure. In specific, you will be able to export your data to Blob Storage or Application Insights.

You can export your data to Blob Storage and build your favorite warehousing solution on top of it. By exporting the data to Application Insights, you will get advanced analytics features, such as funnels or retention charts. It will also provide query capabilities, answering your most app-specific questions, creating custom visualizations using PowerBI, and much more.

Learn more about [Continuous Export](~/analytics/export.md).


### Users

App Center does not currently have a portal experience to identify users and analyze their behavior at the user level. However, we are considering to add this feature in App Center, so please reach out to us with your use cases and help us gather the right requirements!


## Frequently Asked Questions

**Q:** Will my apps with the Xamarin Insights SDK keep working after retirement?

**A:** While your apps with the Xamarin Insights SDK will continue to work for some time, you will need to eventually remove the Xamarin Insights SDK from all your apps to ensure continuity.
<br><br>

**Q:** Can I upgrade to App Center before Xamarin Insights gets retired?

**A:** Absolutely! We encourage you to move to App Center as soon as possible to have the maximum time to do the upgrade. This upgrade includes upgrading the SDKs and APIs, as well as getting familiar with the App Center offering.
<br><br>

**Q:** Do I have to pay in App Center to get the equivalent services I used to get in Xamarin Insights?
**A:** No. App Center Analytics and Diagnostics are completely free services.
<br><br>

**Q:** How is support handled in App Center?
**A:** App Center provides in portal support. Click in the blue button at the bottom right-hand side and ask your question or provide feedback.
<br><br>

**Q:** Can I access my existing Xamarin Insights dashboards after retirement?
**A:** No. Once we reach the retirement date, you will not be able to access the Xamarin Insights portal. Please, make sure you copy over any information you might need.
<br><br>

