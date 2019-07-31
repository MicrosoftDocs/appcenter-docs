---
title: Android ProGuard
description: Learn how to deobfuscate your crash reports with ProGuard enabled
keywords: crashes, errors, Android, obfuscate
author: winnieli1208
ms.author: yuli1
ms.date: 07/30/2019
ms.topic: article
ms.assetid: 2f91bc0e-686c-428a-8cda-2a48b0811a6e
ms.service: vs-appcenter
ms.custom: analytics 
---

# Android ProGuard

ProGuard is a tool to optimize and obfuscate the code of Android apps. It removes unused code, renames classes, fields, and methods with semantically obscure names, making the code base smaller and harder to reverse engineer. To enable ProGuard in your Android app, follow the [official Android Developer documentation](https://developer.android.com/studio/build/shrink-code#shrink-code).

With ProGuard enabled in your Android app, your stack traces must be deobfuscated. App Center automatically deobfuscates stack traces for your Java, Kotlin, and React Native Android apps when you upload the `mapping.txt` file created by ProGuard on each build. This file maps the original class, method, and field names to the obfuscated names making the stack traces readable.

## Deobfuscating stack traces

### Uploading the mapping.txt file
1. Download the `proguard/mapping.txt` file from your app module's build directory
2. Log into App Center and select your app
3. In the left menu, navigate to the **Diagnostics** section
4. Select **Mappings**
5. Click the **Upload Mappings** button in the upper right
6. Fill in the Version Name and Version Code (these must match that build's Gradle configuration in order for the mapping to work for a particular build)
7. Upload the `mapping.txt` file from your app module's build directory.
8. Click the **Save** button

> [!NOTE]
> App Center cannot check if you have uploaded the right `mapping.txt` file. We therefore recommend to upload the file directly after you create the .apk file or push it to your code repository if you want to upload it later.

### Forwarding the mapping from a build in App Center

If a build is [configured to produce a `mapping.txt` file](https://developer.android.com/studio/build/shrink-code), App Center builds produce the file as an available download. Automatically distributing the build or manually distributing it later will forward the `mapping.txt` file onto Diagnostics to deobfuscate incoming crash reports. There is no need to manually upload the `mapping.txt` file after distributing a build.

### Deleting a mappings file

1. Make a `GET` request to the [symbols_list API](https://openapi.appcenter.ms/#/crash/symbols_list). This will retrieve the IDs for the mapping files you uploaded.
2. Make a `DELETE` request to the [symbols_upload API](https://openapi.appcenter.ms/#/crash/symbolUploads_delete) with the mapping file ID. This will delete the specified mapping file.