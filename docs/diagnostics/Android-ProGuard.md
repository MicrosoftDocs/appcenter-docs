---
title: Android ProGuard
description: Learn how to deobfuscate your crash reports with ProGuard enabled
keywords: crashes, errors, Android, obfuscate
author: winnieli1208
ms.author: yuli1
ms.date: 11/01/2019
ms.topic: article
ms.assetid: 2f91bc0e-686c-428a-8cda-2a48b0811a6e
ms.service: vs-appcenter
ms.custom: analytics
---

# Android ProGuard

## Overview

ProGuard is a tool to optimize and obfuscate the code of Android apps. It removes unused code, renames classes, fields, and methods with semantically obscure names, making the code base smaller and harder to reverse engineer. To enable ProGuard in your Android app, follow the [official Android Developer documentation](https://developer.android.com/studio/build/shrink-code#shrink-code).

With ProGuard enabled in your Android app, your stack traces must be deobfuscated. App Center automatically deobfuscates stack traces for your Java, Kotlin, and React Native Android apps when you upload the `mapping.txt` file created by ProGuard on each build. This file maps the original class, method, and field names to the obfuscated names making the stack traces readable.

## Uploading the mapping.txt file

### App Center Portal

1. Download the `proguard/mapping.txt` file from your app module's build directory
1. Log into App Center and select your app
1. In the left menu, navigate to the **Diagnostics** section
1. Select **Mappings**
1. Click the **Upload mappings** button in the upper right
1. Fill in the Version Name and Version Code (these must match that build's Gradle configuration in order for the mapping to work for a particular build)
1. Upload the `mapping.txt` file from your app module's build directory.
1. Click the **Save** button

### App Center API

1. Trigger a `POST` request to the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_create).
This call allocates space on our backend for your symbols and returns a `symbol_upload_id` and an `upload_url` property. The body of the request should specify the `symbol_type` as `AndroidProguard`, `build` and `version` properties that correspond to the Version Code and Version Name, respectively, and a `file_name`.

```shell
curl -X POST 'https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/symbol_uploads' \
    -H 'accept: application/json' \
    -H 'X-API-Token: {API TOKEN}' \
    -H 'Content-Type: application/json' \
    -d '{ "symbol_type": "AndroidProguard", "file_name": "{file name}", "build": "{version code}", "version": "{version name}" }'
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

### App Center CLI

You can also use the CLI to upload mapping files:

```shell
appcenter crashes upload-mappings --mapping {mapping file} --version-name {version name} --version-code {version code}
```

> [!NOTE]
> App Center cannot check if you have uploaded the right `mapping.txt` file. We therefore recommend to upload the file directly after you create the .apk file or push it to your code repository if you want to upload it later.

### Forwarding the mapping from a build in App Center

If a build is [configured to produce a `mapping.txt` file](https://developer.android.com/studio/build/shrink-code), App Center builds produce the file as an available download. Automatically distributing the build or manually distributing it later will forward the `mapping.txt` file onto Diagnostics to deobfuscate incoming crash reports. There is no need to manually upload the `mapping.txt` file after distributing a build.

### Deleting a mapping file

1. Make a `GET` request to the [symbols_list API](https://openapi.appcenter.ms/#/crash/symbols_list). This will retrieve the IDs for the mapping files you uploaded.
2. Make a `DELETE` request to the [symbols_upload API](https://openapi.appcenter.ms/#/crash/symbolUploads_delete) with the mapping file ID. This will delete the specified mapping file.