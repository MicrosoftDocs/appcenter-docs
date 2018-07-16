---

title: Diagnostics Features
description: An introduction to the App Center Diagnostics feature set
keywords: crashes, errors, analytics, attachments, events, key value pairs, export data, threads, bug tracker
author: winnieli1208
ms.author: yuli1
ms.date: 07/02/2018
ms.topic: article
ms.assetid: 9117122d-c874-40a7-8672-3b723a09b23d
ms.service: vs-appcenter
ms.custom: analytics 
---

# Diagnostics Features

In this section, you will learn about the feature set available for the App Center’s diagnostic service.

## Crash and Errors Analytics

In App Center Diagnostics, you can view out of the box analytics to understand when a crash or error occurs in your app.  

The left chart indicates the percentage of crash-free users per day and the right chart shows how many times your app is crashing per day. You can filter the charts by app version, time frame and status.  

![App Center shows you analytics on crashes and errors](~/diagnostics/images/crash-analytics.png)

## Grouping

App Center Diagnostics groups crashes by similarities, for example the reason for the crash and where the crash occurred in the app. Select a crash group to view more information, and access a list of detailed crash reports and logs. This allows you to dive even deeper and use our feature set to better understand your app's behavior during a crash.

![App Center groups crashes and errors based on similarities](~/diagnostics/images/crash-groups.png)

### Attachments

In the App Center Diagnostics UI, you can attach, view and download one binary and one text attachment to your crash reports.

You can learn how to add attachments to your crash reports by reading the SDK Crashes documentation for your [Android](~/sdk/crashes/android.md#add-attachments-to-a-crash-report), [iOS](~/sdk/crashes/ios.md#add-attachments-to-a-crash-report), [macOS](~/sdk/crashes/macos.md#add-attachments-to-a-crash-report), [React Native](~/sdk/crashes/react-native.md#add-attachments-to-a-crash-report), [Xamarin](~/sdk/crashes/xamarin.md#add-attachments-to-a-crash-report), and [Apache Cordova](~/sdk/crashes/cordova.md#add-attachments-to-a-crash-report) apps.

To view and download the attachments, select a crash group, a specific device report and then click on the attachments tab.

![App Center allows you to add attachments to your crash and error reports](~/diagnostics/images/attachments.png)

### Events Before A Crash

Track events leading up to a crash to capture useful information about the state of your app.

To define a custom event, check out our [SDK Documentation](~/sdk/index.md) for [Android](~/sdk/analytics/android.md), [iOS](~/sdk/analytics/ios.md), [React Native](~/sdk/analytics/react-native.md), [Xamarin](~/sdk/analytics/xamarin.md), [UWP](~/sdk/analytics/uwp.md) and [macOS](~/sdk/analytics/macos.md).

To view events before a crash, select a crash group, a specific device report, and then click on the events tab.

![App Center allows you to track events leading up to your crash](~/diagnostics/images/events.png)

### Key Value Pairs

Xamarin developers can tailor the error report sent to App Center to include additional context for the error by passing a dictionary of string values (as key/value pairs) to the `TrackError` method. These properties are completely optional.

For example:

```csharp
try
{
    using (var text = File.OpenText("saved_game001.txt"))
    {
        Console.WriteLine("{0}", text.ReadLine());
        ...
    }
}
catch (FileNotFoundException ex)
{
    Crashes.TrackError(ex, new Dictionary<string,string>{
        { "Filename", "saved_game001.txt" },
        { "Where", "Reload game" },
        { "Issue", "Index of available games is corrupted" }
    });
}
```

Here the full exception (`ex`) is sent back to the App Center service, plus a dictionary containing additional debugging information as well.

> [!NOTE]
> This feature is only supported for Xamarin Errors today


### Export Diagnostics Data

App Center can export diagnostics (crashes and errors) raw data to Azure. Export diagnostics data to Blob Storage for customization (editing) of the data.  

In order to export crashes, attachments and errors, you must call the [Export Configurations API](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create):

```HTTP
POST /v0.1/apps/{owner_name}/{app_name}/export_configurations
```

In the `exportEntities` field of the API property, you must indicate what type of data you wish to export: crashes, errors, attachments.

Learn more about the benefits of, and how to export your data in the [export documentation](~/analytics/export.md).  

### Threads

In a crash report, you can see the current threads that were active when the app crashed. The thread that crashed is highlighted in red for you to better understand the state of the app.  

![App Center shows you current threads at the time of the crash](~/diagnostics/images/threads.png)

## Configure Alerts

Stay on top of your crashes by configuring your App Center app definition settings to send an email when a new crash group is created. To configure these alerts:

1. Log into App Center and select your app
2. In the left menu, navigate to the Settings
3. Click on Email Notifications
4. Select the box next to Crashes  

![App Center shows you current threads at the time of the crash](~/diagnostics/images/email-notifications.png)

You can learn more about notification in our [App Center dashboard documentation](~/dashboard/email-notifications/index.md).  

## Create a Bug Tracker

You can integrate third party bug tracker tools with App Center to stay informed and better manage your crashes. Read the [bug tracker documentation](~/dashboard/bugtracker/index.md) to learn how to get started.  
