---
title: Diagnostics Features
description: An introduction to the App Center Diagnostics feature set
keywords: crashes, diagnostics, errors, analytics, attachments, events, key value pairs, export data, threads, bug tracker
author: winnieli1208
ms.author: yuli1
ms.date: 07/22/2019
ms.topic: article
ms.assetid: 9117122d-c874-40a7-8672-3b723a09b23d
ms.service: vs-appcenter
ms.custom: analytics 
---

# Diagnostics Features

In this section, you will learn about the feature set available for the App Center’s Diagnostics service.

## Crash and Errors Analytics

In App Center Diagnostics, you can view analytics data generated automatically by App Center to understand when a crash or error occurs in your app.  

By default, App Center displays an app's crashes and errors per day in a side by side view.

Using the top-left tabs, drill down into Crashes and Errors. When you do this, the left chart indicates the number of crashes/errors per day, and the right chart shows the number of affected users. Filter the charts by app version, time frame and status for a more focused view.  

![App Center shows you analytics on crashes and errors](~/diagnostics/images/new-crash-analytics.png)

### Grouping

App Center Diagnostics groups crashes and errors by similarities, such as reason for the issue and where the issue occurred in the app. For each crash and error group, App Center displays the line of code that failed, the class or method name, file name, line number, crash or error type and message for you to better understand these groups at a glance. Select a group to view more information, and access a list of detailed issues reports and logs. This allows you to dive even deeper and use our feature set to better understand your app's behavior during a crash or an error.

![App Center groups crashes and errors based on similarities](~/diagnostics/images/crash-groups.png)

### User Identification

App Center Diagnostics allows you to attach a user ID to your crashes and errors. To do so, use the App Center SDK in your targeted platform [Android](~/sdk/other-apis/android.md), [Apache Cordova](~/sdk/other-apis/cordova.md), [iOS](~/sdk/other-apis/apple.md), [macOS](~/sdk/other-apis/macos.md), [React Native](~/sdk/other-apis/react-native.md), [tvOS](~/sdk/other-apis/tvos.md), [Unity](~/sdk/other-apis/unity.md) and [Xamarin](~/sdk/other-apis/xamarin.md). You will find the user ID associated to a crash or error when clicking on an issue inside of a group.

After attaching a user ID, you can use App Center's search feature to search for crashes with the specified ID. Learn how to do this by following App Center's [search documentation](~/diagnostics/search.md).

