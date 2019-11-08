---
title: Android NDK
description: Learn how to symbolicate your Android NDK crash reports
keywords: crashes, Android, NDK, symbolication
author: winnieli1208
ms.author: yuli1
ms.date: 11/1/2019
ms.topic: article
ms.assetid: 6cab50d0-b40a-4b19-9f8f-10aea4243b57
ms.service: vs-appcenter
ms.custom: analytics
---

# Android NDK

## Overview

Android NDK allows you to implement parts of your Android apps using C and C++. You can use the **Google Breakpad** client library for your Android apps to receive valid stack traces in native code. The stack traces may only contain memory addresses. They don’t show class names, methods, file names, and line numbers needed to read and understand the crashes.

To get the memory addresses translated for your Android NDK app, you must upload symbols for each build using [Google's Breakpad tool](https://github.com/google/breakpad/blob/master/docs/getting_started_with_breakpad.md)

To learn how to report NDK crashes, refer to the [Android SDK documentation](~/sdk/crashes/android.md#reporting-ndk-crashes) for Android apps, or [Unity SDK documentation](~/sdk/crashes/unity.md#reporting-ndk-crashes) for Unity apps.

## Obtaining symbol files

1. Dump the symbols using the Breakpad toolchain as described in the [Breakpad documentation](https://chromium.googlesource.com/breakpad/breakpad/+/master/README.ANDROID#93).
2. Create a **symbols.zip** file with the following structure:

```text
$ unzip -l symbols.zip
Archive:  symbols.zip
  Length     Date   Time    Name
 --------    ----   ----    ----
        0  07-22-13 15:07   symbols/
        0  07-22-13 15:07   symbols/libnative.so/
        0  07-22-13 15:07   symbols/libnative.so/EAC901FB6DDCCE8AED89E1A8E4A58360/
    12468  07-22-13 15:07   symbols/libnative.so/EAC901FB6DDCCE8AED89E1A8E4A58360/libnative.so.sym
        0  07-22-13 15:07   symbols/libnative.so/FDC5C9E715C4F16408C0B78F95855BF0/
    12467  07-22-13 15:07   symbols/libnative.so/FDC5C9E715C4F16408C0B78F95855BF0/libnative.so.sym
 --------                   -------
    24935                   6 files
```

## Uploading symbols

### App Center Portal

1. Log into App Center and select your app.
1. In the left menu, navigate to the **Diagnostics** section, then **Issues**.
1. If your application has not reported any crash yet, in the top-right corner, click **Upload symbols** and upload the zip file.
1. If your application already has reported crashes that need symbols, check the **Unsymbolicated** tab and there should be a version group with missing symbols, click on it to reveal the menu to upload the zip file.
1. After the symbols are indexed by App Center, crashes will be symbolicated for you.

### App Center API

1. Trigger a `POST` request to the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_create).
This call allocates space on our backend for your symbols and returns a `symbol_upload_id` and an `upload_url` property. The body of the request should specify the `symbol_type` as `Breakpad`.

```shell
curl -X POST 'https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/symbol_uploads' \
    -H 'accept: application/json' \
    -H 'X-API-Token: {API TOKEN}' \
    -H 'Content-Type: application/json' \
    -d '{ "symbol_type": "Breakpad" }'
```

2. Using the `upload_url` property returned from the first step, make a `PUT` request with the header: `"x-ms-blob-type: BlockBlob"` and supply the location of your symbols on disk.  This call uploads the symbols to our backend storage accounts. Learn more about [PUT Blob request headers ](https://docs.microsoft.com/rest/api/storageservices/put-blob#request-headers-all-blob-types).

```shell
curl -X PUT '{upload_url}' \
    -H 'x-ms-blob-type: BlockBlob' \
    --upload-file '{path to file}'
```

3. Make a `PATCH` request to  the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_complete) using the `symbol_upload_id` property returned from the first step. In the body of the request, specify whether you want to set the status of the upload to `committed` (successfully completed) the upload process, or `aborted` (unsuccessfully completed).

```shell
curl -X PATCH 'https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/symbol_uploads/{symbol_upload_id}' \
    -H 'accept: application/json' \
    -H 'X-API-Token: {API TOKEN}' \
    -H 'Content-Type: application/json' \
    -d '{ "status": "committed" }'
```

> [!NOTE]
> The symbol uploads API will not work for symbols files that are 256MB or larger in size. Please use the App Center CLI to upload these files. You can install the App Center CLI by following the instructions in our [App Center CLI repo](https://github.com/microsoft/appcenter-cli).

### App Center CLI
You can also use the CLI to upload symbol files:

```shell
appcenter crashes upload-symbols --breakpad {symbols file}
```