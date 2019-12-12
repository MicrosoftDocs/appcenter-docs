---
title: Android NDK
description: Learn how to symbolicate your Android NDK crash reports
keywords: crashes, Android, NDK, symbolication
author: winnieli1208
ms.author: yuli1
ms.date: 12/11/2019
ms.topic: article
ms.assetid: 6cab50d0-b40a-4b19-9f8f-10aea4243b57
ms.service: vs-appcenter
ms.custom: analytics
---

# Android NDK

Android NDK allows you to implement parts of your Android apps using C and C++. You can use the **Google Breakpad** client library for your Android apps to receive valid stack traces in native code. The stack traces may only contain memory addresses. They don’t show class names, methods, file names, and line numbers needed to read and understand the crashes. To get the memory addresses translated for your Android NDK app, you must upload application symbols for each build.

To learn how to report NDK crashes, refer to the [Android SDK documentation](~/sdk/crashes/android.md#reporting-ndk-crashes) for Android apps, or [Unity SDK documentation](~/sdk/crashes/unity.md#reporting-ndk-crashes) for Unity apps.

If you want to send Breakpad crashes from other platforms to App Center, see the [upload custom crashes documentation](~/diagnostics/upload-crashes.md#upload-a-breakpad-crash-log-and-minidump).

## Generate a .zip file to upload

There are two ways for App Center to retrieve the symbols necessary for symbolication. App Center can generate them from the native binaries used in your project, or you can upload the Breakpad symbols directly.

### Option 1: Upload native binaries
Put all .so files from the project's `obj/local/$ABI/` directory into a .zip file.

### Option 2: Upload Breakpad symbols
1. Dump the symbols using the Breakpad toolchain as described in the [Breakpad documentation](https://chromium.googlesource.com/breakpad/breakpad/+/master/README.ANDROID#93).
2. Create a **symbols.zip** file with the following structure:
> [!NOTE]
> If you are uploading your symbols from macOS, then you must clean your symbols of any extraneous folders, e.g. __MACOS gets generated and to delete this you can use `zip -d <symbols.zip> __MACOSX/\*`.

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
1. If your application has not reported any crash yet, you will need to use the API or CLI to upload Breakpad symbols.
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
