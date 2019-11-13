---
title: Upload custom crashes via API
description: Post a crash report, e.g. if you don't want to use our SDK or develop for a custom platform.
keywords: crashes, diagnostics, errors, attachments, upload, api
author: winnieli1208
ms.author: yuli1
ms.date: 11/11/2019
ms.topic: article
ms.assetid: 86ef014e-b47c-4580-82f4-642b2a281e31
ms.service: vs-appcenter
ms.custom: diagnostics
---

# Upload custom crashes via API

You can upload a custom crash report if you don't want to use our SDK or develop for a custom platform. Upload a crash, error, or attachment log to App Center and view the details in the App Center Diagnostics UI.

To upload a report, call the App Center ingestion endpoint at `https://in.appcenter.ms/logs?Api-Version=1.0.0` with the following headers:

- `Content-Type`: describes the format of the body. App Center currently only supports JSON format.
- `App-Secret`: string that is the unique identifier associated with each app. You can find the app secret in the settings of an app.
- `Install-ID`: string that can be any GUID used to keep track of counts.

Log properties:
- `type`: required string with log type - "managedError", "appleError", "handledError" or "errorAttachment".
- `timestamp`: optional string with log timestamp date-time e.g "2017-03-13T18:05:42Z".
- `appLaunchTimestamp`: optional string that specifies timestamp date-time when the app was launched e.g."2017-03-13T18:05:42Z".
- `device`: required object with device characteristics
    - `appVersion`: required string with application version name, e.g. "1.1.0"
    - `appBuild`: required string with application build number, e.g. "42"
    - `sdkName`: required string with name of the SDK. Consists of the name of the SDK and the platform, e.g. "custom.platform"
    - `sdkVersion`: required string with version of the SDK in semantic versioning format, e.g. "1.2.0" or "0.12.3-alpha.1"
    - `osName`: required string with OS name, e.g. "android"
    - `osVersion`: required string with OS version, e.g. "9.3.0"
    - `model`: optional string with device model, e.g. "iPad2"
    - `locale`: required string with language code, e.g. "en-US"
    - `timeZoneOffset`: optional offset in minutes (between -840 and 840) from Coordinated Universal Time (UTC) for the device time zone. Including daylight savings time, e.g. 120
- `userId`: optional string used for associating logs with users
- `exception`: required object with exception details
    - `type`: required string with exception type
    - `frame`: optional array with stack frames
    - `message`: optional string with exception reason
    - `stackTrace`: optional string with raw stack trace
    - `innerException`: optional array with inner exceptions

You can find examples of how to upload a crash report, error report, and attachment below. For more specifications, you can find the complete file [here](https://in.appcenter.ms/preview/swagger.json).

> [!NOTE]
> Due to retention policies, the report `timestamp` must be no more than 25 days in the past or 3 days in the future.

## Upload a crash report

 The following properties are required to upload a crash report:

- `processId`: required integer with process identifier
- `id`: required string with exception identifier
- `fatal`: required boolean that indicates if the exception resulted in a crash
- `processName`: required string with the process name
- `appNamespace`: required for Android apps, otherwise optional string with the bundle identifier, package identifier, or namespace, depending on what platform is used.

To upload a crash report other than the Apple format, make sure the log type is set to "managedError." 

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
        "locale": "en-US",
        "appNamespace": "com.contoso.myapp"
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
}'
```
> [!NOTE]
> To upload a NDK crash, the `wrapperSdkName` field must be set to "appcenter.ndk" and you must attach the minidump file as an attachment to the crash report. Learn how to send an attachment in the [attachments section](~/upload-custom-crashes.md#upload-an-attachment) of this page.

### Upload an Apple crash log

To upload an Apple crash log, make sure the log type is set to "appleError".
The following properties are also required:

- `primaryArchitectureId`: required integer with CPU primary architecture
- `applicationPath`: required string with the path to the application
- `osExceptionType`: required string with OS exception type
- `osExceptionCode`: required string with OS exception code
- `osExceptionAddress`: required string with OS exception address
- `binaries`: required array with binaries associated to the error

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
}'

```


## Upload an error report

Handled errors are only supported for Android, Xamarin, Unity, UWP, WPF, and WinForms apps today. To upload an error report, make sure the log type is set to "handledError".


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

## Upload an attachment

All attachments must be associated with a crash report. You can either upload an attachment with a crash report in one call or in two separate calls.

Attachment-specific properties:

- `contentType`: required string with content type, e.g. "text/plain" for text. You can find examples of supported type listed [here](https://en.wikipedia.org/wiki/Media_type)
- `data`: required string with data encoded as base 64
- `errorId` property is the unique identifier that associates the attachment to the right crash report
- `fileName`: required string for NDK crashes that is set to "minidump.dmp"

> [!NOTE]
> The size limit for attachments is currently 7 MB. Attempting to send a larger attachment will trigger an error.

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