> [!NOTE]
> User ID is not yet supported for WPF, WinForms, and UWP applications. Visit our [diagnostics limitations page](~/diagnostics/limitations.md) and our proposed [Windows plan](https://github.com/Microsoft/appcenter/blob/windows/specs/2019-04/Windows-Plan.md) for more details.

### Attachments

In the App Center Diagnostics UI, you can attach, view and download one binary and one text attachment to your crash reports.

You can learn how to add attachments to your crash reports by reading the SDK Crashes documentation for your [Android](~/sdk/crashes/android.md#add-attachments-to-a-crash-report), [Apache Cordova](~/sdk/crashes/cordova.md#add-attachments-to-a-crash-report), [iOS](~/sdk/crashes/ios.md#add-attachments-to-a-crash-report), [macOS](~/sdk/crashes/macos.md#add-attachments-to-a-crash-report), [React Native](~/sdk/crashes/react-native.md#add-attachments-to-a-crash-report), [WPF/WinForms](~/sdk/crashes/wpf-winforms.md#add-attachments-to-a-crash-report) and [Xamarin](~/sdk/crashes/xamarin.md#add-attachments-to-a-crash-report) apps.

To view and download the attachments, select a crash group, a specific device report and then click on the attachments tab.

![App Center allows you to add attachments to your crash and error reports](~/diagnostics/images/new-attachments.png)


### Events Before A Crash

Track events leading up to a crash to capture useful information about the state of your app.

To define a custom event, check out our [SDK Documentation](~/sdk/index.md) for [Android](~/sdk/analytics/android.md), [iOS](~/sdk/analytics/ios.md), [macOS](~/sdk/analytics/macos.md), [React Native](~/sdk/analytics/react-native.md), [Windows](~/sdk/analytics/windows.md) and [Xamarin](~/sdk/analytics/xamarin.md).

To view events before a crash, select a crash group, a specific device report, and then click on the events tab.

![App Center allows you to track events leading up to your crash](~/diagnostics/images/events.png)

### Upload a custom crash

You can upload a custom crash report to App Center and view the details in the App Center Diagnostics UI. 

To upload a custom crash, trigger a `POST` request to [error_upload API](https://openapi.appcenter.ms/#/crash/textError_upload) with the parameters:

- `log`: file with the crash log. Note - the maximum allowed file size is 2MB. 
- `error_user_id`: optional user account ID to associate the crash log to a specific user
- `owner_name`: name of the app owner
- `app_name`: name of the app

An example curl command might look like:

```
curl -X POST "https://api.appcenter.ms/v0.1/apps/troublemakers/crashprobe/errors/upload" 
-H "accept: application/json" 
-H "X-API-Token: XXXXXXXXXXXXXXXX" 
-H "Content-Type: multipart/form-data" 
-F "log=@sample_crash.txt"

```

App Center supports uploading custom crashes in the following format:

```
Package: PACKAGE NAME
Version: VERSION 
OS: OS VERSION
Manufacturer: DEVICE OEM
Model: DEVICE MODEL
Date: DATETIME
CrashReporter Key: APP INSTALLATION UUID

EXCEPTION REASON STRING
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
ANOTHER EXCEPTION REASON STRING
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  at CLASS.METHOD(FILE:LINE)
  ```
  

  

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
> This feature is only supported for Xamarin Errors today.

### Export Diagnostics Data

App Center can export diagnostics (crashes and errors) raw data to Azure. Export diagnostics data to Blob Storage for customization of the data.  

To export crashes, attachments and errors, you must call the [Export Configurations API](https://openapi.appcenter.ms/#/export/ExportConfigurations_Create):

```HTTP
POST /v0.1/apps/{owner_name}/{app_name}/export_configurations
```

In the `exportEntities` field of the API property, you must indicate what type of data you wish to export: crashes, errors, attachments. When doing so, the full symbolicated crashes and corresponding stack traces will be exported. 

Learn more about the benefits of, and how to export your data in the [export documentation](~/analytics/export.md).  

### Threads

In a crash report, you can see the current threads that were active when the app crashed. The thread that crashed is highlighted in red for you to better understand the state of the app.  

![App Center shows you current threads at the time of the crash](~/diagnostics/images/new-threads.png)

> [!NOTE]
> Only the main thread at the time of the error will be available for UWP, WPF and WinForms reports

## Configure Alerts

Stay on top of your crashes by configuring your App Center app definition settings to send an email when a new crash group is created. To configure these alerts:

1. Log into App Center and select your app
2. In the left menu, navigate to **Settings**
3. Click on **Email Notifications**
4. Select the box next to Crashes  

![App Center shows you current threads at the time of the crash](~/diagnostics/images/email-notifications.png)

You can learn more about notification in our [App Center dashboard documentation](~/dashboard/email-notifications/index.md). 

## Create a Bug Tracker

You can integrate third party bug tracker tools with App Center to stay informed and better manage your crashes. Read the [bug tracker documentation](~/dashboard/bugtracker/index.md) to learn how to get started.  

## Set Data Retention

You can set your diagnostics data retention to 28 or 90 days via our APIs, as listed in the [App Center API documentation](https://openapi.appcenter.ms/#/errors/errors_putRetentionSettings), or in the app settings page. If you change your retention setting from 90 to 28 days, any existing diagnostics data older than 28 days will be removed and any new data will only be stored for 28 days.

If you change your settings from 28 to 90 days, older diagnostics data will not be backfilled. If you would like to store your data for more than 90 days, export your raw data to Azure Blob Storage. Read the [export diagnostics data section](~/diagnostics/features.md#export-diagnostics-data) to get started. 

![Data retention setting in the app settings page](~/diagnostics/images/app-settings-retention.png)
