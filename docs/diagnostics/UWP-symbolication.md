---
title: UWP Symbolication
description: Help understanding symbolication for UWP diagnostics in App Center
keywords: crashes, errors, UWP, symbols, symbolication
author: winnieli1208
ms.author: yuli1
ms.date: 10/16/2019
ms.topic: article
ms.assetid: 84e46674-0558-4c95-8f33-b8f4cf8970d6
ms.service: vs-appcenter
ms.custom: analytics 
---

# UWP Symbolication

## Overview

UWP crash reports show the stack trace for the thread that caused the crash. When the application is using .NET Native (typically in release builds) the stack trace may contain memory addresses instead of class names, methods, file names, and line numbers that are needed to read and understand the crashes.

## Uploading symbols

To get these memory addresses translated you need to upload a **.appxsym** file to App Center, which contains all information required for symbolication.

### Generate the Symbols

In order to obtain an **.appxsym** file, you must create an app bundle as described [here](https://docs.microsoft.com/en-us/windows/msix/package/packaging-uwp-apps). Once you have created the bundle, you'll find the symbols file as an **.appxsym** file inside the app bundle folder.

#### Symbols for applications built in App Center Build

If your application is built in App Center, symbols can be downloaded from the build page using the **Download** button.

#### Symbols for applications published to the Microsoft Store

When you publish your application to the store, the .NET Native compilation happens server side. Thus you need to download the symbols from the [Partner Center](https://partner.microsoft.com/en-us/dashboard/windows/overview).

1. Locate your application in the list and click on it.
1. Expand **Product management** menu from the left panel.
1. Click on **Manage packages**.
1. Click on **Show packages** on the top right corner for the **Submission** (version) you want symbols for.
1. Locate the package for the version you need symbols for, and click on links for all the supported architectures to download all symbols (such as the **Download Windows 10 symbol file (x64)** link).

### App Center Portal

1. Log into App Center and select your app.
1. In the left menu, navigate to the **Diagnostics** section, then **Issues**.
1. If your application has not reported any crash yet, in the top-right corner, click **Upload symbols** and upload the **appxsym** files or archives mentioned in the previous sections.
1. If your application already has reported crashes that needs symbols, check the **Unsymbolicated** tab and there should be a version group with missing symbols, click on it to reveal the menu to upload the files.
1. After the symbols file are indexed by App Center, crashes will be symbolicated for you.

### App Center API

1. Trigger a `POST` request to the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_create). 
This call allocates space on our backend for your symbols and returns a `symbol_upload_id` and an `upload_url` property.
2. Using the `upload_url` property returned from the first step, make a `PUT` request with the header: `"x-ms-blob-type: BlockBlob"` and supply the location of your symbols on disk.  This call uploads the symbols to our backend storage accounts. Learn more about [PUT Blob request headers ](https://docs.microsoft.com/en-us/rest/api/storageservices/put-blob#request-headers-all-blob-types).
3. Make a `PATCH` request to  the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_complete) using the `symbol_upload_id` property returned from the first step. In the body of the request, specify whether you want to set the status of the upload to `committed` (successfully completed) the upload process, or `aborted` (unsuccessfully completed).

> [!NOTE]
> The symbol uploads API will not work for symbols files that are 256MB or larger in size. Please use the App Center CLI to upload these files. You can install the App Center CLI by following the instructions in our [App Center CLI repo](https://github.com/microsoft/appcenter-cli).
