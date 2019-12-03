---
title: Android Deobfuscation
description: Learn how to deobfuscate your crash reports with ProGuard enabled
keywords: crashes, errors, Android, obfuscate
author: winnieli1208
ms.author: yuli1
ms.date: 11/11/2019
ms.topic: article
ms.assetid: 2f91bc0e-686c-428a-8cda-2a48b0811a6e
ms.service: vs-appcenter
ms.custom: analytics
---

# Android Deobfuscation

## Overview

ProGuard and R8 are tools to optimize and obfuscate the code of Android apps. It removes unused code, renames classes, fields, and methods with semantically obscure names, making the code base smaller and harder to reverse engineer. To enable obfuscation with ProGuard or R8 in your Android app, follow the [official Android Developer documentation](https://developer.android.com/studio/build/shrink-code#shrink-code).

With ProGuard or R8 enabled in your Android app, your stack traces must be deobfuscated. App Center automatically deobfuscates stack traces for your Java, Kotlin, and React Native Android apps when you upload the `mapping.txt` file created on each build. This file maps the original class, method, and field names to the obfuscated names making the stack traces readable.

The App Center Build and Distribution service can automatically generate mapping files and upload them to the Diagnostics service. If you use App Center to build and auto distribute your app to your end users, you don't need to manually obtain and upload the mapping files as detailed in the steps below.

## Uploading the mapping.txt file

### App Center Portal

1. Download the `mapping.txt` file from your app module's build directory
1. Log into App Center and select your app
1. In the left menu, navigate to the **Diagnostics** section
1. Select **Mappings**
1. Click the **Upload mappings** button in the upper right
1. Fill in the Version Name and Version Code (these must match that build's Gradle configuration in order for the mapping to work for a particular build)
1. Upload the `mapping.txt` file from your app module's build directory.
1. Click the **Save** button.

### App Center API
The process for uploading mapping files through the API involves a series of three API calls: one to allocate space on our backend, one to upload the file, and one to update the status of the upload. The body of the first API call should set `symbol_type` to `AndroidProguard`, `build` and `version` properties that correspond to the Version Code and Version Name, respectively, as well as a `file_name`.

[!INCLUDE [symbol upload api](includes/symbol-upload-api.md)]

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
