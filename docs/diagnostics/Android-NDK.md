---
title: Android NDK
description: Learn how to symbolicate your Android NDK crash reports
keywords: crashes, Android, NDK, symbolication
author: king-of-spades
ms.author: kegr
ms.date: 07/18/2020
ms.topic: article
ms.assetid: 6cab50d0-b40a-4b19-9f8f-10aea4243b57
ms.service: vs-appcenter
ms.custom: analytics
---

# Android NDK

Android NDK allows you to implement parts of your Android apps using C and C++. You can use the **Google Breakpad** client library for your Android apps to receive valid stack traces in native code. The stack traces may only contain memory addresses. They don’t show class names, methods, file names, and line numbers which are needed to read and understand the crashes. To get the memory addresses translated for your Android NDK app, you must upload application symbols for each build.

To learn how to report NDK crashes, refer to the [Android SDK documentation](~/sdk/crashes/android.md#reporting-ndk-crashes) for Android apps, or [Unity SDK documentation](~/sdk/crashes/unity.md#reporting-ndk-crashes) for Unity apps.

If you want to send Breakpad crashes from other platforms to App Center, see the [upload custom crashes documentation](~/diagnostics/upload-crashes.md#upload-a-breakpad-crash-log-and-minidump).

## Unsymbolicated crashes

[!INCLUDE [unsymbolicated crashes](includes/unsymbolicated-crashes.md)]

> [!NOTE]
> App Center doesn't support symbolication of frames which come from system libraries.
> Given the high fragmentation of system binaries for Android and other platforms – which might be different on any given device/OS version combination – App Center does not provide symbols itself for system binaries and automatically skips frames from system binaries in symbolication.

[!INCLUDE [generate breakpad symbols payload](includes/generate-breakpad-symbols-payload.md)]

## Uploading symbols
> [!NOTE]
> The App Center Build and Distribution service can automatically forward symbols to the Diagnostics service. If you use App Center to build and auto distribute your app to your end users, you don't need to manually obtain and upload the symbol files as detailed in the steps below.

### App Center Portal

1. Log into App Center and select your app.
1. In the left menu, navigate to the **Diagnostics** section, then **Issues**.
1. If your application hasn't reported any crash yet, you'll need to use the API or CLI to upload Breakpad symbols.
1. If your application already has reported crashes that need symbols, check the **Unsymbolicated** tab and there should be a version group with missing symbols, click on it to reveal the menu to upload the file.
1. After the symbols are indexed by App Center, crashes will be symbolicated for you.

### App Center API

The process for uploading symbols through the API involves a series of three API calls: one to allocate space on our backend, one to upload the file, and one to update the status of the upload. The body of the first API call should set `symbol_type` to `Breakpad`.

[!INCLUDE [symbol upload api](includes/symbol-upload-api.md)]

### App Center CLI
You can also use the CLI to upload symbol files:

```shell
appcenter crashes upload-symbols --breakpad {symbols file}
```

[!INCLUDE [ignoring symbols](includes/ignoring-symbols.md)]
