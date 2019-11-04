---
title: Diagnostics Features
description: An introduction to the App Center Diagnostics feature set
keywords: crashes, diagnostics, errors, analytics, attachments, events, key value pairs, export data, threads, bug tracker
author: winnieli1208
ms.author: yuli1
ms.date: 11/01/2019
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


### Key Value Pairs

You can tailor error reports sent to App Center to include additional context for the error by passing a dictionary of string values (as key/value pairs) to the `TrackError` method. These properties are completely optional. To set key value pairs, take a look at our [Xamarin](~/sdk/crashes/xamarin.md#handled-errors), [WPF/WinForms](~/sdk/crashes/wpf-winforms.md#handled-errors), and [UWP](~/sdk/crashes/uwp.md#handled-errors) documentation.

> [!NOTE]
> This feature is only supported for Xamarin, WinForms, WPF, and UWP Errors today.

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
> On Windows, the report shows only the stack trace from the thread that crashed. Showing the state of other threads at the moment of the crash is not supported on Windows.

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

## Upload reports to App Center

You can upload a crash, error, or attachment log to App Center and view the details in the App Center Diagnostics UI.

To upload a report, call the App Center ingestion endpoint with the headers:

- `Content-Type`: describes the format of the body. App Center currently only supports JSON format.
- `App-Secret`: string that is the unique identifier associated with each app. You can find this in your app settings page.
- `Install-ID`: string that can be any GUID used to keep track of counts.

Log properties:
- `type`: required string with log type - "managedError", "appleError", "handledError" or "errorAttachment".
- `timestamp`: optional string with log timestamp date-time e.g "2017-03-13T18:05:42Z".
- `appLaunchTimestamp`: optional string that specifies timestamp date-time when the app was launched e.g."2017-03-13T18:05:42Z".
- `device`: required object with device characteristics
    - `appVersion`: required string with application version name, e.g. "1.1.0"
    - `appBuild`: required string with application build number, e.g. "42"
    - `sdkName`": required string with name of the SDK. Consists of the name of the SDK and the platform, e.g. "custom.platform"
    - `sdkVersion`: required string with version of the SDK in semver format, e.g. "1.2.0" or "0.12.3-alpha.1"
    - `osName`: required string with OS name, e.g. "android"
    - `osVersion`: required string with OS version, e.g. "9.3.0"
    - `model`: optional string with device model, e.g. "iPad2"
    - `locale`: required string with language code, e.g. "en-US"
    - `timeZoneOffset`: optional offset in minutes (between -840 and 840) from Coordinated Universal Time (UTC) for the device time zone, including daylight savings time, e.g. 120
- `userId`: optional string used for associating logs with users
- `exception`: required object with exception details
    - `type`: required string with exception type
    - `frame`: optional array with stack frames
    - `message`: optional string with exception reason
    - `stackTrace`: optional string with raw stack trace
    - `innerException`: optional array with inner exceptions

You can find examples of how to upload a crash report, error report, and attachment below. For more specifications, you can find the complete file [here](https://in.appcenter.ms/preview/swagger.json).

### Upload a crash report

 The following properties are required to upload a crash report:

- `processId`: required integer with process identifier
- `id`: required string with exception identifier
- `fatal`: required boolean which indicates if the exception resulted in a crash
- `processName`: required string with the process name

To upload a crash report that is not Apple formatted, make sure the log type is set to "managedError."

```shell
curl -X POST \
  'https://in.appcenter.ms/logs?Api-Version=1.0.0' \
  -H 'Content-Type: application/json' \
  -H 'app-secret: 8e14e67c-7c91-40ac-8517-c62ece8424a6' \
  -H 'install-id: 00000000-0000-0000-0000-000000000001' \
  -d '{
  "logs:":
  [
    {
      "type": "managedError",
      "timestamp": "2019-10-08T04:22:23.516Z",
      "appLaunchTimestamp": "2019-09-29T22:22:23.516Z",
      "processId": "123",
      "id": "bca65f46-46ee-451b-83bb-2e358c3f45bf",
      "fatal": true,
      "processName": "com.microsoft.appcenter.demo.project",
      "device": {
        "appVersion": "12.0",
        "appBuild": "1",
        "sdkName": "custom.android",
        "sdkVersion": "1.0.0",
        "osName": "android",
        "osVersion": "9.3",
        "model": "Pixel",
        "locale": "en-US"
      },
      "userId": "TestID",
      "exception": {
        "type": "java.lang.RuntimeException",
        "frames": [
          {
            "className": "android.app.ActivityThread",
            "fileName": "ActivityThread.java",
            "lineNumber": 2575,
            "methodName": "performResumeActivity"
          },
          {
            "className": "android.app.ActivityThread",
            "fileName": "ActivityThread.java",
            "lineNumber": 2603,
            "methodName": "handleResumeActivity"
          },
          {
            "className": "android.app.ActivityThread",
            "fileName": "ActivityThread.java",
            "lineNumber": 2089,
            "methodName": "handleLaunchActivity"
          },
          {
            "className": "android.app.ActivityThread",
            "fileName": "ActivityThread.java",
            "lineNumber": 130,
            "methodName": "access$600"
          },
          {
            "className": "android.app.ActivityThread$H",
            "fileName": "ActivityThread.java",
            "lineNumber": 1195,
            "methodName": "handleMessage"
          },
          {
            "className": "android.os.Handler",
            "fileName": "Handler.java",
            "lineNumber": 99,
            "methodName": "dispatchMessage"
          },
          {
            "className": "android.os.Looper",
            "fileName": "Looper.java",
            "lineNumber": 137,
            "methodName": "loop"
          },
          {
            "className": "android.app.ActivityThread",
            "fileName": "ActivityThread.java",
            "lineNumber": 4745,
            "methodName": "main"
          }
        ],
        "innerExceptions": [
          {
            "frames": [
              {
                "className": "android.app.Activity",
                "fileName": "Activity.java",
                "lineNumber": 5084,
                "methodName": "performResume"
              },
              {
                "className": "android.app.ActivityThread",
                "fileName": "ActivityThread.java",
                "lineNumber": 2565,
                "methodName": "performResumeActivity"
              },
              {
                "className": "android.app.ActivityThread",
                "fileName": "ActivityThread.java",
                "lineNumber": 2603,
                "methodName": "handleResumeActivity"
              }
            ]
        }
      ]
    }
  ]
}
```

#### Upload an Apple crash log

To upload an Apple crash log, make sure the log type is set to "appleError".
The following properties are also required:

- `primaryArchitectureId`: required integer with CPU primary architecture.
- `applicationPath`: required string with the path to the application.
- `osExceptionType`: required string with OS exception type.
- `osExceptionCode`: reqiured string with OS exception code
- `osExceptionAddress`: required string with OS exception address

For example:

```shell
curl -X POST \
  'https://in.appcenter.ms/logs?Api-Version=1.0.0' \
  -H 'Content-Type: application/json' \
  -H 'app-secret: 8e14e67c-7c91-40ac-8517-c62ece8424a6' \
  -H 'install-id: 00000000-0000-0000-0000-000000000001' \
  -d '{
  "logs:":
  [
    {
        "type": "appleError",
        "timestamp": "2019-10-08T02:44:55.000Z",
        "appLaunchTimestamp": "2019-09-29T22:22:23.516Z",
        "id": "70D280D4-2343-400D-BE4C-301BB2B39ECA",
        "applicationPath": "iOS/salesforce",
        "osExceptionType": "CustomerIssue (TestIssue)",
        "osExceptionCode": "0",
        "osExceptionAddress": "0x00",
        "processName": "salesforce",
        "fatal": true,
        "isTestMessage": false,
        "device": {
          "appVersion": "10.0",
          "appBuild": "1",
          "sdkName": "custom.ios",
          "sdkVersion": "1.0.0",
          "osName": "iOS",
          "osVersion": "9.3",
          "model": "iPhone9,1",
          "locale": "en-US"
        },
        "userId": "70D280D4-2343-400D-BE4C-301BB2B39ECA",
        "fatal": true,
        "threads": [
         {
          "id": 0,
          "frames": [
            {
              "address": "0x000000018ada4d70",
              "code": "0x18ad87000 + 122224"
            },
            {
              "address": "0x0000000104463884",
              "code": "0x10445c000 + 30852"
            },
            {
              "address": "0x000000010438f640",
              "code": "0x104388000 + 30272"
            },
            {
              "address": "0x00000001b859fb64",
              "code": "0x1b8229000 + 3631972"
            }
          ]
        },
        {
          "id": 1,
          "frames": [
            {
              "address": "0x000000018bb4fce0",
              "code": "0x18baa2000 + 711904"
            },
            {
              "address": "0x000000018bbf7078",
              "code": "0x18baa2000 + 1396856"
            },
            {
              "address": "0x000000018baa8258",
              "code": "0x18baa2000 + 25176"
            },
            {
              "address": "0x000000018bb1c49c",
              "code": "0x18baa2000 + 500892"
            }
          ]
        },
        {
          "id": 3,
          "frames": [
            {
              "address": "0x000000018b755b9c",
              "code": "0x18b732000 + 146332"
            },
            {
              "address": "0x000000018b7dcd00",
              "code": "0x18b7ce000 + 60672"
            }
          ]
        }
      ],
      "binaries": [
        {
          "id": "d449e33d-7e74-379d-8b79-15ee104ed1df",
          "startAddress": "0x0000000104388000",
          "endAddress": "0x0000000104413fff",
          "name": "CrashProbeiOS",
          "path": "/var/containers/Bundle/Application/023013EA-0D58-4F6D-8B98-49E1372F4044/CrashProbeiOS.app/CrashProbeiOS",
          "primaryArchitectureId": 16777228,
          "architectureVariantId": 0
        },
        {
          "id": "5da23653-d126-39f0-bdcf-994b3019f92c",
          "startAddress": "0x000000010445c000",
          "endAddress": "0x0000000104467fff",
          "name": "CrashLibiOS",
          "path": "/private/var/containers/Bundle/Application/023013EA-0D58-4F6D-8B98-49E1372F4044/CrashProbeiOS.app/Frameworks/CrashLibiOS.framework/CrashLibiOS",
          "primaryArchitectureId": 16777228,
          "architectureVariantId": 0
        }
      ]
    }
  ]
}

```


### Upload an error report

Handled errors are only supported for Xamarin, Unity, WPF and WinForms apps today. To upload an error report, make sure the log type is set to "handledError".


```shell
curl -X POST \
  'https://in.appcenter.ms/logs?Api-Version=1.0.0' \
  -H 'Content-Type: application/json' \
  -H 'app-secret: 8e14e67c-7c91-40ac-8517-c62ece8424a6' \
  -H 'install-id: 00000000-0000-0000-0000-000000000001' \
  -d '{
  "logs:":
  [
    {
      "type": "handledError",
      "timestamp": "2019-10-08T06:22:23.516Z",
      "appLaunchTimestamp": "2019-09-29T22:22:23.516Z",
      "id": "118dee14-9193-4ac3-9ef0-f6c11b43f2c4",
      "device": {
        "appVersion": "11.0",
        "appBuild": "1",
        "sdkName": "custom.android",
        "sdkVersion": "1.0.0",
        "osName": "android",
        "osVersion": "9.3",
        "model": "Pixel",
        "locale": "en-US"
      },
      "userId": "TestID",
      "exception": {
        "type": "System.IO.IOException",
        "message": "Server did not respond",
        "stackTrace": "  at Contoso.Forms.Puppet.FakeService+<>c.<DoStuffInBackground>b__0_0 () [0x00000] in <7ad93f134a5d4c00a8db8be9aa9c0f76>:0 \n  at System.Threading.Tasks.Task`1[TResult].InnerInvoke () [0x0000f] in <b38d4262627948c1b945a72f56ce6466>:0 \n  at System.Threading.Tasks.Task.Execute () [0x00010] in <b38d4262627948c1b945a72f56ce6466>:0 \n--- End of stack trace from previous location where exception was thrown ---\n  at System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw () [0x0000c] in <b38d4262627948c1b945a72f56ce6466>:0 \n  at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess (System.Threading.Tasks.Task task) [0x0003e] in <b38d4262627948c1b945a72f56ce6466>:0 \n  at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification (System.Threading.Tasks.Task task) [0x00028] in <b38d4262627948c1b945a72f56ce6466>:0",
        "innerExceptions": [
          {
            "type": "System.IO.IOException",
            "message": "Network down",
            "stackTrace": "  at Contoso.Forms.Demo.CrashesContentPage.SendHttp () [0x00002] in <4fd9174f6e18457b9721bfba2cd78098>:0 ",
            "wrapperSdkName": "appcenter.xamarin"
          },
          {
            "type": "System.ArgumentException",
            "message": "Invalid parameter",
            "innerExceptions": [
              {
                "type": "System.ArgumentOutOfRangeException",
                "message": "It's over 9000!",
                "stackTrace": "  at Contoso.Forms.Demo.CrashesContentPage.ValidateLength () [0x00002] in <4fd9174f6e18457b9721bfba2cd78098>:0 ",
              }
            ],
          }
        ],
      }
    }
  ]
}'
```

### Upload attachments

Please note that all attachments need to be associated with a crash report. You can either upload an attachment with a crash report in one call or in two separate calls.

Attachment specific properties:

- `contentType`: required string with content type, e.g. "text/plain" for text. You can find examples of supported type listed [here](https://en.wikipedia.org/wiki/Media_type).
- `data`: required string with data encoded as base 64
- `errorId` property is the unique identifier that associates the attachment to the right crash report.

Below is an example of uploading a crash report and an attachment in one call.


```shell
curl -X POST \
  'https://in.appcenter.ms/logs?Api-Version=1.0.0' \
  -H 'Content-Type: application/json' \
  -H 'app-secret: 8e14e67c-7c91-40ac-8517-c62ece8424a6' \
  -H 'install-id: 00000000-0000-0000-0000-000000000001' \
  -d '{
  "logs:": [
    {
      "type": "managedError",
      "timestamp": "2019-10-01T02:22:23.516Z",
      "appLaunchTimestamp": "2019-09-29T22:22:23.516Z",
      "id": "bca65f46-46ee-451b-83bb-2e358c3f45bf",
      "fatal": true,
      "processName": "com.microsoft.appcenter.sasquatch.project",
      "device": {
        "appVersion": "13.0",
        "appBuild": "1",
        "sdkName": "appcenter.android",
        "sdkVersion": "1.0.0",
        "osName": "android",
        "osVersion": "9.3",
        "model": "Pixel",
        "locale": "en-US"
      },
      "userId": "118dee14",
      "fatal": true,
      "exception": {
          "type": "CustomerIssue",
          "frames": []
      }
    },
    {
      "type": "errorAttachment",
      "contentType": "text/plain",
      "timestamp": "2019-10-01T02:22:23.516Z",
      "data": "aGVsbG8=",
      "errorId": "bca65f46-46ee-451b-83bb-2e358c3f45bf",
      "device": {
        "appVersion": "13.0",
        "appBuild": "1",
        "sdkName": "appcenter.android",
        "sdkVersion": "1.0.0",
        "osName": "android",
        "osVersion": "9.3",
        "model": "Pixel",
        "locale": "en-US"
      }
    }
  ]
}'
```

